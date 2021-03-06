package com.ikkong.files.model;

import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.Table;
import com.ikkong.core.annotation.BindID;
import com.ikkong.core.model.BaseModel;

import java.util.Date;

/**
 * Generated by Blade.
 * 2018-07-16 10:24:02
 */
@Table(name = "nsl_files")
@BindID(name = "id")
@SuppressWarnings("serial")
public class Files extends BaseModel {
    	private Integer id;
    	private Integer d_id; //起草部门
    	private Integer issubmit; //是否提交
    	private Integer status; //进度
    	private Integer type; //公文类型
    	private Integer u_id; //经办人
    	private Integer version;
    	private String copy; //抄送
    	private String d_opinion; //部门领导批示
    	private String discript; //公文描述
    	private String h_opinion; //总经理批示
    	private String l_opinion; //领导班子批示
    	private String num; //公文文号
    	private String title_new; //文件名_系统
    	private String title_o; //文件名
    	private String visiable; //主送
    	private Date date;
	private String copyman; //抄送人姓名
	private String selectname; //抄送人姓名
	private Integer round;

    	@AutoID

		public Integer getRound() {
			return round;
		}

	public void setRound(Integer round) {
		this.round = round;
	}

		public String getCopyman() {
			return copyman;
		}

		public void setCopyman(String copyman) {
			this.copyman = copyman;
		}

		public String getSelectname() {
			return selectname;
		}

		public void setSelectname(String selectname) {
		this.selectname = selectname;
	}

    	public Integer getId() {
    		return id;
    	}

    	public void setId(Integer id) {
    		this.id = id;
    	}

    	public Integer getD_id() {
    		return d_id;
    	}

    	public void setD_id(Integer d_id) {
    		this.d_id = d_id;
    	}

    	public Integer getIssubmit() {
    		return issubmit;
    	}

    	public void setIssubmit(Integer issubmit) {
    		this.issubmit = issubmit;
    	}

    	public Integer getStatus() {
    		return status;
    	}

    	public void setStatus(Integer status) {
    		this.status = status;
    	}

    	public Integer getType() {
    		return type;
    	}

    	public void setType(Integer type) {
    		this.type = type;
    	}

    	public Integer getU_id() {
    		return u_id;
    	}

    	public void setU_id(Integer u_id) {
    		this.u_id = u_id;
    	}

    	public Integer getVersion() {
    		return version;
    	}

    	public void setVersion(Integer version) {
    		this.version = version;
    	}

    	public String getCopy() {
    		return copy;
    	}

    	public void setCopy(String copy) {
    		this.copy = copy;
    	}

    	public String getD_opinion() {
    		return d_opinion;
    	}

    	public void setD_opinion(String d_opinion) {
    		this.d_opinion = d_opinion;
    	}

    	public String getDiscript() {
    		return discript;
    	}

    	public void setDiscript(String discript) {
    		this.discript = discript;
    	}

    	public String getH_opinion() {
    		return h_opinion;
    	}

    	public void setH_opinion(String h_opinion) {
    		this.h_opinion = h_opinion;
    	}

    	public String getL_opinion() {
    		return l_opinion;
    	}

    	public void setL_opinion(String l_opinion) {
    		this.l_opinion = l_opinion;
    	}

    	public String getNum() {
    		return num;
    	}

    	public void setNum(String num) {
    		this.num = num;
    	}

    	public String getTitle_new() {
    		return title_new;
    	}

    	public void setTitle_new(String title_new) {
    		this.title_new = title_new;
    	}

    	public String getTitle_o() {
    		return title_o;
    	}

    	public void setTitle_o(String title_o) {
    		this.title_o = title_o;
    	}

    	public String getVisiable() {
    		return visiable;
    	}

    	public void setVisiable(String visiable) {
    		this.visiable = visiable;
    	}

    	public Date getDate() {
    		return date;
    	}

    	public void setDate(Date date) {
    		this.date = date;
    	}

}
