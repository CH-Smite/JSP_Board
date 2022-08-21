package freeboard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FreeboardDAO {
	private Connection con;
	private ResultSet rs;
	
	
	public FreeboardDAO() {
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}
	// 현재 시간 - boradDate에 사용하기 위함

	public int getNext() {
		String SQL = "SELECT boardID FROM BOARD ORDER BY boardID DESC";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	// 게시물 번호
	
	public int write(String boardTitle, String userID, String boardContent) {
		String SQL = "INSERT INTO BOARD VALUES(?, ?, ? ,?, ?, ?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, boardContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	//글 작성 함수
	
	public ArrayList<Freeboard> getList(int pageNumber) {
		//Ctrl + Shift + o 단축키 사용 외부라이브러리 가져오기
		String SQL = "SELECT * FROM BOARD WHERE boardID < ? AND boardAvailable = 1 ORDER BY boardID DESC LIMIT 10;";
		ArrayList<Freeboard> list = new ArrayList<Freeboard>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1)*10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Freeboard freeboard = new Freeboard();
				freeboard.setBoardID(rs.getInt(1));
				freeboard.setBoardTitle(rs.getString(2));
				freeboard.setUserID(rs.getString(3));
				freeboard.setBoardDate(rs.getString(4));
				freeboard.setBoardContent(rs.getString(5));
				freeboard.setBoardAvailable(rs.getInt(6));
				list.add(freeboard);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	} // 10개의 게시글 리스트 출력
	
	public boolean nextPage (int pageNumber) {
		String SQL = "SELECT * FROM BOARD WHERE boardID < ? AND boardAvailable = 1;";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	} // 페이징 처리
	
	public Freeboard getFreeboard(int boardID) {
		String SQL = "SELECT * FROM BOARD WHERE boardID = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Freeboard freeboard = new Freeboard();
				freeboard.setBoardID(rs.getInt(1));
				freeboard.setBoardTitle(rs.getString(2));
				freeboard.setUserID(rs.getString(3));
				freeboard.setBoardDate(rs.getString(4));
				freeboard.setBoardContent(rs.getString(5));
				freeboard.setBoardAvailable(rs.getInt(6));
				return freeboard;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	} // 게시글을 불러옴
}