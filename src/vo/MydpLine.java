package vo;

public class MydpLine {
	private String mydpline_no;
	private String mydpline_name;
	
	public MydpLine() {
	}
	
	public MydpLine(String mydpline_no, String mydpline_name) {
		this.mydpline_no = mydpline_no;
		this.mydpline_name = mydpline_name;
	}

	public String getMydpline_no() {
		return mydpline_no;
	}
	public void setMydpline_no(String mydpline_no) {
		this.mydpline_no = mydpline_no;
	}
	public String getMydpline_name() {
		return mydpline_name;
	}
	public void setMydpline_name(String mydpline_name) {
		this.mydpline_name = mydpline_name;
	}

}
