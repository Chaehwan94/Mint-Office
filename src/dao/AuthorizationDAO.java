package dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import vo.Employee;
import vo.MydpLine;
import vo.SimpleEmp;

public interface AuthorizationDAO {
	
	void writeDp() throws Exception;
	void deleteDp() throws Exception;
	List<Employee> selectAll() throws Exception;
	List<Employee> searchEmp(String name) throws Exception;
	void saveDpline() throws Exception;
	void deleteDpline() throws Exception;
	List<MydpLine> selectDpline(String session) throws Exception;
	List<SimpleEmp> selectMydpLineEmp(String mydplineNo) throws Exception;
}
