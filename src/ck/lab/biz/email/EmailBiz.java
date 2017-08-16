package ck.lab.biz.email;

import java.util.List;

import ck.lab.entity.Email;

public interface EmailBiz {
	public int pageSize = 10;
	public boolean addEmail(Email email);
	public boolean delEmail(int id);
	public void setStatus(int id);  // 设置已读状态
	public List<Email> getEmail(String name);    // 通过发件人查找
	public List<Email> getEmail(int pageNo, int status); // 通过页码和状态查找
	public int getRows();  // 获取总数
	public int getClose(); // 获取未读数
	public int getOpen();  // 获取已读数
}
