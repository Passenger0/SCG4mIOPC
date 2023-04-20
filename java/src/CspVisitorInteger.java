import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.xml.soap.Text;

import org.antlr.v4.runtime.tree.TerminalNode;

import parser.CspBaseVisitor;
import parser.CspParser;
import parser.CspParser.AnyContext;
import parser.CspParser.CatchContext;
import parser.CspParser.DEFContext;
import parser.CspParser.ECHOICEContext;
import parser.CspParser.EventContext;
import parser.CspParser.IDContext;
import parser.CspParser.INTLContext;
import parser.CspParser.ProcContext;
import parser.CspParser.SendContext;

public class CspVisitorInteger extends CspBaseVisitor<Integer>{
	public Map<Integer, String> procs;  // proc Id（包括子进程和复合进程）
	public Map<Integer, String> msgChannels; //消息通道标识
	public Map<String, Integer> reverseProcs;

	//收发消息的基进程c!v,c?v中的v
	public Map<Integer, Integer> baseProcsMap;
	//各参与者总复合进程id
	public Map<Integer, Integer> rootProcsMap;//各参与者总复合进程id
	
	public Map<Integer, Integer> nextMap; //next 关系
	public Map<Integer, Integer> endMap; //end 关系
	//public Map<Integer, ArrayList<Integer>> nextMap; //next 关系
	//public Map<Integer, ArrayList<Integer>> endMap; //end 关系,A end B
	//public Map<Integer, ArrayList<Integer>> endMeMap; //end 关系 Bs end A
	public Map<Integer, ArrayList<Integer>> initMap; //init关系
	public Map<Integer, ArrayList<Integer>> msgProcSendMap; //enable相关的发送者
	public Map<Integer, ArrayList<Integer>> msgProcCatchMap;//enable相关的接收者
	public Integer procCntInteger;

	public Map<Integer, ArrayList<Integer>> newNextMap; //new next 关系
	public Map<Integer, ArrayList<Integer>> newEndMap; //new end 关系
	ArrayList<Integer>  echoiceProc;

	//去除接收事件的新的关系
	public Map<Integer, ArrayList<Integer>> ActivateMap; // 关系
	public Map<Integer, ArrayList<Integer>> InactivateMap; //new end 关系
	//无 newInit,不需要，新提取的关系将转化到原子进程上，所以init也将被转移到newNext

	
	public CspVisitorInteger() {
		this(0);
	}
	public Integer getKey(Map<Integer, String> map, String value){
		for(Integer key: map.keySet()){
			if(map.get(key).equals(value)){
				return key;
			}
		}
		return -1;
	}
	public CspVisitorInteger(Integer startCounter) {
		//和procs保存相反的内容， <csp语义，进程id>
		reverseProcs = new HashMap<String, Integer>();
		// proc Id（包括c,v,c!v/c?v和复合进程,过多了）
		procs = new HashMap<Integer, String>(); 
		msgChannels = new HashMap<Integer, String>();//消息通道标识
		//收发消息的基进程c!v,c?v中的v
		baseProcsMap = new HashMap<Integer, Integer>(); 
		//各参与者总复合进程id
		rootProcsMap = new HashMap<Integer, Integer>();
		
		nextMap = new HashMap<Integer, Integer>();//next 关系
		endMap = new HashMap<Integer, Integer>();//end 关系
		newNextMap = new HashMap<Integer, ArrayList<Integer>>(); //next 关系
		newEndMap = new HashMap<Integer, ArrayList<Integer>>(); //end 关系
		initMap = new HashMap<Integer, ArrayList<Integer>>();//init关系
		msgProcSendMap = new HashMap<Integer, ArrayList<Integer>>();//enable相关的发送者
		msgProcCatchMap = new HashMap<Integer, ArrayList<Integer>>();//enable相关的接收者

		echoiceProc = new ArrayList<Integer>();
		
		procCntInteger = 0;
	}
	
