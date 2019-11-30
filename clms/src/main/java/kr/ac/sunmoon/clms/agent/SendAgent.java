package kr.ac.sunmoon.clms.agent;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SendAgent {
	public static void main(String[] args) {
		Process process = null;
		Runtime runtime = Runtime.getRuntime();
		
		StringBuffer result = new StringBuffer();
		
		BufferedReader successReader = null;
		BufferedReader infoReader = null;
		
		String msg = null;
		
		List<String> commandList = new ArrayList<String>();
		
		commandList.add("cmd");
		commandList.add("/c");
		
		commandList.add("ipconfig -all");
//		commandList.add("dxdiag -t info.txt");
		
		String[] array = commandList.toArray(new String[commandList.size()]);
		
		
		Map<String, String> info = new HashMap<String, String>();
		try {
			
			process = runtime.exec(array);
			
			successReader = new BufferedReader(new InputStreamReader(process.getInputStream(), "EUC-KR"));
			
			process.waitFor();

			while ((msg = successReader.readLine()) != null) {
				if (msg.indexOf("IPv4 주소") > -1) {
					String[] ip = msg.split("\\s:\\s");
//					for (String i : ip) {
//						System.out.println(ip.length);
//					}
					info.put("ip", ip[1].substring(0, ip[1].indexOf("(")));
				}
			}
			
			infoReader = new BufferedReader(new InputStreamReader(new FileInputStream(new File("C:\\Users\\gmu\\Desktop\\DxDiag.txt")), "EUC-KR"));
			
			boolean isStorage = false;
			boolean isProcessor = false;
			boolean isMemory = false;
			while ((msg = infoReader.readLine()) != null) {
				if (isStorage) {
					isStorage = false;
					info.put("storage", msg.trim().split(":\\s")[1]);
				}
				
				if (isMemory) {
					isMemory = false;
					info.put("ram", msg.trim().split(":\\s")[1].split(" ")[0]);
				}
				
				if (isProcessor) {
					isProcessor = false;
					isMemory = true;
					info.put("cpu", msg.trim().split(":\\s")[1]);
				}
				
				if (msg.indexOf("BIOS:") > -1 ) {
					isProcessor = true;
				}
				
				if (msg.indexOf("Card name:") > -1) { 
					info.put("vga", msg.trim().split(":\\s")[1]);
				}
				
				if (msg.indexOf("File System:") > -1 ) {
					isStorage = true;
				}
			}
			
			
			if (process.exitValue() == 0) {
			}
			info.put("username", System.getProperty("user.name"));
			
			
			System.out.println(info);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				process.destroy();
				if (successReader != null) {
					successReader.close();
				}
				if (infoReader != null) {
					infoReader.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
