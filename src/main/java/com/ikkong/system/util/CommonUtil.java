package com.ikkong.system.util;

import com.ikkong.core.jfinal.ext.shiro.ShiroKit;
import com.jfinal.plugin.activerecord.Page;
import org.apache.commons.beanutils.BeanUtils;

import java.util.*;

//import com.eazytec.bpm.sysconfig.Config;
//import com.eazytec.common.kit.BeanUtils;

public class CommonUtil {

	public static Object fenye(List maps,int page,int rows){
		int start = (page-1)*rows;
		double d = maps.size()*1.00/rows*1.00;
		int end = start + rows;
		if (end>maps.size()){
			end = maps.size();
		}
		List<Map> newmap = maps.subList(start,end);
		Map sss = new HashMap();
		sss.put("rows",newmap);
		sss.put("total",Math.ceil(d));
		sss.put("page",page);
		sss.put("records",maps.size());
		Object o = sss;
		return o;
	}

	public static void createFieldNameList(List<Map<String, Object>> fieldNameList, String index, String width, String textAlign, String onRenderEvent, boolean isHidden) {
		Map<String, Object> fieldNameMap = new HashMap<String, Object>();
		fieldNameMap.put("index", index);
		fieldNameMap.put("width", width);
		fieldNameMap.put("textAlign", textAlign);
		fieldNameMap.put("isHidden", isHidden);
		fieldNameMap.put("onRenderEvent", onRenderEvent);
		fieldNameMap.put("isSort", true);
		fieldNameList.add(fieldNameMap);
	}
	public static boolean ynadmin(){
        List<String> roleList = ShiroKit.getUser().getRoleList();
        boolean b = false;
        for(String ss:roleList){
            if("1".equals(ss) || "2".equals(ss)){
                b = true;
                break;
            }
        }
        return b;
    }
	public static boolean ynleader(){
		List<String> roleList = ShiroKit.getUser().getRoleList();
		boolean b = false;
		for(String ss:roleList){
			if("1".equals(ss) ||"2".equals(ss) ||"8".equals(ss) ||"9".equals(ss) ||"13".equals(ss)  ){
				b = true;
				break;
			}
		}
		return b;
	}

	public static boolean yncaiwu(){
		List<String> roleList = ShiroKit.getUser().getRoleList();
		boolean b = false;
		for(String ss:roleList){
			if("1".equals(ss) ||"2".equals(ss) ||"8".equals(ss) ||"9".equals(ss) ||"11".equals(ss) ||"12".equals(ss) ||"13".equals(ss)  ){
				b = true;
				break;
			}
		}
		return b;
	}
	public static boolean ynsuper(){
		List<String> roleList = ShiroKit.getUser().getRoleList();
		boolean b = false;
		for(String ss:roleList){
			if("1".equals(ss)){
				b = true;
				break;
			}
		}
		return b;
	}
	public static String quchong(String s){

		String[] array = s.split(",");
		Set<String> set = new HashSet<>();
		for(int i=0;i<array.length;i++){
			set.add(array[i]);
		}
		String[] arrayResult = (String[]) set.toArray(new String[set.size()]);
		return Arrays.toString(arrayResult);
	}
	public static void createEditFieldNameList(List<Map<String, Object>> fieldNameList, String index, String width, String textAlign, String onRenderEvent, boolean isHidden) {
		Map<String, Object> fieldNameMap = new HashMap<String, Object>();
		fieldNameMap.put("index", index);
		fieldNameMap.put("width", width);
		fieldNameMap.put("textAlign", textAlign);
		fieldNameMap.put("isHidden", isHidden);
		fieldNameMap.put("onRenderEvent", onRenderEvent);
		fieldNameMap.put("isSort", true);
		fieldNameMap.put("isEdit", true);
		fieldNameList.add(fieldNameMap);
	}

	public static void createFieldNameList(List<Map<String, Object>> fieldNameList, String index, String width, String textAlign, String onRenderEvent, boolean isHidden, boolean isSort) {
		Map<String, Object> fieldNameMap = new HashMap<String, Object>();
		fieldNameMap.put("index", index);
		fieldNameMap.put("width", width);
		fieldNameMap.put("textAlign", textAlign);
		fieldNameMap.put("isHidden", isHidden);
		fieldNameMap.put("onRenderEvent", onRenderEvent);
		fieldNameMap.put("isSort", isSort);
		fieldNameList.add(fieldNameMap);
	}
	
	public static PageResultBean convertPageBeanToPageResultBean(Page<?> pageBean, String[] fieldNames, Map<Object, Object> userdata) {

		PageResultBean pageResultBean = new PageResultBean();

		pageResultBean.setPage(pageBean.getPageNumber());
		pageResultBean.setRecords(pageBean.getTotalRow());
		pageResultBean.setTotal(pageBean.getTotalPage());
		pageResultBean.setUserdata(userdata);

		List<PageResultRow> rows = new ArrayList<PageResultRow>();

		PageResultRow row = null;
		if (pageBean.getList() != null) {
			for (Object object : pageBean.getList()) {
				row = new PageResultRow();
				List<Object> objects = new ArrayList<Object>();
				try {
					for (String fieldName : fieldNames) {
						Object fieldValue = BeanUtils.getSimpleProperty(object, fieldName);

						if (fieldName.equals("id")) {
							row.setId(fieldValue);
						}
						objects.add(fieldValue);
					}
				} catch (Exception e) {
					throw new RuntimeException("Error while convert PageBean To PageResultBean  for entitiy " + object.getClass(), e);
				}
				row.setCell(objects);
				rows.add(row);
			}
		}
		pageResultBean.setRows(rows);
		return pageResultBean;
	}

//	public static String getApplicationName(){
//		return Config.instance().get("application.name");
//	}
	
}
