package com.shnlng.bcast.count.domain.value;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "v_qr_counts")
public class QrCountVo implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "resource_id")
    private String id;
	
	@Column(name ="count")
	private String count;
	
	@Column(name = "resource_origin_name")
	private String resourceName;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

}
