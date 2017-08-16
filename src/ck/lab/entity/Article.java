package ck.lab.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Article {
	private int    id;
	private String type;   // ��������  1
	private String title;  // ����  1 
	private String intro;  // ���  1 
	private String time;   // ʱ�� 
	private int    status; // ״̬
	private int    views;  // �����
	private int    likes;  // ������
	private String path;   // ����·��  1 
	private String photo;  // ͼƬ·��  1 
	private String content;// ��ʱ����request�е��������� 
	
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
