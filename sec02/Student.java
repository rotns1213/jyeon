package sec02;

public class Student extends People {
	int stuNo;
	Student(String name, String ssn, int stuNo) {
		super(name, ssn);
		this.stuNo = stuNo;
	}
}
