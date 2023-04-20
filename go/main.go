package main

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"

	"github.com/txzdream/csp-translator/parser"
	"github.com/txzdream/csp-translator/template"
)

func main() {
	reduction := true
	// brokerPath := filepath.Join("csp/data/all.txt")
	// brokerPath := filepath.Join("csp/booking-travel/res.txt")
	// brokerPath := filepath.Join("csp/online-education/res.txt")
	// brokerPath := filepath.Join("csp/paper-review/res.txt")
	// brokerPath := filepath.Join("csp/pastry-cook/res.txt")
	// brokerPath := filepath.Join("csp/supply-chain/res.txt")
	brokerPath := filepath.Join("../rel.txt") // 获得顺序关系后的csp语句的路径
	// brokerPath := filepath.Join("csp/supply-chain-2/res.txt")
	// brokerPath := filepath.Join("csp/deadlock/res.txt")
	broker, err := parser.Parse(brokerPath) // broker为保存各个关系的结构体
	if err != nil {
		panic(err)
	}
	path, hasCycle := broker.CheckDeadlock()
	if hasCycle {
		// fmt.Println(path)
		parser.PrintCycle(broker, path)
		panic("cycle found")
	}
	//合约文件的存放路径
	//wpath := filepath.Join("supply-chain.sol")
	wpath := filepath.Join("../contract.sol")
	wfile, err := os.OpenFile(wpath, os.O_WRONLY|os.O_CREATE, 0666)
	if err != nil {
		//fmt.Println("File Open Failed!", err)
		panic(err)
	}
	defer wfile.Close()
	write := bufio.NewWriter(wfile)

	if reduction {
		modelPath := filepath.Join("template/contract2.tmpl")
		contract, err := template.NewBuild(broker, modelPath)
		if err != nil {
			panic(err)
		}
		fmt.Println(contract)
		len, err := write.WriteString(contract)
		if err != nil {
			fmt.Print(len)
			panic(err)
		}
		//fmt.Println(contract)

	} else {
		// if reduction {
		modelPath := filepath.Join("template/contract.tmpl")
		contract, err := template.Build(broker, modelPath)
		if err != nil {
			panic(err)
		}
		fmt.Println(contract)
		write.WriteString(contract)
		// }
	}
}
