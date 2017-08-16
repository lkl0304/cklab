package action.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import ck.lab.biz.article.ArticleBiz;
import ck.lab.biz.article.impl.ArticleImpl;
import ck.lab.entity.Article;
import ck.lab.util.SessionUtil;

public class ArticleAction implements Action {
	protected HttpServletRequest  request  = ServletActionContext.getRequest();
	protected HttpServletResponse response = ServletActionContext.getResponse();
	
	protected SessionUtil sUtil = new SessionUtil(request, response);
	protected ArticleBiz atBiz = new ArticleImpl();
	
	private Article article;
	private int     id;
	protected String  type;
	private String  title;
	protected int     status = 2;
	protected int     pageNo = 0;
	
	@Override
	public String execute() throws Exception {
		sUtil.CheckSession();
		if (type == null || type.equals("")) {
			atBiz.setType("all");
		} else {
			atBiz.setType(type);
		}
		
		if (title != null && !title.equals("")) {
			this.tget();
		} else {
			if (pageNo == 0) {
				pageNo = 1;
			}
			atBiz.setPageSize(10);  // 规定每页加载10条数据
			this.spget();
		}
		
		this.setInfo();
		return SUCCESS;
	}
	
	public void add() {
		sUtil.CheckSession();
		if (id > 0) {  // id存在代表文章存在 则修改
			article.setId(id);
			if (atBiz.changeArt(article)) {
				this.print("修改成功！");
			}
		} else {
			if (atBiz.addArt(article)) {
				this.print("添加成功！");
			}
		}
	}
	public void del(){
		sUtil.CheckSession();
		
		if (atBiz.delArt(id)) {
			this.print("删除成功！");
		}
	}
	
	public String publish() {  // 根据uri的不同为publish页面填入数据
		String uri = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
		//System.out.println(request.getRequestURI()  + "  " + uri);
		
		if (!uri.equals("publish")) {
			int aid = Integer.parseInt(uri);
			Article article = atBiz.getArt(aid);
			if (article == null) {
				return ERROR;
			}
			request.setAttribute("article", article);
		}
		return SUCCESS;
	}

	protected void tget(){  // 通过标题查询 模糊查询
		List<Article> list = atBiz.getArt(title);
		
		request.setAttribute("articles", list);
		request.setAttribute("fyrows", (list == null)?-1:list.size()); // 没有发现则将fyrows变为-1 显示 无该记录
	}
	
	protected void spget() {   // 通过页码和状态获取数据获取信息
		int size = atBiz.getPageSize();
		int rows = atBiz.getRows();
		int pages = rows/size + (rows%size > 0?1:0);
		
		if (pageNo > pages) {
			pageNo = pages;
		}
		if (pageNo < 1) {
			pageNo = 1;
		}
		
		List<Article> list = atBiz.getArt(pageNo, status);
				
		request.setAttribute("articles", list); // 数据
		request.setAttribute("pages", pages);   // 总页数
		request.setAttribute("fyrows", rows);   // 数据总数
		request.setAttribute("pageNo", pageNo); // 当前页码
	}
	
	protected void setInfo(){
		atBiz.setType("news");  // 动态
		int newsNum = atBiz.getRows();
		int newPut     = atBiz.getPut();
		int newDraft   = newsNum - newPut;
		request.setAttribute("newsNum", newsNum);
		request.setAttribute("newPut", newPut);
		request.setAttribute("newDraft", newDraft);
		
		atBiz.setType("notice");  // 通知
		int noticeNum = atBiz.getRows();
		int noPut     = atBiz.getPut();
		int noDraft   = noticeNum - noPut;
		request.setAttribute("noticeNum", noticeNum);
		request.setAttribute("noPut", noPut);
		request.setAttribute("noDraft", noDraft);
		
		atBiz.setType("result");  // 成果
		int resultNum = atBiz.getRows();
		int rePut     = atBiz.getPut();
		int reDraft   = resultNum - rePut;
		request.setAttribute("resultNum", resultNum);
		request.setAttribute("rePut", rePut);
		request.setAttribute("reDraft", reDraft);
		
		atBiz.setType("result");  // 总数
		int AllNum   = newsNum + noticeNum + resultNum;
		int AllPut   = newPut + noPut + rePut;
		int AllDraft = AllNum - AllPut;
		request.setAttribute("AllNum", AllNum);
		request.setAttribute("AllPut", AllPut);
		request.setAttribute("AllDraft", AllDraft);
	}
	private void print(String s) {
		response.setCharacterEncoding("utf-8");
		PrintWriter w = null;
		try {
			w = response.getWriter();
			w.println(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
		w.close();
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
}