    /**
     * 将ctx加入baseProcMap
     * @param ctx  //the parse tree
     */
	private int manageProc(String ctx) {
		return manageProc(ctx, false, false);
	}
	private int manageMsgChannel(String ctx) {
		return manageProc(ctx, false, true);
	}
    private int manageProc(String ctx, boolean isEvent, boolean isMsg) {
    	// 获取a -> skip/stop 的进程,但是a是叶子结点，我们用不到
//    	if (ctx.getChildCount() == 3 && ctx.children.get(0).getChildCount() == 0   
//    				&& ctx.children.get(1).getText() == CspParser.ruleNames[CspParser.ARROW]
//    						&& (ctx.children.get(2).getChild(0).getText() == CspParser.ruleNames[CspParser.Skip]
//    								|| ctx.children.get(2).getChild(0).getText() == CspParser.ruleNames[CspParser.Stop])) {
//			procs.put(procCntInteger, ctx.getText());
//			return procCntInteger++;
//    	}
//    	return -1;
    	if (reverseProcs.containsKey(ctx)) {
    		Integer idInteger = reverseProcs.get(ctx);
    		if (isEvent) {
    			baseProcsMap.put(idInteger, 1);
    		}
    		return reverseProcs.get(ctx);
    	}
    	if (isMsg) {
    		msgChannels.put(procCntInteger, ctx);
    	} else {
    		procs.put(procCntInteger, ctx);
			// System.out.print(procCntInteger); // 数字编号
			// System.out.print("=");
			// System.out.println(ctx);
    	}
    	reverseProcs.put(ctx, procCntInteger);


    	if (isEvent) {
    		baseProcsMap.put(procCntInteger, 1);
    	}
		return procCntInteger++;
    }
    
    private void manageMsgChannelProc(Integer chan, Integer proc, boolean isSend) {
		if (isSend) {
			//如果是新的消息通道，创建对应的发送/接收事件数组，将对应的接收/发送事件proc添加到对应数组
			if (!msgProcSendMap.containsKey(chan)) {
	    		ArrayList<Integer> tmpArrayList = new ArrayList<Integer>();
	    		msgProcSendMap.put(chan, tmpArrayList);
			}
			msgProcSendMap.get(chan).add(proc);
		} else {
			if (!msgProcCatchMap.containsKey(chan)) {
	    		ArrayList<Integer> tmpArrayList = new ArrayList<Integer>();
	    		msgProcCatchMap.put(chan, tmpArrayList);
			}
			msgProcCatchMap.get(chan).add(proc);
		}
	}
    
    private void manageNext(Integer first, Integer second) {
    	nextMap.put(first, second);

		// if (!nextMap.containsKey(first)) {
    	// 	ArrayList<Integer> tmpArrayList = new ArrayList<Integer>();
    	// 	initMap.put(first, tmpArrayList);
    	// }
    	// nextMap.get(first).add(second);
    }

    private void manageEnd(Integer first, Integer second) {
    	endMap.put(first, second);

		// if (!endMap.containsKey(first)) {
    	// 	ArrayList<Integer> tmpArrayList = new ArrayList<Integer>();
    	// 	initMap.put(first, tmpArrayList);
    	// }
    	// endMap.get(first).add(second);
    }

    private void manageInit(Integer first, Integer second) {
		//first init second(s)
    	if (!initMap.containsKey(first)) {
    		ArrayList<Integer> tmpArrayList = new ArrayList<Integer>();
    		initMap.put(first, tmpArrayList);
    	}
    	initMap.get(first).add(second);
    }
    
    
    @Override
    public Integer visitDEF(DEFContext ctx) {
    	visitChildren(ctx); //antlr内部接口,遍历ctx的子节点，并返回
    	AnyContext def = ctx.any();
    	String textString = def.getText();//字符串形式的语法树
    	textString = textString.substring(0, textString.length()-1);
		//根据语法树textString增加rootProc和baseProcMap
    	Integer defIDInteger = manageProc(textString);
    	rootProcsMap.put(defIDInteger, 1);
    	
    	return defIDInteger;
    }
    
