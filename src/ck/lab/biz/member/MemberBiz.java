package ck.lab.biz.member;

import java.util.List;

import ck.lab.entity.Member;

public interface MemberBiz {
	public int pageSize = 11;
	public boolean addMember(Member member);
	public boolean delMember(int id);
	public boolean changeInfo(Member member);
	public List<Member> getMember(int pageNo);
	public List<Member> getMember(String name);
	public int getRows();
}
