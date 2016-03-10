package model;

public class Expert {
	
	private int expertID;
	private String expertName;
	private String certificateID;
	private String majorIn;
	private String mobilePhone;
	private String address;
	private String email;
	private String username;
	private String password;
	
	public int getExpertID() {
		return expertID;
	}
	public void setExpertID(int expertID) {
		this.expertID = expertID;
	}
	public String getExpertName() {
		return expertName;
	}
	public void setExpertName(String expertName) {
		this.expertName = expertName;
	}
	public String getCertificateID() {
		return certificateID;
	}
	public void setCertificateID(String certificateID) {
		this.certificateID = certificateID;
	}
	public String getMajorIn() {
		return majorIn;
	}
	public void setMajorIn(String majorIn) {
		this.majorIn = majorIn;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