    @Override  //A;B    A,B都是proc
    public Integer visitSEMICOL(CspParser.SEMICOLContext ctx) {
    	visitChildren(ctx);
    	ProcContext LeftProc = ctx.proc(0); // 左子树代表左子进程
    	ProcContext rightProc = ctx.proc(1); //右子树代表右子进程
    	//获取左右子进程，分别新增复合进程，A，B
    	Integer procID = manageProc(ctx.getText());
    	Integer leftID = manageProc(LeftProc.getText());
    	Integer rightID = manageProc(rightProc.getText());
    	
		//A,B构成next关系，B和（A;B）是end关系，复合进程与A是init关系
    	//原版
		manageNext(leftID, rightID);
    	manageEnd(rightID, procID);
    	manageInit(procID, leftID);
		//*/
		// Integer nextLeft,nextRight;
		
		// if(LeftProc.children.get(1).getText() == "!"
		// 	|| LeftProc.children.get(1).getText() == "?"){
			
		// 	String v = LeftProc.children.get(2).getText();
		// 	nextLeft = reverseProcs.get(v);//getKey(procs, v);
		// }else{
			
		// }




		// if(rightProc.children.get(1).getText() == "!"
		// 	|| rightProc.children.get(1).getText() == "?"){
			
		// 	String v = rightProc.children.get(2).getText();
		// 	nextRight = reverseProcs.get(v);//getKey(procs, v);
		// }

		return procID;
    }
    
    @Override
    public Integer visitARROW(CspParser.ARROWContext ctx) {
		//已经可以处理 (A[]B)->STOP
    	visitChildren(ctx);

    	ProcContext rightProc = ctx.proc().get(1);
    	ProcContext left = ctx.proc().get(0);
    	Integer procID = manageProc(ctx.getText());
		//System.out.println(ctx.getText());
    	// 
		//将A->B中A的事件进程增加到baseProcMap
    	Integer leftID = manageProc(left.getText(), false, false);
    	//如果B不是SKIP,STOP,则将内容及形成的关系增加到解析结果中
		if (!(rightProc.getText().equals("SKIP")
    			|| rightProc.getText().equals("STOP"))) {
	    	Integer rightProcID = manageProc(rightProc.getText());
	    	
	    	manageNext(leftID, rightProcID);
	    	manageEnd(rightProcID, procID);
	    	manageInit(procID, leftID);
    	} else {
			
    		manageInit(procID, leftID);
    		manageEnd(leftID, procID);
    	}
    	
    	return procID;
    }
    
    @Override
    public Integer visitINTL(INTLContext ctx) {  // |||符号，暂时用不上，处理内容类似echoice，（即or）
    	visitChildren(ctx);
    	ProcContext LeftProc = ctx.proc(0);
    	ProcContext rightProc = ctx.proc(1);
    	
    	Integer procID = manageProc(ctx.getText());
    	Integer leftID = manageProc(LeftProc.getText());
    	Integer rightID = manageProc(rightProc.getText());
    	
    	manageEnd(leftID, procID);
    	manageEnd(rightID, procID);
    	manageInit(procID, leftID);
    	manageInit(procID, rightID);
    	
    	return procID;
    }
    
    @Override
	// deal with "A[]B"
    public Integer visitECHOICE(ECHOICEContext ctx) {
    	visitChildren(ctx);
    	
    	ProcContext LeftProc = ctx.proc(0); // A
    	ProcContext rightProc = ctx.proc(1); //B
    	
    	Integer procID = manageProc(ctx.getText());
    	Integer leftID = manageProc(LeftProc.getText());
    	Integer rightID = manageProc(rightProc.getText());
    	manageEnd(leftID, procID);
    	manageEnd(rightID, procID);
    	manageInit(procID, leftID);
    	manageInit(procID, rightID);
		echoiceProc.add(procID);
		// what to do?
    	// TODO: 浠绘剰涓�涓紑濮嬫墽琛屽悗锛屽叾浠栫殑閮戒笉鍙啀鎵ц
    	
    	return procID;
    }
	
	@Override
	// deal with "(proc)"
	public Integer visitParen(CspParser.ParenContext ctx) {
		visitChildren(ctx);
		
    	Integer procID = manageProc(ctx.getText());// for (proc)
    	Integer subProcID = manageProc(ctx.proc().getText()); //for proc

    	manageInit(procID, subProcID);
    	manageEnd(subProcID, procID);
    	return procID;
	}
	
	@Override
	// A?B(接收消息)
	public Integer visitCatch(CatchContext ctx) {
		visitChildren(ctx);
		// 
		// A的内容
    	Integer msgChannelID = manageMsgChannel(ctx.ID(0).getText());
    	// B的内容
		Integer procID = manageProc(ctx.ID(1).getText(), true, false);
    	manageMsgChannelProc(msgChannelID, procID, false);

    	//original
		Integer totalID = manageProc(ctx.getText());
		manageInit(totalID, procID);
    	manageEnd(procID, totalID);

		//new,only save "v" in "c!v/c?v", no save on "c!v/c?v"
		//manageProc(ctx.getText());
    	
    	return -1;
	}
	
