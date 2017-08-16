package action.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import ck.lab.biz.admin.AdminBiz;
import ck.lab.biz.admin.impl.AdminImpl;
import ck.lab.biz.article.ArticleBiz;
import ck.lab.biz.article.impl.ArticleImpl;
import ck.lab.biz.email.EmailBiz;
import ck.lab.biz.email.impl.EmailImpl;
import ck.lab.biz.member.MemberBiz;
import ck.lab.biz.member.impl.MemberImpl;
import ck.lab.entity.Admin;
import ck.lab.util.CookieUtil;
import ck.lab.util.SessionUtil;
/**
 * 
 * @author lbxx
 * ����ֵ˵����
 * LOGIN --> ���ص���¼����
 * 
 */
public class AdminAction implements Action {
	private HttpServletRequest  request  = ServletActionContext.getRequest();
	private HttpServletResponse response = ServletActionContext.getResponse();
	
	private CookieUtil  cUtil = new CookieUtil(request, response);
	private SessionUtil sUtil = new SessionUtil(request, response);
	private AdminBiz    aBiz  = new AdminImpl();
	private MemberBiz   mBiz  = new MemberImpl();
	private EmailBiz    eBiz  = new EmailImpl();
	private ArticleBiz  atBiz = new ArticleImpl(); 
	
	private Admin admin, nAdmin;
	private int width;  // ���������Ŀ�ȵ�session�� ��ͨ��js��������

	@Override
	public String execute() throws Exception { // /admin �Ǳ���ҳ�����
		sUtil.CheckSession();
		// �����Ǳ�������
		atBiz.setType("all");
		request.setAttribute("articleNum", atBiz.getPut());
		request.setAttribute("memberNum", mBiz.getRows());
		request.setAttribute("emailNum", eBiz.getRows());
		request.setAttribute("viewNum", aBiz.getView());
		return SUCCESS;
	}
	
	public void login() throws IOException{
		response.setCharacterEncoding("gbk");
		PrintWriter w = response.getWriter();
		if (aBiz.Login(admin)) {
			
			if (admin.Test()) { // ����Ƿ��ס����
				cUtil.setCookie(admin);  // ����cookie
			}
			
			sUtil.setSession(admin);  // ����session
			
			w.println("��½�ɹ���");
		}
		w.close();
	}
	public void logout() throws IOException{
		cUtil.delCookie();
		sUtil.delSession();
		
		response.sendRedirect("login");
	}
	public void change() throws IOException{ // �޸����� ��ת�߼�ͨ��jsʵ��
		sUtil.CheckSession();
		response.setCharacterEncoding("gbk");
		PrintWriter w = response.getWriter();
 		if (aBiz.Change(nAdmin)) {
 			w.println("�޸ĳɹ���");
		}
 		w.close();
	}
	
	public void setWidth(){ // ����������ȵ�session��
		request.getSession().setAttribute("Width", width);
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public Admin getnAdmin() {
		return nAdmin;
	}
	public void setnAdmin(Admin nAdmin) {
		this.nAdmin = nAdmin;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
}
