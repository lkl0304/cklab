package action.user;

import java.io.IOException;
import java.io.PrintWriter;

import action.admin.ArticleAction;
import ck.lab.biz.admin.AdminBiz;
import ck.lab.biz.admin.impl.AdminImpl;
import ck.lab.entity.Article;
import net.sf.json.JSONArray;

public class UserAction extends ArticleAction {
	
	AdminBiz aBiz = new AdminImpl();
	private int num = 5;  // �涨ÿҳ����������
	@Override
	public String execute() throws Exception {
		
		this.pget();
		
		return SUCCESS;
	}
	
	private void pget() {
		String type = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
		if (type.equals("index")) {
			aBiz.addView();
		}else if ("news notice result".contains(type)) {
			super.status = 1; // �涨��ȡ������״̬�����Ѿ�������
			atBiz.setType(type);  // ͨ�����ʵ�url������ʾ����������
			atBiz.setPageSize(num); // ����Ԥ����������
			super.spget();
		}
	}
	
	public void ajaxLoad() throws IOException{
		atBiz.setPageSize(num); 
//		System.out.println("ajaxLoad �������� --> " + type + "pageNo--> " + pageNo);
		atBiz.setType(type);
		
		int size = atBiz.getPageSize();
		int rows = atBiz.getRows();
		int pages = rows/size + (rows%size > 0?1:0);
		if (pageNo > pages) {
			pageNo = pages;
		}
		if (pageNo < 1) {
			pageNo = 1;
		}
		
		JSONArray jsonList = JSONArray.fromObject(atBiz.getArt(pageNo, 1));
		
		response.setCharacterEncoding("utf-8");
		PrintWriter w = response.getWriter();
		w.print(jsonList);
		w.close();
	}
	
	public String show() {
		String uri = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);

		if (uri == null || uri.equals("")) {
			return ERROR;
		}
		int aid = Integer.parseInt(uri);
		Article article = atBiz.getArt(aid);
		if (article == null) {
			return ERROR;
		}
		article.setViews(article.getViews() + 1);
		atBiz.addView(aid); // ���Ӳ鿴��
		request.setAttribute("article", article);
		return SUCCESS;
	}
	
	public void like(){
		atBiz.addLike(super.getId());
	}
}
