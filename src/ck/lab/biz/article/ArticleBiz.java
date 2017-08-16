package ck.lab.biz.article;

import java.util.List;

import ck.lab.entity.Article;

public interface ArticleBiz {
	public int getPageSize();
	public void setPageSize(int size);
	public void setType(String type);  // ������������   Ĭ�ϴ��Ͷ�̬   'all'��ȡ����
	public boolean addArt(Article article);
	public boolean delArt(int id);
	public boolean changeArt(Article article);
	public List<Article> getArt(String title); // ͨ�������ȡ����ģ������
	public Article getArt(int id); // ͨ��id��ȡ����
	
	public List<Article> getArt(int pageNo, int status);  // 0 δ���� 1 �ѷ��� >1 ȫ��
	public int getRows(); // ��ȡ����
	public int getPut();  // ��ȡ�ѷ�����������
	public int getDraft();// ��ȡ�ݸ���
	
	public int getEndId(); // ��ȡ���һ����¼��id ���ڸ����±��
	
	public void addLike(int id); // ����
	public void addView(int id); // ���Ӳ鿴��
}
