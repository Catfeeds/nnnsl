package com.ikkong.cars.controller;

import java.util.Map;
import com.ikkong.core.base.BaseController;
import com.ikkong.core.dao.Blade;
import com.ikkong.core.jfinal.ext.kit.JsonKit;
import com.ikkong.core.toolbox.Record;
import com.ikkong.system.controller.base.UrlPermissController;
import com.ikkong.cars.model.Carsgas;
import com.ikkong.cars.service.CarsgasService;
import com.ikkong.cars.service.impl.CarsgasServiceImpl;

/**
 * Generated by Blade.
 * 2018-08-20 15:42:02
 */
public class CarsgasController extends UrlPermissController {
	private static String CODE = "carsgas";
	private static String PERFIX = "nsl_cars_gas";
	private static String LIST_SOURCE = "Carsgas.list";
	private static String BASE_PATH = "/platform/carsgas/";
	
	CarsgasService service = new CarsgasServiceImpl();
	
	public void index() {
		setAttr("code", CODE);
		render(BASE_PATH + "carsgas.html");
	}

	public void add() {
		setAttr("code", CODE);
		render(BASE_PATH + "carsgas_add.html");
	}

	public void edit() {
		String id = getPara(0);
        Map carsgas = Blade.dao().selectSingle("Carsgas.one", Record.create().set("id", id), Map.class);
//        Carsgas carsgas = service.findById(id);
		setAttr("model", JsonKit.toJson(carsgas));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "carsgas_edit.html");
	}

	public void view() {
		String id = getPara(0);
		Carsgas carsgas = service.findById(id);
		setAttr("model", JsonKit.toJson(carsgas));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "carsgas_view.html");
	}

	public void list() {
		Object grid = paginate(LIST_SOURCE);
		renderJson(grid);
	}

	public void save() {
		Carsgas carsgas = mapping(PERFIX, Carsgas.class);
		boolean temp = service.save(carsgas);
		if (temp) {
			renderJson(success(SAVE_SUCCESS_MSG));
		} else {
			renderJson(error(SAVE_FAIL_MSG));
		}
	}

	public void update() {
		Carsgas carsgas = mapping(PERFIX, Carsgas.class);
		carsgas.setVersion(carsgas.getVersion()+1);
		boolean temp = service.update(carsgas);
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
