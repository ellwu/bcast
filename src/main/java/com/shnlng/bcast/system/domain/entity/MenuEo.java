package com.shnlng.bcast.system.domain.entity;

import java.util.Date;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.Version;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "t_menus")
public class MenuEo implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "menu_id")
	private String id;

	@Column(name = "menu_key")
	private String key;

	@Column(name = "menu_prompt")
	private String prompt;

	@Column(name = "menu_parent_id")
	private String parentId;

	@Column(name = "menu_desc")
	private String desc;

	@Column(name = "menu_sequence")
	private int sequence;

	@Column(name = "func_id")
	private String funcId;

	@Version
	@Column(name = "version")
	private long version;

	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")   
	@Column(name = "creation_time")
	private Date creationTime;

	@Column(name = "created_by")
	private String createdBy;

	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")   
	@Column(name = "update_time")
	private Date updateTime;

	@Column(name = "updated_by")
	private String updatedBy;
	
	public MenuEo() {
	}
	
	public MenuEo(String id, String key, String prompt){
		this.id = id;
		this.key = key;
		this.prompt = prompt;
	}

	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	@Transient
	private List<MenuEo> childMenus = new ArrayList<MenuEo>();
	@Transient
	private MenuEo parentMenu = null;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getPrompt() {
		return prompt;
	}

	public void setPrompt(String prompt) {
		this.prompt = prompt;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public String getFuncId() {
		return funcId;
	}

	public void setFuncId(String funcId) {
		this.funcId = funcId;
	}

	public long getVersion() {
		return version;
	}

	public void setVersion(long version) {
		this.version = version;
	}

	public List<MenuEo> getChildMenus() {
		return childMenus;
	}

	public void setChildMenus(List<MenuEo> childMenus) {
		this.childMenus = childMenus;
	}

	public MenuEo getParentMenu() {
		return parentMenu;
	}

	public void setParentMenu(MenuEo parentMenu) {
		this.parentMenu = parentMenu;
	}

}
