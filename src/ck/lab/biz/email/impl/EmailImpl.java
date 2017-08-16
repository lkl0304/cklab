package ck.lab.biz.email.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import ck.lab.biz.email.EmailBiz;
import ck.lab.dao.BaseDao;
import ck.lab.entity.Email;

public class EmailImpl implements EmailBiz {
	private BaseDao dao = new BaseDao();
	@Override
	public boolean addEmail(Email email) {
		String sql = "insert into email (name, tel, email, time, status, content) values (?,?,?,?,?,?)";
		return dao.SqlUpdate(sql, email.getName(), email.getTel(), email.getEmail(), email.getTime(), 0, email.getContent());
	}
	
	@Override
	public boolean delEmail(int id) {
		String sql = "delete from email where id=?";
		return dao.SqlUpdate(sql, id);
	}

	@Override
	public List<Email> getEmail(String name) {
		String sql = "select * from email where name=?";
		List<Email> list = dao.SqlQuery(sql, new BeanListHandler<>(Email.class), name);
		if (list != null && !list.isEmpty()) {
			return list;
		}
		return null;
	}

	@Override
	public List<Email> getEmail(int pageNo, int status) {
		int num = (pageNo - 1)*pageSize; // 开始地方
		List<Email> list = null;
		String sql = null;
		
		if (status > 1) {
			sql = "select * from email order by id DESC limit ?,?";
			list = dao.SqlQuery(sql, new BeanListHandler<>(Email.class), num, pageSize);
		} else {
			sql = "select * from email where status=? order by id DESC limit ?,?";
			list = dao.SqlQuery(sql, new BeanListHandler<>(Email.class), status, num, pageSize);
		}
		
		if (list != null && !list.isEmpty()) {
			return list;
		}
		return null;
	}

	@Override
	public int getRows() {
		String sql = "select count(*) from email";
	 	Object[] o = dao.SqlQuery(sql, new ArrayHandler());
	 	if (o.length > 0) {
			return Integer.parseInt(o[0].toString());
		}
		return 0;
	}
	
	@Override
	public void setStatus(int id) {
		String sql = "update email set status=? where id=?";
		dao.SqlUpdate(sql, 1, id);
	}


	@Override
	public int getClose() {
		String sql = "select count(*) from email where status='0'";
	 	Object[] o = dao.SqlQuery(sql, new ArrayHandler());
	 	if (o.length > 0) {
			return Integer.parseInt(o[0].toString());
		}
		return 0;
	}

	@Override
	public int getOpen() {
		String sql = "select count(*) from email where status='1'";
	 	Object[] o = dao.SqlQuery(sql, new ArrayHandler());
	 	if (o.length > 0) {
			return Integer.parseInt(o[0].toString());
		}
		return 0;
	}
	
}
