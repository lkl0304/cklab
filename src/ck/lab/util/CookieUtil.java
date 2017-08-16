package ck.lab.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ck.lab.entity.Admin;

public class CookieUtil {
	private String ADMIN_KEY = "Wxxy_CK_lab";
	private HttpServletRequest  request = null;
	private HttpServletResponse response = null;
	
	public CookieUtil(HttpServletRequest request, HttpServletResponse response){
		this.request  = request;
		this.response = response;
	}
	
	public void setCookie(Admin v) {
		Cookie cookie = new Cookie(ADMIN_KEY, v.getName() + "-" + v.getPass());
		cookie.setMaxAge(3600*24*7);  // …Ë÷√cookie±£¥Ê7ÃÏ
		response.addCookie(cookie);
	}
	
	public Admin getCookie() {
		Admin user = null;
		Cookie cookie = this.gCookie(ADMIN_KEY);
		if (cookie != null) {
			user = new Admin();
			String[] strings = cookie.getValue().split("-");
			user.setName(strings[0]);
			user.setPass(strings[1]);
		}
		return user;
	}
	
	public void delCookie() {
		Cookie c = this.gCookie(ADMIN_KEY);
		if (c != null) {
			c.setMaxAge(0);
			response.addCookie(c);
		}
	}
	
	private Cookie gCookie(String k) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals(k)) {
					return c;
				}
			}
		}
		return null;
	}
}
