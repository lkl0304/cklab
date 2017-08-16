package ck.lab.biz.article;

import java.util.List;

import ck.lab.entity.Article;

public interface ArticleBiz {
	public int getPageSize();
	public void setPageSize(int size);
	public void setType(String type);  // 设置文章类型   默认创客动态   'all'获取所有
	public boolean addArt(Article article);
	public boolean delArt(int id);
	public boolean changeArt(Article article);
	public List<Article> getArt(String title); // 通过标题获取采用模糊处理
	public Article getArt(int id); // 通过id获取文章
	
	public List<Article> getArt(int pageNo, int status);  // 0 未发布 1 已发布 >1 全部
	public int getRows(); // 获取总数
	public int getPut();  // 获取已发布的文章数
	public int getDraft();// 获取草稿数
	
	public int getEndId(); // 获取最后一条记录的id 用于给文章编号
	
	public void addLike(int id); // 点赞
	public void addView(int id); // 增加查看量
}
