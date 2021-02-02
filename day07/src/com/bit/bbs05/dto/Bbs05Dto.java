package com.bit.bbs05.dto;

public class Bbs05Dto {
	private int num;
	private String sub,content,id;
	private java.sql.Timestamp nalja;
	
	public Bbs05Dto() {
	}

	public int getNum() {
		return num;
	}

	public String getSub() {
		return sub;
	}

	public String getContent() {
		return content;
	}

	public String getId() {
		return id;
	}

	public java.sql.Timestamp getNalja() {
		return nalja;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setNalja(java.sql.Timestamp nalja) {
		this.nalja = nalja;
	}
	
}
