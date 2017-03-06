package com.zlzkj.app.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Warning {
    private Integer id;

    private String type;

    private int recordId;

    private String time;

    private String status;

    private String content;

    private String description;
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getRecordId() {
		return recordId;
	}

	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}

	public String getTime() {
		return time;
	}

	public void setTime(Date time) {
		long sub = (System.currentTimeMillis()-time.getTime())/1000;
		//System.out.println(sub);
		if(sub<180){
			this.time = "刚刚";
		}else if(sub<3600){
			this.time = sub/60+"分钟前";
		}else{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			this.time = sdf.format(time);
		}
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}