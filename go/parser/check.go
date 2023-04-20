package parser

import "fmt"

func (c *CSPData) dfs(proc int, ancestor map[int]struct{}, path []int) (bool, []int) {
	path = append(path, proc)
	if _, has := ancestor[proc]; has {
		return true, path
	}
	ancestor[proc] = struct{}{}
	next, ok := c.Next[proc]
	nextEvs := make([]int, 0)
	if ok {
		nextInits := c.GetInitEvents(next)
		for k := range nextInits {
			nextEvs = append(nextEvs, k)
		}
	}
	enables, ok := c.Enable[proc]
	if ok {
		nextEvs = append(nextEvs, enables...)
	}
	for _, next := range nextEvs {
		has, path := c.dfs(next, ancestor, path)
		if has {
			return true, path
		}
	}
	delete(ancestor, proc)
	return false, nil
}

func (c *CSPData) CheckDeadlock() ([]int, bool) {
	for proc := range c.Procs {
		traveledMap := make(map[int]struct{})
		travelPath := make([]int, 0)
		has, path := c.dfs(proc, traveledMap, travelPath)
		if has {
			return path, true
		}
	}
	return nil, false
}

func PrintCycle(c *CSPData, chain []int) {
	repeated := chain[len(chain)-1]
	start := 0
	for i, proc := range chain {
		if proc == repeated {
			start = i
			break
		}
	}
	for i := start; i < len(chain)-1; i++ {
		proc := chain[i]
		firstName := c.Procs[proc]
		secondName := c.Procs[chain[i+1]]
		fmt.Printf("%30v(%2v) next or enable %v(%v)\n", firstName, proc, secondName, chain[i+1])
	}
}
