package com.bit.dto;

public class Bean {
	// javaBean Å¬·¡½º
	// bean -> dto -> Vo
	private int num;
	private String id,sub;
	private java.sql.Date nalja;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSub() {
		if(sub.length()>5) 
			return sub.substring(0,5)+"...";
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public java.sql.Date getNalja() {
		return nalja;
	}
	public void setNalja(java.sql.Date nalja) {
		this.nalja = nalja;
	}
	
	
}










