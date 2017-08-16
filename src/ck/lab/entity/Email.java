package ck.lab.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Email {
	private int    id;
	private String name;
	private long   tel;
	private String time;
	private int    status;
	private String email;
	private String content;
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		if (time == null || time.isEmpty()) {
			Date date = new Date();
			SimpleDateFormat sFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			time = sFormat.format(date);
		}
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public long getTel() {
		return tel;
	}
	public void setTel(long tel) {
		this.tel = tel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
