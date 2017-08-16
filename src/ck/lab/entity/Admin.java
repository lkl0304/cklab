package ck.lab.entity;

public class Admin {
	private String name;
	private String pass;
	private String remember;
	
	public Admin() {}
	public Admin(String n, String p){
		this.name = n;
		this.pass = p;
	}
	public boolean Test(){ // 用于验证是否记住密码
		return remember != null&&remember.equals("true")?true:false;
	}
	public String getRemember() {
		return remember;
	}
	public void setRemember(String remember) {
		this.remember = remember;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
}
