package parser

import (
	"io/ioutil"
	"strconv"
	"strings"
)

type CSPData struct {
	Procs       map[int]string   //<procs,p_name>键值对
	MsgChannels map[int]string   //<msg_channels,mc_name>
	Event       map[int]struct{} // events，也即base_prcos
	RootProc    map[int]struct{} // root_procs
	CatchEvents map[int]struct{} // catch_events

	Next   map[int]int
	End    map[int]int
	Init   map[int]map[int]struct{}
	Enable map[int][]int

	//新加的newNext和newEnd
	NewNext map[int]map[int]struct{}
	NewEnd  map[int]map[int]struct{}

	InitEvents map[int]map[int]struct{} // <proc,init_events>的组合
	InitProcs  []int                    // 整个业务的初始进程（可以直接触发）
}

func Parse(filePath string) (*CSPData, error) {
	data, err := ioutil.ReadFile(filePath)
	if err != nil {
		return nil, err
	}

	// 解析数据
	strData := string(data)
	dataArr := strings.Split(strData, "---")
	procs := dataArr[0]
	msgs := dataArr[1] //消息通道编号
	events := dataArr[2]
	rootProcs := dataArr[3]
	next := dataArr[4]
	end := dataArr[5]
	init := dataArr[6]
	enable := dataArr[7]
	//新加的关系
	newNext := dataArr[8]
	newEnd := dataArr[9]

	ret := CSPData{
		Event:       make(map[int]struct{}),
		RootProc:    make(map[int]struct{}),
		Procs:       make(map[int]string),
		MsgChannels: make(map[int]string),
		CatchEvents: make(map[int]struct{}),
		Next:        make(map[int]int),
		End:         make(map[int]int),
		Init:        make(map[int]map[int]struct{}),
		Enable:      make(map[int][]int),
		// ------------------------新加的关系
		NewNext: make(map[int]map[int]struct{}),
		NewEnd:  make(map[int]map[int]struct{}),
		// ------------------------
		InitEvents: make(map[int]map[int]struct{}),
		InitProcs:  make([]int, 0),
	}
	// 解析proc,加入map
	ret.parseIDValue(procs, false)
	// 解析消息通道，加入map
	ret.parseIDValue(msgs, true)
	// 标记event
	//windows下“\r\n”才是换行，记住不要把"\r""\n"分开使用Trim，不然会报错
	events = strings.Trim(events, "\r\n")
	//events = strings.Trim(events, "")
	eventArr := strings.Split(events, ",")
	for _, event := range eventArr {
		if event == "" {
			continue
		}
		id, err := strconv.Atoi(event)
		if err != nil {
			return nil, err
		}
		ret.Event[id] = struct{}{}
	}
	// 标记参与者root进程
	rootProcs = strings.Trim(rootProcs, "\r\n")
	procArr := strings.Split(rootProcs, ",")
	for _, proc := range procArr {
		if proc == "" {
			continue
		}
		id, err := strconv.Atoi(proc)
		if err != nil {
			return nil, err
		}
		ret.RootProc[id] = struct{}{}
	}
	// 记录order（next,end,init）
	parseOrder(next, ret.Next)
	parseOrder(end, ret.End)
	parseListOrder(init, ret.Init)

	// ----新加
	parseListOrder(newNext, ret.NewNext)
	parseListOrder(newEnd, ret.NewEnd)

	//--------------------------------
	// 记录event间的send-catch关系
	enableOrders := strings.Split(enable, "\r\n")
	for _, tmp := range enableOrders {
		enableOrder := strings.Split(tmp, ":")
		if len(enableOrder) != 3 {
			continue
		}
		sendEvents := strings.Split(enableOrder[1], ",")
		catchEvents := strings.Split(enableOrder[2], ",")
		sids := make([]int, 0)
		for _, ev := range sendEvents {
			id, err := strconv.Atoi(ev)
			if err != nil {
				continue
			}
			sids = append(sids, id)
		}
		cids := make([]int, 0)
		for _, cev := range catchEvents {
			cid, err := strconv.Atoi(cev)
			if err != nil {
				continue
			}
			cids = append(cids, cid)
			ret.CatchEvents[cid] = struct{}{}
		}
		if len(sids) == 0 || len(cids) == 0 {
			continue
		}
		for _, sid := range sids {
			ret.Enable[sid] = cids
		}
	}
	hasBefore := make(map[int]struct{}) //有前置活动
	for _, next := range ret.Next {
		hasBefore[next] = struct{}{}
	}
	for _, enables := range ret.Enable {
		for _, enable := range enables {
			hasBefore[enable] = struct{}{}
		}
	}
	// 只有每个参与者的init才可以是初始进程
	initProcs := make(map[int]struct{})
	for rootProc := range ret.RootProc {
		inits := ret.GetInitEvents(rootProc)
		for init := range inits {
			initProcs[init] = struct{}{}
		}
	}
	for event := range ret.Event {
		if _, has := initProcs[event]; !has {
			continue
		}
		if _, has := hasBefore[event]; !has {
			//将没有前置活动的event加入InitProcs(即可以直接触发的活动)
			ret.InitProcs = append(ret.InitProcs, event)
		}
	}
	return &ret, nil
}

