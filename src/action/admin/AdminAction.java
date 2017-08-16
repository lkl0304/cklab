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
 * 返回值说明：
 * LOGIN --> 返回到登录界面
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
	private int width;  // 保存侧边栏的宽度到session中 在通过js调用设置

	@Override
	public String execute() throws Exception { // /admin 仪表盘页面过滤
		sUtil.CheckSession();
		// 加载仪表盘数据
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
			
			if (admin.Test()) { // 检测是否记住密码
				cUtil.setCookie(admin);  // 设置cookie
			}
			
			sUtil.setSession(admin);  // 设置session
			
			w.println("登陆成功！");
		}
		w.close();
	}
	public void logout() throws IOException{
		cUtil.delCookie();
		sUtil.delSession();
		
		response.sendRedirect("login");
	}
	public void change() throws IOException{ // 修改密码 跳转逻辑通过js实现
		sUtil.CheckSession();
		response.setCharacterEncoding("gbk");
		PrintWriter w = response.getWriter();
 		if (aBiz.Change(nAdmin)) {
 			w.println("修改成功！");
		}
 		w.close();
	}
	
	public void setWidth(){ // 保存侧边栏宽度到session中
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
