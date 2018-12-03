package com.ikkong.system.util;

import com.jfinal.core.JFinal;
import com.jfinal.template.Engine;
import com.jfinal.template.source.ClassPathSourceFactory;

import java.util.Map;

public class GridUtil {

	public static String generateScript(Map<String, Object> context) {
		String result = null;
		try {
			if (context.get("noOfRecords") == null) {
				context.put("noOfRecords", "20");
			}
			
			if (context.get("rowNumbers") == null) {
				context.put("rowNumbers", false);
			}
			
			if (context.get("needCheckbox") == null) {
				context.put("needCheckbox", true);
			}
			
			if (context.get("altRows") == null) {
				context.put("altRows", false);
			}
			
			if (context.get("link") == null) {
				context.put("link", "");
			}
			
			if (context.get("cellEdit") == null) {
				context.put("cellEdit", false);
			}
			
			if (context.get("footerrow") == null) {
				context.put("footerrow", false);
			}
			
			if(context.get("cellurl") != null){
				String cellurl = (String) context.get("cellurl");
				
				if(cellurl.startsWith("/")){
					cellurl = JFinal.me().getContextPath() + cellurl;
				}
				context.put("cellurl", cellurl);
			}
			
			if(context.get("reurl") == null){
				throw new RuntimeException("reurl不能为空");
			}else{
				
				String reurl = (String) context.get("reurl");
				
				if(reurl.startsWith("/")){
					reurl = JFinal.me().getContextPath() + reurl;
				}
				context.put("reurl", reurl);
			}
			
			result = Engine.use().setSourceFactory(new ClassPathSourceFactory()).getTemplate("gridTemplate.txt").renderToString(context);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
