package action.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import ck.lab.biz.email.EmailBiz;
import ck.lab.biz.email.impl.EmailImpl;
import ck.lab.entity.Email;
import ck.lab.util.SessionUtil;
/**
 * 
 * @author lbxx
 * 通过status区分已读未读  0 未读  1 已读  >1 全部
 */
public class EmailAction implements Action {
	private HttpServletRequest  request  = ServletActionContext.getRequest();
	private HttpServletResponse response = ServletActionContext.getResponse();
	
	private SessionUtil sUtil = new SessionUtil(request, response);
	private EmailBiz    eBiz  = new EmailImpl();
 	
	private Email  email  = null;
	private String name   = null;
	private int    id     = 0;
	private int    pageNo = 0;
	private int    status = 2;

	@Override
	public String execute() throws Exception {
		sUtil.CheckSession();
		this.setInfo();
		
		if (name != null && !name.equals("")) {
			this.nget();
		}else {
			if (pageNo == 0) {
				pageNo = 1;
			}
			this.spget();
		}
		return SUCCESS;
	}
	
	public void add() {
		sUtil.CheckSession();
		if (eBiz.addEmail(email)) {
			this.print("添加成功！");
		}
	}
	public void del() {
		sUtil.CheckSession();
		if (eBiz.delEmail(id)) {
			this.print("删除成功！");
		}
	}
	
	public void sets(){  // 标记为已读
		sUtil.CheckSession();
		eBiz.setStatus(id);
	}
	
	private void nget() {   // 通过发件人获取信息
		List<Email> list = eBiz.getEmail(name);
		request.setAttribute("emails", list);
		request.setAttribute("fyrows", (list == null)?-1:1); // 没有发现则将fyrows变为-1 显示 无该记录
	}
	
	private void spget() {   // 通过页码和状态获取数据获取信息
		int rows = eBiz.getRows();
		int pages = rows/EmailBiz.pageSize + (rows%EmailBiz.pageSize > 0?1:0);
		
		if (pageNo > pages) {
			pageNo = pages;
		}
		if (pageNo < 1) {
			pageNo = 1;
		}
		
		List<Email> list = eBiz.getEmail(pageNo, status);
		
		request.setAttribute("emails", list);   // 数据
		request.setAttribute("pages", pages);   // 总页数
		request.setAttribute("fyrows", rows);   // 数据总数
		request.setAttribute("pageNo", pageNo); // 当前页码
	}
	
	private void setInfo() {
		int rows = eBiz.getRows();
		int open = eBiz.getOpen();
		int close = eBiz.getClose();
		request.setAttribute("rows", rows);   // 总数
		request.setAttribute("open", open);   // 已读
		request.setAttribute("close", close); // 未读
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
	public Email getEmail() {
		return email;
	}
	public void setEmail(Email email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
