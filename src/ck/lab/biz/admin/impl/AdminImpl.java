package ck.lab.biz.admin.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import ck.lab.biz.admin.AdminBiz;
import ck.lab.dao.BaseDao;
import ck.lab.entity.Admin;

public class AdminImpl implements AdminBiz {
	private BaseDao dao = new BaseDao();
	
	@Override
	public boolean Login(Admin admin) {
		String sql = "select * from admin where name = ? and pass = ?";
		if (admin != null) {
			List<Admin> list = dao.SqlQuery(sql, new BeanListHandler<>(Admin.class), admin.getName(), admin.getPass());
			if (list != null && !list.isEmpty()){
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean Change(Admin n) {
		String sql = "update admin set name = ?, pass = ?";
		if (n != null) {
			return dao.SqlUpdate(sql, n.getName(), n.getPass());
		}
		return false;
	}

	@Override
	public void addView() {
		String sql = "update view set num=(num + 1)";
		dao.SqlUpdate(sql);
	}
	
	@Override
	public int getView() {
		String sql = "select num from view";
		Object[] o = dao.SqlQuery(sql, new ArrayHandler());
		if (o != null) {
			return Integer.parseInt(o[0].toString());
		}
		return 0;
	}

}
