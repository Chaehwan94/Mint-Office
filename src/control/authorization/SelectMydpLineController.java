package control.authorization;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;
import service.AuthorizationService;
import vo.Employee;
import vo.SimpleEmp;

public class SelectMydpLineController implements Controller {
	private AuthorizationService service;
	public SelectMydpLineController() {
		super();
	}
	public AuthorizationService getService() {
		return service;
	}

	public void setService(AuthorizationService service) {
		this.service = service;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("SelectMydpLineController 진입");
		String mydpline_no = request.getParameter("mydpline_no");
		System.out.println("mydpline_no : " + mydpline_no);
		try {
			List<SimpleEmp> mydplineEmp = service.selectMydpLineEmp(mydpline_no);
			request.setAttribute("mydplineEmp", mydplineEmp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String forwardURL = "contents/authorization/mydplineEmp.jsp";
		return forwardURL;
	}
}
