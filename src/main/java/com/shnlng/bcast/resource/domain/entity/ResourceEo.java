package com.shnlng.bcast.resource.domain.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "t_resources")
public class ResourceEo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "resource_id")
	private String id;

	@Column(name = "resource_merchant_id")
	private String merchantId;

	@Column(name = "resource_type")
	private int type;

	@Column(name = "resource_origin_name")
	private String originName;

	@Column(name = "resource_duration")
	private int duration;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "resource_upload_time")
	private Date uploadTime;

	@Column(name = "resource_upload_status")
	private int uploadStatus;

	@Column(name = "resource_category")
	private int category;

	@Column(name = "resource_range_age")
	private String rangeAge;

	@Column(name = "resource_range_group")
	private String rangeGroup;

	@Column(name = "resource_target_status")
	private int targetStatus;

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

	public String getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public int getUploadStatus() {
		return uploadStatus;
	}

	public void setUploadStatus(int uploadStatus) {
		this.uploadStatus = uploadStatus;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getRangeAge() {
		return rangeAge;
	}

	public void setRangeAge(String rangeAge) {
		this.rangeAge = rangeAge;
	}

	public String getRangeGroup() {
		return rangeGroup;
	}

	public void setRangeGroup(String rangeGroup) {
		this.rangeGroup = rangeGroup;
	}

	public int getTargetStatus() {
		return targetStatus;
	}

	public void setTargetStatus(int targetStatus) {
		this.targetStatus = targetStatus;
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

}
