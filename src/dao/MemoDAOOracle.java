package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sql.MyConnection;
import vo.Memo;

public class MemoDAOOracle implements MemoDAO {

	@Override
	public int selectCount() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectCountSQL = 
				"SELECT COUNT(*) totalcnt FROM MEMO";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(selectCountSQL);
			rs = pstmt.executeQuery();
			rs.next();
			int totalCount = rs.getInt("totalcnt");
			return totalCount;
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
	}

	@Override
	public List<Memo> selectAll(int page) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String selectAllSQL="SELECT  b.*\r\n" + 
							"FROM (SELECT ROWNUM r, a.*\r\n" + 
							"      FROM (SELECT to_number(m.memo_no,'9999') no, m.emp_no, m.memo_date, m.memo_contents\r\n" + 
							"            FROM MEMO m\r\n" + 
							"            order by no desc)  a) b\r\n" + 
							"WHERE r BETWEEN  ? AND ?";
		List<Memo> list = new ArrayList<>();
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(selectAllSQL);
			int cntPerPage=5;//1페이지별 3건씩 보여준다
			int endRow=cntPerPage * page;
			int startRow=endRow-cntPerPage+1; 			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();		
			while(rs.next()) {
				list.add(new Memo(
						rs.getString("no"),
						rs.getString("emp_no"),
						rs.getString("memo_date"),
						rs.getString("memo_contents")
						));
			}
			return list;
		}finally {
			MyConnection.close(rs, pstmt, con);			
		}
	}

	@Override
	public void insert(Memo m) throws Exception {
		/*2)DB와 연결 */
		Connection con = null;
		
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
		try {
			con = sql.MyConnection.getConnection();
			String insertSQL = "INSERT INTO MEMO (memo_no,emp_no,memo_date,memo_contents)\r\n" + 
								"VALUES(memo_seq.nextval,?,SYSDATE,?)";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, m.getEmp_no());
			pstmt.setString(2, m.getMemo_contents());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			if(e.getErrorCode()==1) { 
				throw new Exception("Error! insert Memo");
			}else {
				throw e;
			}
		}finally {
			sql.MyConnection.close(pstmt, con);
		}
	}

	@Override
	public void modify(Memo m) throws Exception {
		/*2)DB와 연결 */
		Connection con = null;
		
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
		try {
			con = sql.MyConnection.getConnection();
			String modifySQL = "UPDATE MEMO\r\n" + 
					"SET\r\n" + 
					"memo_date = SYSDATE,\r\n" + 
					"memo_contents=?\r\n" + 
					"WHERE memo_no=?";
			pstmt = con.prepareStatement(modifySQL);
			pstmt.setString(1, m.getMemo_contents());
			pstmt.setString(2, m.getMemo_no());
			
			pstmt.executeUpdate();
		}catch(SQLException e) {
			if(e.getErrorCode()==1) { 
				throw new Exception("Error! Modify Memo");
			}else {
				throw e;
			}
		}finally {
			sql.MyConnection.close(pstmt, con);
		}		
	}

	@Override
	public void delete(String memo_no) throws Exception {
		/*2)DB와 연결 */
		Connection con = null;
		
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
		try {
			con = sql.MyConnection.getConnection();
			String deleteSQL = "DELETE FROM MEMO\r\n" + 
								"WHERE memo_no = ?";
			pstmt = con.prepareStatement(deleteSQL);
			pstmt.setString(1, memo_no);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			if(e.getErrorCode()==1) { 
				throw new Exception("Error! delete Memo!");
			}else {
				throw e;
			}
		}finally {
			sql.MyConnection.close(pstmt, con);
		}
	}
}
