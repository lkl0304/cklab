package action.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import ck.lab.biz.member.MemberBiz;
import ck.lab.biz.member.impl.MemberImpl;
import ck.lab.entity.Member;
import ck.lab.util.SessionUtil;
/**
 * 
 * @author lbxx
 * NameMem --> ͨ����ѯ��ȡ�����ݵķ���
 */

public class MemberAction implements Action {
	private HttpServletRequest  request  = ServletActionContext.getRequest();
	private HttpServletResponse response = ServletActionContext.getResponse();
	
	private SessionUtil sUtil = new SessionUtil(request, response);
	private MemberBiz   mBiz  = new MemberImpl();
	
	private Member member = null;
	private String name   = null;
	private int    pageNo = 0;
	private int    id     = 0;

	@Override
	public String execute() throws Exception {
		sUtil.CheckSession();
		
		if (name == null || name.equals("")) {
			if (pageNo == 0) {
				pageNo = 1;
			}
			this.pget();
		} else {
			this.nget();
		}
		return SUCCESS;
	}
	
	public void add() throws IOException {
		sUtil.CheckSession();
		if (mBiz.addMember(member)) {
			this.print("��ӳɹ���");
		}
	}
	
	public void del() {
		sUtil.CheckSession();
		if (mBiz.delMember(id)) {
			this.print("ɾ���ɹ���");
		}
	}
	
	public void change() {
		sUtil.CheckSession();
		if (mBiz.changeInfo(member)) {
			this.print("�޸ĳɹ���");
		}
	}
	
	private void nget() { // ͨ��������ȡ��Ϣ 
		List<Member> list = mBiz.getMember(name.trim());
		request.setAttribute("members", list);
		request.setAttribute("rows", (list == null)?-1:1); // û�з�����rows��Ϊ0 ��ʾ �޸ü�¼
	}
	
	private void pget() { // ����ҳ����ȡ��Ϣ
		int rows = mBiz.getRows();
		int pages = rows/MemberBiz.pageSize + (rows%MemberBiz.pageSize > 0?1:0);
		
		if (pageNo > pages) {
			pageNo = pages;
		}
		if (pageNo < 1) {
			pageNo = 1;
		}
		
		List<Member> list = mBiz.getMember(pageNo);
		
		request.setAttribute("members", list);  // ����
		request.setAttribute("pages", pages);   // ��ҳ��
		request.setAttribute("rows", rows);     // ��������
		request.setAttribute("pageNo", pageNo); // ��ǰҳ��
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
	
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
