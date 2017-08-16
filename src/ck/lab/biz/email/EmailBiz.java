package ck.lab.biz.email;

import java.util.List;

import ck.lab.entity.Email;

public interface EmailBiz {
	public int pageSize = 10;
	public boolean addEmail(Email email);
	public boolean delEmail(int id);
	public void setStatus(int id);  // �����Ѷ�״̬
	public List<Email> getEmail(String name);    // ͨ�������˲���
	public List<Email> getEmail(int pageNo, int status); // ͨ��ҳ���״̬����
	public int getRows();  // ��ȡ����
	public int getClose(); // ��ȡδ����
	public int getOpen();  // ��ȡ�Ѷ���
}
