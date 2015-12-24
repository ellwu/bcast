package com.shnlng.bcast.app.domain.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "t_versions")
public class VersionEo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "version_id")
	private String id;

	@Column(name = "version_code")
	private int code;

	@Column(name = "version_name")
	private String name;
	
	@Column(name = "version_url")
	private String url;

	@Column(name = "version_apply_flag")
	private int applyFlag;

	@Column(name = "delete_flag")
	private int deleteFlag;

	@Column(name = "disable_flag")
	private int disableFlag;

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getApplyFlag() {
		return applyFlag;
	}

	public void setApplyFlag(int applyFlag) {
		this.applyFlag = applyFlag;
	}

	public int getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public int getDisableFlag() {
		return disableFlag;
	}

	public void setDisableFlag(int disableFlag) {
		this.disableFlag = disableFlag;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
