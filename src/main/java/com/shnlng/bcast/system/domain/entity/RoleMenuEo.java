package com.shnlng.bcast.system.domain.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "t_role_menus")
public class RoleMenuEo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "rm_id")
	private String id;

	@Column(name = "rm_role_id")
	private String roleId;

	@Column(name = "rm_menu_id")
	private String menuId;

	@Column(name = "version")
	private long version;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "creation_time")
	private Date creationTime;

	@Column(name = "created_by")
	private String createdBy;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "update_time")
	private Date updateTime;

	@Column(name = "updated_by")
	private String updatedBy;

	@OneToOne
	@JoinColumn(name = "rm_role_id", insertable = false, updatable = false)
	private RoleEo role;

	@OneToOne
	@JoinColumn(name = "rm_menu_id", insertable = false, updatable = false)
	private MenuEo menu;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public long getVersion() {
		return version;
	}

	public void setVersion(long version) {
		this.version = version;
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

	public RoleEo getRole() {
		return role;
	}

	public void setRole(RoleEo role) {
		this.role = role;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public MenuEo getMenu() {
		return menu;
	}

	public void setMenu(MenuEo menu) {
		this.menu = menu;
	}
}