	@Override
	// deal with A!B
	public Integer visitSend(SendContext ctx) {
		visitChildren(ctx);
		// A's content
    	Integer msgChannelID = manageMsgChannel(ctx.ID(0).getText());
    	// B's content
		Integer procID = manageProc(ctx.ID(1).getText(), true, false);
    	//
		manageMsgChannelProc(msgChannelID, procID, true);
    	
    	Integer totalID = manageProc(ctx.getText());
    	manageInit(totalID, procID);
    	manageEnd(procID, totalID);
    	
    	return -1;
	}

	public ArrayList<Integer> nextBase(Integer father){
		///int count = 0;
		//System.out.println("nextBase: "+ procs.get(father));
		ArrayList<Integer> next = new ArrayList<Integer>();
		//while(true){   // 不要这个while，否则会出问题
			
			if(baseProcsMap.containsKey(father) == true){
				next.add(father);
				//System.out.println("Yes");
				//break;
				return next;
			}else{
				//System.out.println("No");
				ArrayList<Integer> children = initMap.get(father);
				//System.out.println(children.size());
				for(int i = 0; i < children.size(); i ++){
					Integer child = children.get(i);
					ArrayList<Integer> n = nextBase(child);
					for(int j = 0; j < n.size(); j++){
						next.add(n.get(j));
					}
					
				}
			}
			// if((++ count ) == 5) {
			// 	//System.out.println("5");
			// 	//break;
			// }
		//}
		return next;
	}
	public void addNewNext(Integer base){
		//System.out.println("up: "+ procs.get(base));
		Integer father = endMap.get(base);
		// 向上，寻找公共父节点的右子节点
		Integer s = -1; // 公共父节点的右子节点
		//死循环，father会变为bull（最开始不是）
		while(true) {
			//System.out.println("upfather: "+ procs.get(father)); 
			if(nextMap.containsKey(father)){
				//find = true;
				s = nextMap.get(father);
				break; //
			}else{
				father = endMap.get(father);
			}
			if(rootProcsMap.containsKey(father)){
				break;
			}
		}
		//System.out.println("down: "+ procs.get(s));
		//向下，寻找具有公共父节点的base_procs
		if(s > -1){
			ArrayList<Integer> tempNext = new ArrayList<Integer>();//存储将与base组成next关系的base_procs
			ArrayList<Integer> children = initMap.get(s);
			//System.out.println(children.size());
			for(int i = 0; i < children.size(); i ++){
				Integer child = children.get(i);
				ArrayList<Integer> n = nextBase(child);
				for(int j = 0; j < n.size(); j++){
					tempNext.add(n.get(j));
				}
			}
			newNextMap.put(base,tempNext);

		}



	}
	public void addNewEnd(Integer father){
		Integer leftChild = initMap.get(father).get(0);
		Integer rightChild = initMap.get(father).get(1);
		ArrayList<Integer>leftBases = nextBase(leftChild);
		ArrayList<Integer> rightBases = nextBase(rightChild);
		for(int i = 0; i < leftBases.size(); i++){
			newEndMap.put(leftBases.get(i),rightBases);
		}
		for(int j = 0; j < rightBases.size(); j++){
			newEndMap.put(rightBases.get(j),leftBases);
		}

	}

	//get newNext and newEnd
	public void manageNewNextAndEnd(){
		// Integer proc_base = 0;
		// Integer count = 0;
		// Integer baseProcsCount = baseProcsMap.size();
		//int count = 0;
		for(Entry<Integer, Integer> base: baseProcsMap.entrySet()){
			//System.out.println("manage: "+ procs.get(base.getKey()));
			addNewNext(base.getKey());
			// if((++ count ) == 5)
			// 	break; // base =32,1,65,35,ok   4,err,在nextBase
		}
		for(int i = 0; i < echoiceProc.size(); i++){
			addNewEnd(echoiceProc.get(i));
		}
		/*
		while(true){
			if(baseProcsMap.containsKey(proc_base)){
				count ++;
				addNewNext(proc_base);
			}

			if(count == baseProcsCount){
				break;
			}else{
				proc_base ++;
			}
		}*/
		
	}
}
