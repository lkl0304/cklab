package ck.lab.util;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ck.lab.biz.admin.AdminBiz;
import ck.lab.biz.admin.impl.AdminImpl;
import ck.lab.entity.Admin;

public class SessionUtil {
	private String SKEY = "CK_Session";
	
	private HttpServletRequest  request  = null;
	private HttpServletResponse response = null;
	private HttpSession         session  = null;
	private CookieUtil          cUtil    = null;
	
	private AdminBiz aBiz = new AdminImpl();
	
	public SessionUtil(HttpServletRequest request, HttpServletResponse response){
		this.session  = request.getSession();
		this.request  = request;
		this.response = response;
		cUtil = new CookieUtil(request, response);
	}
 	
 	public void setSession(Admin admin){
 		if (admin != null) {
 			session.setAttribute(SKEY, admin);
		}
 	}
	
 	public void delSession() {
 		session.removeAttribute(SKEY);
 	}
 	
 	public void CheckSession(){
 		if (!this.CheckA()) {
			try {
				response.sendRedirect(request.getContextPath() + "/admin/login");
			} catch (IOException e) {
				System.err.println("session验证：页面重定向失败！");
				//e.printStackTrace();
			}
 		}
	}
 	public boolean CheckA(){
 		this.setSession(cUtil.getCookie()); // 从cookie中读取值 
		Admin a = (Admin) session.getAttribute(SKEY);
		//System.out.println("admin name --> " + a);
		if (a != null && aBiz.Login(a)) {
			return true;
		}
		return false;
 	}
}
