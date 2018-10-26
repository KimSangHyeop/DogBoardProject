package customer; //会員管理

public class Customer {
	private String name;
	private String age;
	private String userid;
	private String password;
	private String telNum;
	private String gender;
	private String addr;
	private String detailAddr;
	private String content;
	
	public Customer() {}

	public Customer(String name, String age, String userid, String password, String telNum, String gender, String addr,
			String detailAddr, String content) {
		super();
		this.name = name;
		this.age = age;
		this.userid = userid;
		this.password = password;
		this.telNum = telNum;
		this.gender = gender;
		this.addr = addr;
		this.detailAddr = detailAddr;
		this.content = content;
	}
	
	public String getName() {//get set Method
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTelNum() {
		return telNum;
	}

	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Customer [name=");
		builder.append(name);
		builder.append(", age=");
		builder.append(age);
		builder.append(", userid=");
		builder.append(userid);
		builder.append(", password=");
		builder.append(password);
		builder.append(", telNum=");
		builder.append(telNum);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", addr=");
		builder.append(addr);
		builder.append(", detailAddr=");
		builder.append(detailAddr);
		builder.append(", content=");
		builder.append(content);
		builder.append("]");
		return builder.toString();
	}

}
