package com.bit.bbs05.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.bbs05.dto.Bbs05Dto;
import com.bit.bbs05.util.MyOracle;

public class Bbs05Dao {
	static Connection conn;
	static PreparedStatement pstmt;
	static ResultSet rs;

public static ArrayList<Bbs05Dto> selectAll() {
	ArrayList<Bbs05Dto> list=new ArrayList<Bbs05Dto>();
	String sql="select * from bbs05 order by num desc";
	try {
		conn=MyOracle.getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			Bbs05Dto bean=new Bbs05Dto();
			bean.setNum(rs.getInt("num"));
			bean.setId(rs.getString("id"));
			bean.setSub(rs.getString("sub"));
			bean.setNalja(rs.getTimestamp("nalja"));
			list.add(bean);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return list;
}

}








