//2024136024 서지연 

package sec02;

abstract class Student {
	protected int type;
	protected String name;
	protected int score;
	protected String grade;
	
	//생성자 정의 
	public Student (String name) {
		this.name=name;
	}
	
	abstract public void computeGrade();
	
	public String showInfo() {
		String result = "소속\t이름\t점수\t학점\n";
		if(type==1)
			result += "학부생";
		else
			result += "대학원";
		result += "\t"+getName();
		result += "\t"+getScore();
		result += "\t"+getGrade();
		return result;
	}
	
	//멤버변수에 대한 getter/setter 메소드 정의 (화면 우클릭 -> 소스 -> 마지막칸 3번째 -> 올 선택 -> 확인)
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
}
