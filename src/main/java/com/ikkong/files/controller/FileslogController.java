package com.ikkong.files.controller;

import java.util.Date;
import java.util.Map;
import com.ikkong.core.base.BaseController;
import com.ikkong.core.dao.Blade;
import com.ikkong.core.jfinal.ext.kit.JsonKit;
import com.ikkong.core.jfinal.ext.shiro.ShiroKit;
import com.ikkong.system.controller.base.UrlPermissController;
import com.ikkong.files.model.Fileslog;
import com.ikkong.files.service.FileslogService;
import com.ikkong.files.service.impl.FileslogServiceImpl;
import org.beetl.sql.core.kit.StringKit;

/**
 * Generated by Blade.
 * 2018-07-16 10:24:02
 */
public class FileslogController extends UrlPermissController {
	private static String CODE = "fileslog";
	private static String PERFIX = "nsl_files_log";
	private static String LIST_SOURCE = "Fileslog.list";
	private static String BASE_PATH = "/platform/fileslog/";
	
	FileslogService service = new FileslogServiceImpl();
	
	public void index() {
		setAttr("code", CODE);
		render(BASE_PATH + "fileslog.html");
	}

	public void add() {
		setAttr("code", CODE);
		render(BASE_PATH + "fileslog_add.html");
	}

	public void history() {
		setAttr("code", CODE);
		render(BASE_PATH + "fileslog_add.html");
	}


	public void edit() {
		String id = getPara(0);
		Fileslog fileslog = service.findById(id);
		setAttr("model", JsonKit.toJson(fileslog));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "fileslog_edit.html");
	}

	public void view() {
		String id = getPara(0);
		Fileslog fileslog = service.findById(id);
		setAttr("model", JsonKit.toJson(fileslog));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "fileslog_view.html");
	}

	public void list() {
		Object grid = paginate(LIST_SOURCE);
		renderJson(grid);
	}

	public void save() {
		Fileslog fileslog = mapping(PERFIX, Fileslog.class);
		boolean temp = service.save(fileslog);
		if (temp) {
			renderJson(success(SAVE_SUCCESS_MSG));
		} else {
			renderJson(error(SAVE_FAIL_MSG));
		}
	}

	public void update() {
		Fileslog fileslog = mapping(PERFIX, Fileslog.class);
        //回复的查看状态
        fileslog.setVersion(1);
        String review = getPara("review");
        if(StringKit.isNotBlank(review)){
            fileslog.setFudate(new Date());
        }
        boolean temp = service.update(fileslog);
		if (temp) {
			renderJson(success(UPDATE_SUCCESS_MSG));
		} else {
			renderJson(error(UPDATE_FAIL_MSG));
		}
	}

	public void remove() {
		String ids = getPara("ids");
		int cnt = service.deleteByIds(ids);
		if (cnt > 0) {
			renderJson(success(DEL_SUCCESS_MSG));
		} else {
			renderJson(error(DEL_FAIL_MSG));
		}
	}
}
