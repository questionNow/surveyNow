package user.model.vo;

import java.io.Serializable;

public class UserInfo1 implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6386768255607523091L;

	private String userId;
	private String userPwd;
	private String userName;
	private int age;
	private String address;
	private String phone;
	private String email;
	private int userType;
	private String status;
	public UserInfo1() {
	
	}
	public UserInfo1(String userId, String userPwd, String userName, int age, String address, String phone, String email,
			int userType, String status) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.age = age;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.userType = userType;
		this.status = status;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "User_Info1 [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", age=" + age
				+ ", address=" + address + ", phone=" + phone + ", email=" + email + ", userType=" + userType
				+ ", status=" + status + "]";
	}
	
	
	
}
