package sec01;
abstract class Shape { //추상클래스 
		//System.out.println("Shape");
		//void draw();만 적을시 오류 발생
		abstract void draw(); //추상메소드 
		void show() {
			
		}
}

class Rect extends Shape {
	void draw() { 
		System.out.println("Rect");
	}
}


public class ShapeTest {

	public static void main(String[] args) {
		Rect r = new Rect();
		r.draw();
		//Shape s = new Shape;
	}

}



//overrides는 무엇인가? 
