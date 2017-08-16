package ck.lab.biz.admin;

import ck.lab.entity.Admin;

public interface AdminBiz {
	public boolean Login(Admin admin);
	public boolean Change(Admin n);
	public void addView();
	public int getView();
}
