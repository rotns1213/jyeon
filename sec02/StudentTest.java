package sec02;

public class StudentTest {
	public static void main (String[] args) {
		Student s1 = new Student("지욘니", "051213-4000000", 100);
		System.out.println("name : " + s1.name);
		System.out.println("ssn : " + s1.ssn);
		System.out.println("syuNo : " + s1.stuNo);
	}
}
