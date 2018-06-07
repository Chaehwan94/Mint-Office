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
import vo.MydpLine;

public class DpWriteController implements Controller {
	private AuthorizationService service;
	public DpWriteController() {
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
		System.out.println("execute 진입");
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		System.out.println("name : " + name);
		if (name == null || name.equals("")) {
			try {
				System.out.println("selectAll try");
				List<Employee>list =service.selectAll();
				request.setAttribute("list", list);
				System.out.println("selectAll try 끝");
				System.out.println("mydpline select try");
				String sessionNo = (String) session.getAttribute("emp_no");
				List<MydpLine> mydplinelist = service.selectDpline(sessionNo);
				request.setAttribute("mydplinelist", mydplinelist);
				System.out.println("mydpline select end");
			} catch (Exception e) {
				request.setAttribute("list", e.getMessage());
			}
		}
		String forwardURL = "contents/authorization/dpwrite.jsp";
		return forwardURL;
	}

}
