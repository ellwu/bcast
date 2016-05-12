package com.shnlng.bcast.count.domain.value;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "v_counts")
public class PlayCountVo implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "count_id")
    private String id;
	
	@Column(name = "merchant_id")
	private String merchantId;
	
	@Column(name = "merchant_name")
	private String merchantName;

	@Column(name = "merchant_category")
	private String merchatCategory;
	
	@Column(name = "adver_id")
	private String adverId;

	@Column(name = "adver_name")
	private String adverName;

	@Column(name = "adver_category")
	private String adverCategory;

	@Column(name = "upload_time")
	private Date uploadTime;

	@Column(name = "count_time")
	private Date countTime;

	@Column(name = "resource_origin_name")
	private String resourceOriginName;

	@Column(name = "count")
	private int count;

	@Column(name = "time")
	private int time;
	
	@Column(name = "devices")
	private int devices;

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	public String getMerchatCategory() {
		return merchatCategory;
	}

	public void setMerchatCategory(String merchatCategory) {
		this.merchatCategory = merchatCategory;
	}

	public String getAdverName() {
		return adverName;
	}

	public void setAdverName(String adverName) {
		this.adverName = adverName;
	}

	public String getAdverCategory() {
		return adverCategory;
	}

	public void setAdverCategory(String adverCategory) {
		this.adverCategory = adverCategory;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public Date getCountTime() {
		return countTime;
	}

	public void setCountTime(Date countTime) {
		this.countTime = countTime;
	}

	public String getResourceOriginName() {
		return resourceOriginName;
	}

	public void setResourceOriginName(String resourceOriginName) {
		this.resourceOriginName = resourceOriginName;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getDevices() {
		return devices;
	}

	public void setDevices(int devices) {
		this.devices = devices;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
