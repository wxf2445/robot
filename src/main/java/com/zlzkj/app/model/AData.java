package com.zlzkj.app.model;

import java.util.Date;

public class AData {
	private String o2data;
	private String tempdata;
	private String phdata;
	private String status;
	private int areaId;
    private Date createtime;
    private String coordinate;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getAreaId() {
		return areaId;
	}
	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public String getCoordinate() {
		return coordinate;
	}
	public void setCoordinate(String coordinate) {
		this.coordinate = coordinate;
	}

	public String getO2data() {
		return o2data;
	}
	public void setO2data(String o2data) {
		this.o2data = o2data;
	}
	public String getTempdata() {
		return tempdata;
	}
	public void setTempdata(String tempdata) {
		this.tempdata = tempdata;
	}
	public String getPhdata() {
		return phdata;
	}
	public void setPhdata(String phdata) {
		this.phdata = phdata;
	}
}
