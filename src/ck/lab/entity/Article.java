package ck.lab.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Article {
	private int    id;
	private String type;   // 文章类型  1
	private String title;  // 标题  1 
	private String intro;  // 简介  1 
	private String time;   // 时间 
	private int    status; // 状态
	private int    views;  // 浏览量
	private int    likes;  // 点赞数
	private String path;   // 文章路径  1 
	private String photo;  // 图片路径  1 
	private String content;// 临时保存request中的文章内容 
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
}
