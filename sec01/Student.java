package sec01;

public class Student {
	//특성 = 속성 = 필드 : 변수, 자료형(int, double, String)
	//이름, 전공, 학점 ...
	//멤버 변수
	String name;
	String major; //변수명 대문자 X, 같은 자료형은 한 줄에 작성 가능.
	double gpa; //학점 
	
	Student(String name, String major)
	{
		this.name=name; //name="서지연";
		this.major=major; //major="IT";
		//변수를 사용하면 학생 전체 값을 받을 수 있음.
	}
	
	Student(String name, String major, double gpa)
	{
		//this.name=name; this.major=major; 겹치니까 안 적어도 됨.
		this(name, major);
		this.gpa=gpa;
	}
	//접근자(getter 메소드) / 변경자(setter 메소드)

	public String getName() {
		return name;
	}

	public String getMajor() {
		return major;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setMajor(String major) {
		this.major = major;
	}
	//객체 현 상태를 출력
	void showInfo()
	{
		System.out.println("name:"+name);
		System.out.println("major:"+major);
		System.out.println("gpa:"+gpa);
	}
	//객체 현 상태를 반환하는 메소드
	public String toString() {
		String tmp;
		tmp = name;
		tmp += major;
		tmp += gpa;
		return name+major+gpa;
	}
	
}
