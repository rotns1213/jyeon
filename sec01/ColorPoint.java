package sec01;

public class ColorPoint extends Point { //extends + 부모 클래스 파일
	String color;
	
	void setColor(String color) {
		this.color=color;
	}
	void showColorPoint() {
		System.out.println(color);
		//System.out.println(x); -> 부모 클래스에서 'private'로 정의된 값이기 때문에 오류
	}
}
