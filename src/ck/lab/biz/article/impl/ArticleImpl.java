package ck.lab.biz.article.impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;

import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.struts2.ServletActionContext;

import ck.lab.biz.article.ArticleBiz;
import ck.lab.dao.BaseDao;
import ck.lab.entity.Article;

public class ArticleImpl implements ArticleBiz{
	private int pageSize = 10;
	private String type = "news";
	
	private BaseDao dao = new BaseDao();
	
	@Override
	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public void addLike(int id) {
		String sql1 = "update article set likes=(likes + 1) where id=?";
		dao.SqlUpdate(sql1, id);
	}
	@Override
	public void addView(int id){
		String sql1 = "update article set views=(views + 1) where id=?";
		dao.SqlUpdate(sql1, id);
	}
	@Override
	public boolean addArt(Article article) {
		int id = this.getEndId() + 1;
		String path = "article/" + id;   // �������ݿ�id��ȡ·��
		
		article = this.saveFile(path, article);
		
		String sql = "insert into article (type, title, intro, time, status, views, path, photo) values (?,?,?,?,?,?,?,?)";
		
		return dao.SqlUpdate(sql, article.getType(), 
				article.getTitle(),
				article.getIntro(),
				article.getTime(),
				article.getStatus(),
				0,
				article.getPath(),
				article.getPhoto());
	}

	@Override
	public boolean delArt(int id) {
		// �����ݿ���ɾ������ǰ �������ļ�ɾ��
		String p = this.getArt(id).getPath();  // ��������Ŀ¼

		if (!p.equals("")) {
			String path = ServletActionContext.getServletContext().getRealPath(p);
			File file = new File(path);
			
			if (file.exists()) {
				for (File af : file.getParentFile().listFiles()) {
					if (!af.delete()) {
						return false;
					}
				}
				if (!file.getParentFile().delete()) {
					return false;
				}
			}
		}
		String sql = "delete from article where id=?";
		return dao.SqlUpdate(sql, id);
	}

	@Override
	public boolean changeArt(Article article) {
		String path  = article.getPath().substring(0, article.getPath().lastIndexOf("/")); // ��ȡ����Ŀ¼
		
		article = this.saveFile(path, article);
		
		String sql = "update article set title=?, intro=?, time=?, status=?, views=?, path=?, photo=? where id=? and type=?";
		return dao.SqlUpdate(sql, article.getTitle(),
				article.getIntro(),
				article.getTime(),
				article.getStatus(),
				article.getViews(),
				article.getPath(),
				article.getPhoto(),
				article.getId(),
				article.getType());
	}

	@Override
	public List<Article> getArt(String title) {
		String sql = "select * from article";
		List<Article> list = dao.SqlQuery(sql, new BeanListHandler<>(Article.class));
		if (list != null && !list.isEmpty()) {
			for (Article article : list) {
				if (!article.getTitle().contains(title)) {
					list.remove(article);
				}
			}
			return list;
		}
		return null;
	}

	@Override
	public Article getArt(int id) {
		String sql = "select * from article where id=?";
		return dao.SqlQuery(sql, new BeanHandler<>(Article.class), id);
	}

	@Override
	public List<Article> getArt(int pageNo, int status) {
		int num = (pageNo - 1)*pageSize; // ��ʼ�ط�
		List<Article> list = null;
		String sql = null;
		
		if (type.equals("all")) {
			sql = "select * from article order by id DESC limit ?,?";  // ��ȡ��������
			list = dao.SqlQuery(sql, new BeanListHandler<>(Article.class), num, pageSize);
		} else {
			if (status > 1) {
				sql = "select * from article where type=? order by id DESC limit ?,?";  // ��ȡָ�����͵���������
				list = dao.SqlQuery(sql, new BeanListHandler<>(Article.class), type, num, pageSize);
			} else {
				sql = "select * from article where type=? and status=? order by id DESC limit ?,?";  // ��ȡָ�����ͺ�״̬���������� 
				list = dao.SqlQuery(sql, new BeanListHandler<>(Article.class), type, status, num, pageSize);
			}
		}
		
		if (list != null && !list.isEmpty()) {
			return list;
		}
		return null;
	}

	@Override
	public int getRows() {
		String sql = null;
		Object[] o = null;
		if (type.equals("all")) {
			sql = "select count(*) from article";
			o = dao.SqlQuery(sql, new ArrayHandler());
		} else {
			sql = "select count(*) from article where type=?";
			o = dao.SqlQuery(sql, new ArrayHandler(), type);
		}
		
	 	if (o.length > 0) {
			return Integer.parseInt(o[0].toString());
		}
		return 0;
	}

	@Override
	public int getPut() {  // ��ȡ�ѷ�����Ŀ
		return this.getNum(1);
	}

	@Override
	public int getDraft() {  // ��ȡ�ݸ���Ŀ
		return this.getNum(0);
	}
	
	private int getNum(int status){
		String sql = null;
		Object[] o = null;
		if (type.equals("all")) {
			sql = "select count(*) from article where status=?";
			o = dao.SqlQuery(sql, new ArrayHandler(), status);
		} else {
			sql = "select count(*) from article where type=? and status=?";
			o = dao.SqlQuery(sql, new ArrayHandler(), type, status);
		}
		
	 	if (o.length > 0) {
			return Integer.parseInt(o[0].toString());
		}
		return 0;
	}

	@Override
	public int getEndId() {
		String sql = "select * from article order by id DESC limit 1";
		Article article = dao.SqlQuery(sql, new BeanHandler<>(Article.class));
		if (article != null) {
			return article.getId();
		}
		return 0;
	}
	
	// ɾ����Ŀ¼�������ļ� ������Ŀ¼
	private void ClearFolder(File folder){
		if (folder.exists()) {
			for (File file : folder.listFiles()) {
				file.delete();
			}
		} else {
			folder.mkdirs();
		}
	}
	
	private Article saveFile(String path, Article article) {
		String content = article.getContent(); // ��������
		
		article.setPath(path + "/index.htm"); // �����������·�������ݿ�� 
		String filepath = ServletActionContext.getServletContext().getRealPath(path + "/index.htm");
		
		File file = new File(filepath);
		if (!article.getType().equals("result")) {  // ���ǳɹ������� Ҫ������Ŀ¼
			this.ClearFolder(file.getParentFile());
		} else {
			if (file.getParentFile().exists()){
				// �����ͼƬ���ȡͼƬ�����浽���ݿ�
				for (File f : file.getParentFile().listFiles()) {
					String n = f.getName();
					if (n.contains("img.")) {
						article.setPhoto(path + "/" + n);  // ����ͼƬ��ʽ���ɶ�Ӧ·��
					}		
				}
			} else {
				file.getParentFile().mkdirs();
			}
		}
		
		// ���������ļ�
		try {
			file.createNewFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("�������¾���·��--> " + file.getAbsoluteFile());
		
		BufferedWriter writer = null;
		try {
			writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"));
			writer.write(content);
			writer.flush(); 
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return article;
	}
	
	@Override
	public int getPageSize() {
		return this.pageSize;
	}

	@Override
	public void setPageSize(int size) {
		this.pageSize = size;
	}
}
