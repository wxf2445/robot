package com.zlzkj.app.model;

import java.util.Date;

public class Data {
	private String phData;
	private String o2Data;
	private String tempData;
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
	public String getPhData() {
		return phData;
	}
	public void setPhData(String phData) {
		this.phData = phData;
	}
	public String getO2Data() {
		return o2Data;
	}
	public void setO2Data(String o2Data) {
		this.o2Data = o2Data;
	}
	public String getTempData() {
		return tempData;
	}
	public void setTempData(String tempData) {
		this.tempData = tempData;
	}
    
}
