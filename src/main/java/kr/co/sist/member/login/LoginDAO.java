package kr.co.sist.member.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConnection;

public class LoginDAO {
	
	private static LoginDAO lDAO;
	private LoginDAO() {
		
	}
	
	public static LoginDAO getInstatnce() {
		if(lDAO ==null) {
			lDAO=new LoginDAO();
		}//end if
		
		return lDAO;
	}//getInstatnce
	
	public LoginResultDTO selectLogin(LoginDTO lDTO)throws SQLException{
		LoginResultDTO lrDTO=null;
		
		DbConnection db=DbConnection.getInstance();
		
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		Connection con=null;
		
		try {
		//1.JNDI 사용객체 생성
		//2.DBCP에서 연결객체 얻기(DataSource)
		//3.Connection 얻기
			con=db.getDbConn();
		//4.쿼리문 생성객체 얻기
			StringBuilder selectLoginInfo=new StringBuilder();
			selectLoginInfo
			.append(" select  	 name, email ")
			.append(" from		 web_member ")
			.append(" where 	 id=? and pass=? ");
			
			
			pstmt=con.prepareStatement(selectLoginInfo.toString());
		//5.바인드변수에 값 할당
			pstmt.setString(1, lDTO.getId());
			pstmt.setString(2, lDTO.getPass());
		//6.쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()){
				//검색 결과가 있으면 DTO 객체에 값으 ㄹ생성
				lrDTO=new LoginResultDTO();
				lrDTO.setId(lDTO.getId());//parameter로 입력된 아이디 사용
				lrDTO.setName(rs.getString("name"));//암호화된 데이터
				lrDTO.setEmail(rs.getString("email"));//암호화된 데이터
			}//end if
		}finally {
		//7.연결 끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		return lrDTO;
	}//selectId
	
}//class
