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
@Table(name = "t_user_roles")
public class UserRoleEo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ur_id")
	private String id;

	@Column(name = "ur_user_id")
	private String userId;

	@Column(name = "ur_role_id")
	private String roleId;

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
	@JoinColumn(name = "ur_user_id", insertable = false, updatable = false)
	private UserEo user;

	@OneToOne
	@JoinColumn(name = "ur_role_id", insertable = false, updatable = false)
	private RoleEo role;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public UserEo getUser() {
		return user;
	}

	public void setUser(UserEo user) {
		this.user = user;
	}

	public RoleEo getRole() {
		return role;
	}

	public void setRole(RoleEo role) {
		this.role = role;
	}
}
