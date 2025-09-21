//2024136024 서지연

package sec2;

public class Polygon {
	//멤버 변수 정의 
	String shape;
	int width;
	int height;
	double area;
	
	//생성자 정의 
	Polygon(String shape, int width){
		this.shape=shape;
		this.width=width;
	}
	Polygon(String shape, int width, int height){
		this(shape, width);
		this.height=height;
	}
	
	//멤버 메소드 정의 : clacArea()
	//정사각형
	void clacArea(int width) {
		area=width*width;
	}
	//삼각형, 직사각형 
	void clacArea(int width, int height, int s) {
		if(s==1)
			area=(width*height)/2;
		else if(s==2)
			area=width*height;
	}
	//멤버메소드 정의 : printArea()
	void printArea(){
		System.out.println(shape);
		System.out.println("area"+area);
	}
}