//提取next和end关系
func parseOrder(orders string, orderMap map[int]int) error {
	orderArr := strings.Split(orders, "\r\n")
	for _, order := range orderArr {
		pos := strings.Index(order, "=")
		if pos <= 0 {
			continue
		}
		strID := order[:pos]
		id, err := strconv.Atoi(strID)
		if err != nil {
			return err
		}

		strRightID := order[pos+1:]
		rightID, err := strconv.Atoi(strRightID)
		if err != nil {
			return err
		}
		orderMap[id] = rightID
	}
	return nil
}

func (c *CSPData) parseIDValue(data string, isMsgChannel bool) error {
	procArr := strings.Split(data, "\r\n")
	for _, proc := range procArr {
		pos := strings.Index(proc, "=")
		if pos <= 0 {
			continue
		}
		strID := proc[:pos]
		id, err := strconv.Atoi(strID)
		if err != nil {
			return err
		}
		name := proc[pos+1:]
		if !isMsgChannel { //将<id,proc_name>加入map
			c.Procs[id] = name
		} else { //将<id,channel_name>加入map
			c.MsgChannels[id] = name
		}
	}
	return nil
}

//init关系提取
func parseListOrder(orders string, orderMap map[int]map[int]struct{}) error {
	orderArr := strings.Split(orders, "\r\n")
	for _, order := range orderArr {
		pos := strings.Index(order, "=")
		if pos <= 0 {
			continue
		}
		strID := order[:pos]
		id, err := strconv.Atoi(strID)
		if err != nil {
			return err
		}
		if _, ok := orderMap[id]; !ok {
			orderMap[id] = make(map[int]struct{})
		}

		rightArr := strings.Split(order[pos+1:], ",")
		for _, right := range rightArr {
			if right == "" {
				continue
			}
			rightID, err := strconv.Atoi(right)
			if err != nil {
				return err
			}
			orderMap[id][rightID] = struct{}{}
		}
	}
	return nil
}

//返回proc (经过深度搜索得到的)init的所有event
func (c *CSPData) GetInitEvents(proc int) map[int]struct{} {

	if es, ok := c.InitEvents[proc]; ok {
		return es //返回proc init的子进程
	}
	if _, ok := c.Event[proc]; ok {
		// 返回空结构体，因为proc是event原子进程
		return map[int]struct{}{proc: {}}
	}
	es := make(map[int]struct{})
	for k := range c.Init[proc] { // k是proc的子进程
		data := c.GetInitEvents(k)
		for nk := range data {
			es[nk] = struct{}{}
		}
	}

	c.InitEvents[proc] = es
	return es
}
