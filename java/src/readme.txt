VSCode报错不一定有问题（关于DEF与definition的问题已修改）
在不同电脑上运行时需要edit build path将antlr的jar包修改一下访问路径
Csp.g4是修改后的，可以处理(A[]B)->STOP

方法：
读取到： 
    A和B都有可能是复合进程（直接读取的都是String形式）
    A;B                    A next B,  p init A,     B end p    
    (proc)                            p init proc   proc end p
    A[]B                              p init A/B    A/B end p
    ||(未实现)
     ->               实现了，但处理的一般是A->STOP,A还是简单的形式
    
    c?v 
    c!v

等模式时，将其内容(整体，以及内容都会)加到procs中，并增加4个关系的内容

目前enable关系的内容无需修改，

visit()  深度优先搜索（后续遍历），因此先读到的一定是c!v/c?v形式的A，B
next内容需简化，init,end仅针对复合进程保留
具体：
    碰到  复合进程(proc),A[]B（A，B也都可能是复合进程）时，操作init end（暂时不变，后续考虑）
    碰到 A;B时：
          1）对于c!v/c?v形式的A，B，存A.v next B.v（没有end和Init的增加） 需要增加

          2）对于复合进程，取A.end next B.init(即考虑复合的代号，之后再考虑下面的内容)

          上述考虑错误，A=C;D，A;B=C;D;B时，此时不将C;D看做复合进程时，无end（、init）关系，因此 1）需要增加end,init（但单纯的c!v和c?v不存）
          但是这样的话，化简不了多少。
          
          (或者换一种思路：若A=C;D，取D.v，B=E;F，取B.v；其余时刻都有end和 init关系
          但是C;D也可能是复合类型，因此需要进一步向下遍历？ 需要暴力模式匹配，不太行！

          （暂时可不改）
          A和B存在复合时（则复合进程的init，end已经保存了），则A.end(s) next B.init(s)  (end和init都可能有多个，此时A或B为复合进程)  
          原本next因为复合进程的存在，是Map<Integer, Integer>的形式，但现在因为要删掉很多复合进程，需要修改为Map<Integer, ArrayList<Integer>>(end可暂时不用)


从遍历语法树所得到的结果再进一步提取关联关系：
         next： 首先获取对应的event编号（end关系）
                   1. 如果该event无next关系，则向上继续访问
                   2. 如果访问到root进程，则说明只有end关系，结束;
                   3. 访问到某个父节点f含有next关系时，令s = next[f];
                      则沿着s向下访问其init关系,即s_child = init[s],直至s_child为base
                bool find = false;
                father = end[A]
                while(true){
                    if(nextMap.containsKey(father)){
                        find = true;
                        break;
                    }else{
                        father = end[father];
                    }
                    if(rootProcsMap.containsKey(father)){
                        break;
                    }
                }

                ArrayList<Integer> tempNext;
                if(find){
                    s = initMap[nextMap[father]];
                    ArrayList<Integer> children = s.entrySet().getValue();
                    for(int i = 0; i < children.size(); i ++){
                        Integer child = children.get(i);
                        while(true){
                            if(baseMap.containsKey(child)){
                                break;
                            }else{
                                child = initMap[child];
                            }
                        }
                    }    
                    }
                }


## 之前的提取程序存在问题：broker  supplier(当出现 （A[]B）-> SKIP)时，不能正确识别 -> (语法树中也无->SKIP)



activate：
        for proc in AtomicProcesses

            search up with End[] recursively until find p that Next[End[p]] exists // p; 
            f = Next[End[p]]; 
            for sub in Init[f]
				aps =  FindAtomicProceessesWithInit(sub); //aps is an array
				Activate[proc] = aps 

Inactivate：
        for proc in ExclusveGateProces
            LeftAtomicProcesses = FindAtomicProceessesWithInit(Xor[proc][1]); //
            RightAtomicProcesses = FindAtomicProceessesWithInit(Xor[proc][2])
            
            for left in LeftAtomicProcesses
            	Inactivate[left] = RightAtomicProcesses
            
            for right in RightAtomicProcesses
            	Inactivate[right] = LeftAtomicProcesses

Parallel
       for proc in ParallelGateProces
            LeftAtomicProcesses = FindTheLastAtomicProceessesWithInit(And[proc][1]);
            RightAtomicProcesses = FindTheLastAtomicProceessesWithInit(And[proc][2])
            
            for left in LeftAtomicProcesses
            	Parallel[left] = RightAtomicProcesses
            
            for right in RightAtomicProcesses
            	Parallel[right] = LeftAtomicProcesses