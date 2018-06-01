package service;

import java.util.List;

import javax.servlet.http.HttpSession;

import dao.AuthorizationDAO;
import dao.AuthorizationDAOOracle;
import vo.Employee;
import vo.MydpLine;
import vo.SimpleEmp;

public class AuthorizationService {
	private AuthorizationDAO dao = new AuthorizationDAOOracle();
	public void writeDp() throws Exception {
		
	}
	public void saveDp() throws Exception {
		
	}
	public List<Employee> searchEmp(String name) throws Exception {
		return dao.searchEmp(name);
	}
	public List<Employee> selectAll() throws Exception {
		return dao.selectAll();
	}
	public List<MydpLine> selectDpline(String session) throws Exception{
		return dao.selectDpline(session);
	}
	public List<SimpleEmp> selectMydpLineEmp(String mydplineNo) throws Exception{
		return dao.selectMydpLineEmp(mydplineNo);
	}
}
