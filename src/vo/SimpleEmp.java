package vo;

public class SimpleEmp {
	private String name;
	private String department;
	private String position;
	private String order;
	private String status;
	
	public SimpleEmp() {
		super();
	}
	
	public SimpleEmp(String name, String department, String position, 
			String order, String status) {
		super();
		this.name = name;
		this.department = department;
		this.position = position;
		this.order = order;
		this.status = status;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

}
