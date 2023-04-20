package template

import (
	"bytes"
	"strconv"
	"text/template"

	"github.com/txzdream/csp-translator/parser"
)

type procInfo struct {
	Exist   bool
	Name    string
	IsEvent bool
}

//新的结构体
type procInfo2 struct {
	Exist bool
	Name  []string
}
type templateData struct {
	IsEvent      bool
	IsCatchEvent bool
	FunctionName string
	Next         procInfo //next关系
	End          procInfo //end关系
	Init         []string //init关系（即当前进程的子进程）
	Enable       []string
}

//新加的结构体，适应新的生成方法
type templateData2 struct {
	IsCatchEvent bool
	FunctionName string
	Next         procInfo2 //newNext关系
	End          procInfo2 //newEnd关系
	Enable       []string
}

type Template struct {
	Init   []string // 业务的初始进程（不需要前置条件即可触发）
	Procs  []templateData
	Procs2 []templateData2
}

func getNonEventName(id int) string { //中间进程，以id表示（其代表的意义太长）
	return "proc_" + strconv.Itoa(id)
}

//---------原有的生成方法
func Build(data *parser.CSPData, modelPath string) (string, error) {
	tData := Template{
		Procs: make([]templateData, 0),
	}
	//获取业务的初始进程
	for _, initEvent := range data.InitProcs {
		_, isEvent := data.Event[initEvent]
		name := getNonEventName(initEvent)
		if isEvent {
			name = data.Procs[initEvent]
		}
		tData.Init = append(tData.Init, name)
	}
	//获取其他的进程信息和进程关系
	for proc, name := range data.Procs {
		tmp := templateData{
			FunctionName: name,
		}

		_, isEvent := data.Event[proc]
		tmp.IsEvent = isEvent
		if !isEvent {
			tmp.FunctionName = getNonEventName(proc)
		}

		if tmp.IsEvent {
			_, isCatchEvent := data.CatchEvents[proc]
			tmp.IsCatchEvent = isCatchEvent
		}

		if enables, ok := data.Enable[proc]; ok {
			enablesStr := make([]string, 0)
			for _, enable := range enables {
				enableStr := data.Procs[enable]
				enablesStr = append(enablesStr, enableStr)
			}
			tmp.Enable = enablesStr
		}

		if next, ok := data.Next[proc]; ok {
			tmp.Next.Exist = true
			tmp.Next.Name = data.Procs[proc]
			_, isEvent := data.Event[next]
			tmp.Next.IsEvent = isEvent
			if !isEvent {
				tmp.Next.Name = getNonEventName(next)
			}
		}

		if end, ok := data.End[proc]; ok {
			tmp.End.Exist = true
			tmp.End.Name = data.Procs[proc]
			_, isEvent := data.Event[end]
			tmp.End.IsEvent = isEvent
			if !isEvent {
				tmp.End.Name = getNonEventName(end)
			}
		}

		if init, ok := data.Init[proc]; ok {
			for k := range init {
				name := data.Procs[k]
				if _, isEvent := data.Event[k]; !isEvent {
					name = getNonEventName(k)
				}
				tmp.Init = append(tmp.Init, name)
			}
		}

		tData.Procs = append(tData.Procs, tmp)
	}

	tmpl, err := template.ParseFiles(modelPath)
	if err != nil {
		return "", err
	}
	var buff bytes.Buffer
	if err = tmpl.Execute(&buff, tData); err != nil {
		return "", err
	}
	return buff.String(), nil
}

//修改的生成方法
func NewBuild(data *parser.CSPData, modelPath string) (string, error) {
	tData := Template{
		Procs2: make([]templateData2, 0),
	}
	//获取业务的初始进程
	for _, initEvent := range data.InitProcs {
		name := data.Procs[initEvent]
		tData.Init = append(tData.Init, name)
	}
	//获取其他的进程信息和进程关系
	for proc := range data.Event {
		tmp := templateData2{
			FunctionName: data.Procs[proc],
		}

		_, isCatchEvent := data.CatchEvents[proc]
		tmp.IsCatchEvent = isCatchEvent

		if enables, ok := data.Enable[proc]; ok {
			enablesStr := make([]string, 0)
			for _, enable := range enables {
				enableStr := data.Procs[enable]
				enablesStr = append(enablesStr, enableStr)
			}
			tmp.Enable = enablesStr
		}

		if nexts, ok := data.NewNext[proc]; ok {
			tmp.Next.Exist = true
			for k := range nexts {
				name := data.Procs[k]
				tmp.Next.Name = append(tmp.Next.Name, name)
			}
		}

		if ends, ok := data.NewEnd[proc]; ok {
			tmp.End.Exist = true
			for k := range ends {
				name := data.Procs[k]
				tmp.Next.Name = append(tmp.Next.Name, name)
			}
		}

		tData.Procs2 = append(tData.Procs2, tmp)
	}

	tmpl, err := template.ParseFiles(modelPath)
	if err != nil {
		return "", err
	}
	var buff bytes.Buffer
	if err = tmpl.Execute(&buff, tData); err != nil {
		return "", err
	}
	return buff.String(), nil
}

//去除接收事件（即enable关系）的生成方法
func NewBuild2(data *parser.CSPData, modelPath string) (string, error) {
	tData := Template{
		Procs2: make([]templateData2, 0),
	}
	//获取业务的初始进程
	for _, initEvent := range data.InitProcs {
		name := data.Procs[initEvent]
		tData.Init = append(tData.Init, name)
	}
	//获取其他的进程信息和进程关系
	for proc := range data.Event {
		tmp := templateData2{
			FunctionName: data.Procs[proc],
		}

		_, isCatchEvent := data.CatchEvents[proc]
		tmp.IsCatchEvent = isCatchEvent

		if enables, ok := data.Enable[proc]; ok {
			enablesStr := make([]string, 0)
			for _, enable := range enables {
				enableStr := data.Procs[enable]
				enablesStr = append(enablesStr, enableStr)
			}
			tmp.Enable = enablesStr
		}

		if nexts, ok := data.NewNext[proc]; ok {
			tmp.Next.Exist = true
			for k := range nexts {
				name := data.Procs[k]
				tmp.Next.Name = append(tmp.Next.Name, name)
			}
		}

		if ends, ok := data.NewEnd[proc]; ok {
			tmp.End.Exist = true
			for k := range ends {
				name := data.Procs[k]
				tmp.Next.Name = append(tmp.Next.Name, name)
			}
		}

		tData.Procs2 = append(tData.Procs2, tmp)
	}

	tmpl, err := template.ParseFiles(modelPath)
	if err != nil {
		return "", err
	}
	var buff bytes.Buffer
	if err = tmpl.Execute(&buff, tData); err != nil {
		return "", err
	}
	return buff.String(), nil
}
