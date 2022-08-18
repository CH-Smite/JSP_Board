package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BOARD";
			String dbID = "root";
			String dbPassword = "root"; // Mysql 패스워드 입력
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // 데이터베이스 연결
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ? ";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if((rs.getString(1).equals(userPassword))) {
					return 1; // 로그인
				}
				else
					return 0; // Password 오류
			}
			return -1; // ID 오류
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;	// 데이터베이스 오류
	} // 로그인 함수 생성
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			return pstmt.executeUpdate();
			// ID, PW, 이름. 이메일 순으로 데이터을 받아 DB에 데이터 추가
		}
			catch(Exception e) {
				e.printStackTrace();
			}
			return -1; // 데이터베이스 오류
	} // 회원가입 함수 생성
}
