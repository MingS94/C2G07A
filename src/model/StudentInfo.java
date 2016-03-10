package model;

//考生报名信息
public class StudentInfo {
	
	public enum Gender {
		Male, Female
	}
	
	/*
	 * 报考考试类别：
	 * 1. 推荐生  A
	 * 2. 艺术特长生 B
	 * 3. 高水平运动员 C
	 * 4. 插班生 D
	 * 5. 音乐学 E
	 * 6. 美术学 F
	 * 7. 播音与主持艺术 G
	 */
	public enum Category {
		Recommended, //推荐生
		Art, //艺术特长生
		Athlete, //高水平运动员
		Transfer, //插班生
		Music, //音乐学
		FineArt, //美术学
		Broadcasting //播音与主持艺术
	}
	
	private int studentId;
	private String registrationNumber;//随机生成的报名号
	private String password;//登录密码
	private String examPermitNumber;//高考报名号
	private String studentName;//考试姓名
	private String location;//报考考点
	private String province;//高考省份
	private String region;//高考区县
	private String graduateSchool;//毕业学校
	private String idCardNumber;//身份证号
	private Gender gender;//性别
	private int age;//年龄
	private String phoneNumber;//号码
	private Category category; //报考类型
	private String e_mail;//e-mail
	private String address;//地址
	
	private boolean state;//是否报名成功
	
	public StudentInfo() {
		
	}
	
	public String getRegistrationNumber() {
		return registrationNumber;
	}
	
	public void setRegistrationNumber(String registrationNumber) {
		this.registrationNumber = registrationNumber;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getExamPermitNumber() {
		return examPermitNumber;
	}
	
	public void setExamPermitNumber(String examPermitNumber) {
		this.examPermitNumber = examPermitNumber;
	}
	
	public String getRegion() {
		return region;
	}
	
	public void setRegion(String region) {
		this.region = region;
	}
	
	public String getProvince() {
		return province;
	}
	
	public void setProvince(String province) {
		this.province = province;
	}
	
	public String getStudentName() {
		return studentName;
	}
	
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	
	public String getIdCardNumber() {
		return idCardNumber;
	}
	
	public void setIdCardNumber(String idCardNumber) {
		this.idCardNumber = idCardNumber;
	}
	
	public Gender getGender() {
		return gender;
	}
	
	public void setGender(Gender gender) {
		this.gender = gender;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
	
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public Category getCategory() {
		return category;
	}
	
	public void setCategory(Category category) {
		this.category = category;
	}
	
	public String getE_mail() {
		return e_mail;
	}
	
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public static String getCategoryString(Category category) {
		
		String categoryString = null;
		
		if (category == null)
		{
			return categoryString;
		}
		
		switch (category) 
		{
		case Recommended:
			categoryString = "推荐生";
			break;
		case Art:
			categoryString = "艺术特长生";
			break;
		case Athlete:
			categoryString = "高水平运动员";
			break;
		case Transfer:
			categoryString = "插班生";
			break;
		case Music:
			categoryString = "音乐学";
			break;
		case FineArt:
			categoryString = "美术学";
			break;
		case Broadcasting:
			categoryString = "播音与主持艺术";
			break;
		default:
			break;
		}
		return categoryString;
		
	}
	
	public static Category getCategory(String categoryString) {
		
		Category category = null;
		
		if (categoryString == null)
		{
			return category;
		}
		
		if (categoryString.equals("推荐生"))
		{
			category = Category.Recommended;
		} 
		else if(categoryString.equals("艺术特长生"))
		{
			category = Category.Art;
		}
		else if(categoryString.equals("高水平运动员"))
		{
			category = Category.Athlete;
		}
		else if(categoryString.equals("插班生"))
		{
			category = Category.Transfer;
		}
		else if(categoryString.equals("音乐学"))
		{
			category = Category.Music;
		}
		else if(categoryString.equals("美术学"))
		{
			category = Category.FineArt;
		}
		else if(categoryString.equals("播音与主持艺术"))
		{
			category = Category.Broadcasting;
		}
		
		return category;
		
	}
	
	public static String getGenderString(Gender gender) {
		
		String genderString = null;
		
		if (gender == null)
		{
			return genderString;
		}
		
		if (gender == Gender.Male)
		{
			genderString = "男";
		}
		else if (gender == Gender.Female)
		{
			genderString = "女";
		}
		
		return genderString;
		
	}
	
	public static Gender getGender(String genderString) {
		
		Gender gender = null;
		
		if (genderString == null)
		{
			return gender;
		}
		
		if (genderString.equals("男"))
		{
			gender = Gender.Male;
		}
		else if (genderString.equals("女"))
		{
			gender = Gender.Female;
		}
		
		return gender;
		
	}

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getGraduateSchool() {
		return graduateSchool;
	}

	public void setGraduateSchool(String graduateSchool) {
		this.graduateSchool = graduateSchool;
	}
	
	public static String printState(boolean state) {
		String stateString = null;
		if (state) stateString = "已报名";
		else stateString = "未报名";
		return stateString;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
}
