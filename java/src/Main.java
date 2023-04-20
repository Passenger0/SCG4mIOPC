import java.io.*;
import java.util.ArrayList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;

import org.antlr.v4.parse.ANTLRParser.id_return;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.omg.CORBA.portable.ValueBase;

import parser.CspLexer;
import parser.CspParser;
import parser.CspParser.SendContext;

public class Main {

	public static void main(String[] args) throws IOException {
		ArrayList<String> expressions = getCspContent();
		Integer startProcCounterInteger = 0;
		CspVisitorInteger visitor = new CspVisitorInteger(startProcCounterInteger);;
		for (int i = 0; i < expressions.size(); i++) {
			String expression = expressions.get(i);
			String[] expStrings = expression.split("\n");
//			for (int j = 0; j < expStrings.length; j++) {
//				expression = expStrings[j];
			if (expression.replace("\r", "").replace("\n", "")
					.replace("\t", "").replace(" ", "").length() == 0) {
				continue;
			}
			// System.out.println(expression);

			CspLexer lexer = new CspLexer(CharStreams.fromString(expression));
	        CommonTokenStream tokens = new CommonTokenStream(lexer);
	        CspParser parser = new CspParser(tokens);
	        parser.setBuildParseTree(true);
	        ParseTree root = parser.spec();
	        
	        visitor.visit(root);
			visitor.manageNewNextAndEnd();
	        startProcCounterInteger = visitor.procCntInteger;
	     
		}
	    print(visitor);
		//printOrder(visitor.rootProcsMap);
        //System.out.println("---");
		// System.out.println("---");
		// printListOrder(visitor.procs,visitor.newNextMap);
		//System.out.println("---");
		//printListOrder(visitor.procs,visitor.newEndMap);

	}
	
	private static void print(CspVisitorInteger visitor) {
		//System.out.println("===");
		// 打印proc
		for (Entry<Integer, String> proc : visitor.procs.entrySet()) {
			System.out.print(proc.getKey()); // 数字编号
			System.out.print("=");
			System.out.println(proc.getValue()); // CSP语句内容
		}
		System.out.println("---");
		// 打印消息通道标识
		for (Entry<Integer, String> event : visitor.msgChannels.entrySet()) {
			System.out.print(event.getKey());
			System.out.print("=");
			System.out.println(event.getValue());
		}
		System.out.println("---");
		// 打印收发event对应的proc
		for (Entry<Integer, Integer> event : visitor.baseProcsMap.entrySet()) {
			System.out.print(event.getKey());
			System.out.print(",");
		}
		System.out.println("\n---");
		// 打印参与者主进程对应的proc
		for (Entry<Integer, Integer> process : visitor.rootProcsMap.entrySet()) {
			System.out.print(process.getKey());
			System.out.print(",");
		}
		System.out.println("\n---");
		// 原版
		// 打印next、end和init
		printOrder(visitor.nextMap);
		System.out.println("---");
		printOrder(visitor.endMap);
		System.out.println("---");
		
		printListOrder(visitor.initMap);
		System.out.println("---");
		// 打印enable
		for (Entry<Integer, String> event : visitor.msgChannels.entrySet()) {
			System.out.print(event.getKey()); //消息通道
			System.out.print(":");			
			ArrayList<Integer> send = visitor.msgProcSendMap.get(event.getKey());
			ArrayList<Integer> catchEvent = visitor.msgProcCatchMap.get(event.getKey());
			if (send != null) {
				for (int i = 0; i < send.size(); i++) {
					System.out.print(send.get(i));
					System.out.print(",");
				}
			}
			System.out.print(":");
			if (catchEvent != null) {
				for (int i = 0; i < catchEvent.size(); i++) {
					System.out.print(catchEvent.get(i));
					System.out.print(",");
				}
			}
			System.out.println();
		}
		System.out.println("---");
		printListOrder(visitor.newNextMap);
		System.out.println("---");
		printListOrder(visitor.newEndMap);
	}
	
	private static void printOrder(Map<Integer, Integer> data) {
		for (Entry<Integer, Integer> order : data.entrySet()) {
			System.out.print(order.getKey());
			System.out.print("=");
			System.out.print(order.getValue());
			System.out.println();
		}
	}
	
	// private static void printListOrder(Map<Integer, String>procs,Map<Integer, ArrayList<Integer>> data) {
	// 	for (Entry<Integer, ArrayList<Integer>> order : data.entrySet()) {
	// 		System.out.print(procs.get(order.getKey()));
	// 		System.out.print("=");
	// 		ArrayList<Integer>  Value =order.getValue();
	// 		for (int i = 0; i < Value.size(); i++) {
	// 			System.out.print(procs.get(Value.get(i)));
	// 			System.out.print(",");
	// 		}
	// 		System.out.println();
	// 	}
	// }
	private static void printListOrder(Map<Integer, ArrayList<Integer>> data) {
		for (Entry<Integer, ArrayList<Integer>> order : data.entrySet()) {
			System.out.print(order.getKey());
			System.out.print("=");
			ArrayList<Integer>  Value =order.getValue();
			for (int i = 0; i < Value.size(); i++) {
				System.out.print(Value.get(i));
				System.out.print(",");
			}
			System.out.println();
		}
	}
	
	private static ArrayList<String> getCspContent() throws IOException {
		String fileNameString = "../../parse.csp";
		//String fileNameString = "data.csp";
		BufferedReader in = new BufferedReader(new FileReader(fileNameString));
		
		ArrayList<String> reStrings = new ArrayList<String>();
        String str;
        while ((str = in.readLine()) != null) {
            reStrings.add(str);
        }
		in.close();
        return reStrings;
	}

}
