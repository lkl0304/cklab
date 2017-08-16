package ck.lab.biz.member.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import ck.lab.biz.member.MemberBiz;
import ck.lab.dao.BaseDao;
import ck.lab.entity.Member;

public class MemberImpl implements MemberBiz {
	private BaseDao dao = new BaseDao();
	@Override
	public boolean addMember(Member member) {
		String sql = "insert into member (name, sex, grade, tel, birth) values (?,?,?,?,?)";
		return dao.SqlUpdate(sql, member.getName(), member.getSex(), member.getGrade(), member.getTel(), member.getBirth());
	}

	@Override
	public boolean delMember(int id) {
		String sql = "delete from member where id=?";
		return dao.SqlUpdate(sql, id);
	}

	@Override
	public boolean changeInfo(Member member) {
		String sql = "update member set name=?, sex=?, grade=?, tel=?, birth=? where id=?";
		return dao.SqlUpdate(sql, member.getName(), member.getSex(), member.getGrade(), member.getTel(), member.getBirth(), member.getId());
	}

	@Override
	public List<Member> getMember(int pageNo) {
		int num =  (pageNo - 1)*pageSize; // 开始地方
		String sql = "select * from member order by id DESC limit ?,?";
		
		List<Member> list = dao.SqlQuery(sql, new BeanListHandler<>(Member.class), num, pageSize);
		if (list != null && !list.isEmpty()) {
			return list;
		}
		return null;
	}

	@Override
	public List<Member> getMember(String name) {
		String sql = "select * from member where name = ?";
		List<Member> list = dao.SqlQuery(sql, new BeanListHandler<>(Member.class), name);
		if (list != null && !list.isEmpty()) {
			return list;
		}
		return null;
	}

	@Override
	public int getRows() {
		String sql = "select count(*) from member";
	 	Object[] o = dao.SqlQuery(sql, new ArrayHandler());
	 	if (o.length > 0) {
			return Integer.parseInt(o[0].toString());
		}
		return 0;
	}

}
