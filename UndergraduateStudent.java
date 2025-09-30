//2024136024 서지연 

package sec02;

public class UndergraduateStudent extends Student{
	public UndergraduateStudent(String name) {
		super(name);
	}
	
	public void computeGrade() {
		if (score >= 70)
			grade = "통과";
		else
			grade = "과락";
	}
}
