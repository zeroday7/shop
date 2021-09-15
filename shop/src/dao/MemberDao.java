package dao;

import java.sql.*;

import vo.*;
import commons.*;


public class MemberDao {
	public void insertMember(Member member) throws ClassNotFoundException, SQLException {
		
		System.out.println(member.getMemberId()+"<<memberId");
		System.out.println(member.getMemberPw()+"<<memberPw");
		System.out.println(member.getMemberName()+"<<memberName");
		System.out.println(member.getMemberAge()+"<<memberAge");
		System.out.println(member.getMemberGender()+"<<memberGender");		
		/*
		 * INSERT INTO member(member_id, member_pw,member_level,member_name,member_age,member_gender,update_date,create_date)
		 * VALUES(?,PASSWORD(?),0,?,?,?,NOW(),NOW())
		 */
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql="INSERT INTO member(member_id, member_pw,member_level, member_name, member_age, member_gender, update_date, create_date) VALUES (?, PASSWORD(?), 0, ?, ?, ?, NOW(), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		stmt.setInt(4, member.getMemberAge());
		stmt.setString(5, member.getMemberGender());
		System.out.println(stmt+"<<stmt");
		int row = stmt.executeUpdate();
		if(row == 1) {
			System.out.println("입력완료");
		}
		stmt.close();
		conn.close();
	}
	public Member login(Member member) throws ClassNotFoundException, SQLException {
		Member returnMember = null;
		/*
		 * SELECT member_no memberNo, member_id memberId, member_level memberLevel
		 * FROM member
		 * WHERE member_id=? AND member_pw=PASSWORD(?)
		 */
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT member_no memberNo, member_id memberId, member_level memberLevel FROM member WHERE member_id=? AND member_pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		System.out.println(stmt+"<<stmt");
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			returnMember = new Member();
			returnMember.setMemberNo(rs.getInt("memberNo"));
			returnMember.setMemberId(rs.getString("memberId"));
			returnMember.setMemberLevel(rs.getInt("memberLevel"));
			return returnMember;
		}
		System.out.println(rs+"<<rs");
		rs.close();
		stmt.close();
		conn.close();
		return returnMember;
	}
}
