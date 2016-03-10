package model;

//����������Ϣ
public class StudentInfo {
	
	public enum Gender {
		Male, Female
	}
	
	/*
	 * �����������
	 * 1. �Ƽ���  A
	 * 2. �����س��� B
	 * 3. ��ˮƽ�˶�Ա C
	 * 4. ����� D
	 * 5. ����ѧ E
	 * 6. ����ѧ F
	 * 7. �������������� G
	 */
	public enum Category {
		Recommended, //�Ƽ���
		Art, //�����س���
		Athlete, //��ˮƽ�˶�Ա
		Transfer, //�����
		Music, //����ѧ
		FineArt, //����ѧ
		Broadcasting //��������������
	}
	
	private int studentId;
	private String registrationNumber;//������ɵı�����
	private String password;//��¼����
	private String examPermitNumber;//�߿�������
	private String studentName;//��������
	private String location;//��������
	private String province;//�߿�ʡ��
	private String region;//�߿�����
	private String graduateSchool;//��ҵѧУ
	private String idCardNumber;//���֤��
	private Gender gender;//�Ա�
	private int age;//����
	private String phoneNumber;//����
	private Category category; //��������
	private String e_mail;//e-mail
	private String address;//��ַ
	
	private boolean state;//�Ƿ����ɹ�
	
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
			categoryString = "�Ƽ���";
			break;
		case Art:
			categoryString = "�����س���";
			break;
		case Athlete:
			categoryString = "��ˮƽ�˶�Ա";
			break;
		case Transfer:
			categoryString = "�����";
			break;
		case Music:
			categoryString = "����ѧ";
			break;
		case FineArt:
			categoryString = "����ѧ";
			break;
		case Broadcasting:
			categoryString = "��������������";
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
		
		if (categoryString.equals("�Ƽ���"))
		{
			category = Category.Recommended;
		} 
		else if(categoryString.equals("�����س���"))
		{
			category = Category.Art;
		}
		else if(categoryString.equals("��ˮƽ�˶�Ա"))
		{
			category = Category.Athlete;
		}
		else if(categoryString.equals("�����"))
		{
			category = Category.Transfer;
		}
		else if(categoryString.equals("����ѧ"))
		{
			category = Category.Music;
		}
		else if(categoryString.equals("����ѧ"))
		{
			category = Category.FineArt;
		}
		else if(categoryString.equals("��������������"))
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
			genderString = "��";
		}
		else if (gender == Gender.Female)
		{
			genderString = "Ů";
		}
		
		return genderString;
		
	}
	
	public static Gender getGender(String genderString) {
		
		Gender gender = null;
		
		if (genderString == null)
		{
			return gender;
		}
		
		if (genderString.equals("��"))
		{
			gender = Gender.Male;
		}
		else if (genderString.equals("Ů"))
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
		if (state) stateString = "�ѱ���";
		else stateString = "δ����";
		return stateString;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
}
