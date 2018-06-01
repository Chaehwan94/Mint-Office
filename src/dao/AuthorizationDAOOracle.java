package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import sql.MyConnection;
import vo.Employee;
import vo.MydpLine;
import vo.SimpleEmp;

public class AuthorizationDAOOracle implements AuthorizationDAO {

	@Override
	public void writeDp() throws Exception {
		

	}

	@Override
	public void deleteDp() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Employee> searchEmp(String name) throws Exception {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Employee> empList = new ArrayList<>();
		System.out.println("name Oracle : " + name);
		try {
			con = MyConnection.getConnection();
			String searchEmpSQL = "select * \r\n" + 
					"from employee\r\n" + 
					"where name like '%'||?||'%'";
					
			pstmt = con.prepareStatement(searchEmpSQL);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				empList.add(new Employee(
						rs.getString("EMP_NO"),
						rs.getString("NAME")
						));
			}
			return empList;
		} catch (SQLException e) {
			e.printStackTrace(); //톰캣콘솔
			throw e;			
		} finally {	
			MyConnection.close(rs, pstmt, con);			
		}

	}

	@Override
	public void saveDpline() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteDpline() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Employee> selectAll() throws Exception {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Employee> empList = new ArrayList<>();
		try {
			con = MyConnection.getConnection();
			String searchEmpSQL = "select *\r\n" + 
					"from employee\r\n";
					
			pstmt = con.prepareStatement(searchEmpSQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				empList.add(new Employee(
						rs.getString("EMP_NO"),
						rs.getString("NAME")
						));
			}
			return empList;
		} catch (SQLException e) {
			e.printStackTrace(); //톰캣콘솔
			throw e;			
		} finally {	
			MyConnection.close(rs, pstmt, con);			
		}
		
	}

	@Override
	public List<MydpLine> selectDpline(String session) throws Exception {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		System.out.println("Emp num : "+ session);
		List<MydpLine> mydplineList = new ArrayList<>();
		try {
			con = MyConnection.getConnection();
			String selectDpLine = "select * \r\n" + 
					"from mydpline\r\n" + 
					"where EMP_NO=?";
					
			pstmt = con.prepareStatement(selectDpLine);
			pstmt.setString(1, session);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				mydplineList.add(new MydpLine(
						rs.getString("mydpline_no"),
						rs.getString("mydpline_name")
						));
			}
			return mydplineList;
			
		} catch (SQLException e) {
			e.printStackTrace(); //톰캣콘솔
			throw e;			
		} finally {	
			MyConnection.close(rs, pstmt, con);			
		}
		
	}

	@Override
	public List<SimpleEmp> selectMydpLineEmp(String mydplineNo) throws Exception {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ResultSet rs2=null;
		//List<MydpLine> mydplineEmpList = new ArrayList<>();
		List<String> noList = new ArrayList<>();
		try {
			con = MyConnection.getConnection();
			String selectDpLine = 
					"select *\r\n" + 
					"from mydpdetail\r\n" + 
					"where mydpline_no = ?";
					
			pstmt = con.prepareStatement(selectDpLine);
			pstmt.setString(1, mydplineNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				noList.add(rs.getString("mydpdetail_emp"));
			}
			System.out.println("noList" + noList);
			
			String selectDpLineEmp =
					"select employee.NAME, position.POSITION_NAME, department.DEP_NAME, \r\n" + 
					"mydpdetail.MYDPDETAIL_ORDER, statusemp.STATUS\r\n" + 
					"from employee, mydpdetail, position, department, statusemp\r\n" + 
					"where EMPLOYEE.EMP_NO=? and MYDPDETAIL.MYDPLINE_NO=?\r\n" + 
					"AND mydpdetail.MYDPDETAIL_EMP=employee.emp_no\r\n" + 
					"AND DEPARTMENT.DEP_NO = EMPLOYEE.DEP_NO\r\n" + 
					"AND POSITION.POSITION_NO = EMPLOYEE.POSITION_NO\r\n" + 
					"AND mydpdetail.MYDPDETAIL_EMP = employee.EMP_NO\r\n" + 
					"AND statusemp.STATUS_NO = mydpdetail.status_emp";
					
			//Map<String, String> empMap;
			List<SimpleEmp> empList = new ArrayList<>();
			for(int i=0; i< noList.size(); i++ ) {
				pstmt = con.prepareStatement(selectDpLineEmp);
				pstmt.setString(1, noList.get(i));
				pstmt.setString(2, mydplineNo);
				rs2 = pstmt.executeQuery();
				while(rs2.next()) {			
					empList.add(new SimpleEmp(
						rs2.getString("NAME"),
						rs2.getString("DEP_NAME"),
						rs2.getString("POSITION_NAME"),
						rs2.getString("MYDPDETAIL_ORDER"),
						rs2.getString("STATUS")					
					));
				}
				System.out.println("empList status: " + empList.get(i).getStatus());
			}
			/*for(int i=0; i< noList.size(); i++ ) {
				pstmt = con.prepareStatement(selectDpLineEmp);
				System.out.println("name.get(i) : " + noList.get(i));
				pstmt.setString(1, noList.get(i));
				pstmt.setString(2, mydplineNo);
				rs2 = pstmt.executeQuery();
				while(rs2.next()) {
					empMap = new HashMap<>();
					empMap.put("name", rs2.getString("NAME"));
					empMap.put("dep_name", rs2.getString("DEP_NAME"));
					empMap.put("position_name", rs2.getString("POSITION_NAME"));
					empMap.put("order", rs2.getString("MYDPDETAIL_ORDER"));
					empMap.put("status", rs2.getString("STATUS"));
					empList.add(empMap);
					System.out.println("empList : " + empList);
				};
				
			}*/
			return empList;
			
		} catch (SQLException e) {
			e.printStackTrace(); //톰캣콘솔
			throw e;			
		} finally {	
			MyConnection.close(rs, pstmt, con);			
		}
			
	}

}
