//2024136024 서지연 

package sec02;

public class GraduateStudent extends Student{
	public GraduateStudent(String name) {
		super(name);
	}
	public void computeGrade() {
		if (score >=80)
			grade = "통과";
		else
			grade = "과락";
	}
}
