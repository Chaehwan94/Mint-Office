package control.authorization;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import service.AuthorizationService;
import vo.Employee;

public class SearchEmpController implements Controller {
	private AuthorizationService service;
	public  SearchEmpController() {
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
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		System.out.println("search name :" + name);
		if (name == null || name.equals("")) {
			try {
				System.out.println("selectAll try");
				List<Employee>list =service.selectAll();
				request.setAttribute("list", list);
				System.out.println("selectAll try 끝");
				
			} catch (Exception e) {
				request.setAttribute("result", e.getMessage());
			}
		} else {
			try {
				List<Employee>list = service.searchEmp(name);
				request.setAttribute("list", list);
			} catch (Exception e) {
				request.setAttribute("result", e.getMessage());
			}
		}
		//String forwardURL = "contents/authorization/dp.jasp";
		String forwardURL = "contents/authorization/dpResult.jsp";
		return forwardURL;
	}

}
