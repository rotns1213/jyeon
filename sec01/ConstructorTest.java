//중간고사 3점짜리 문제 : 그대로 안 낼 거임, 쉬운 거 안 

package sec01;

class AA { //부모 객체 클래스 
	
	AA(){
		System.out.println("생성자 AA");
	}
	AA(int x) {
		System.out.println("생성자 AA"+x);
	}
	
	AA(int x, int y){
		System.out.println("생성자 AA"+x+y);
	}
}

class BB extends AA{ //자식 객체 클래스 
	BB(){
		System.out.println("생성자 BB");
	}
	BB(int x) {
		super(x, 20); //부모의 기본 생성자 호출 : super()
		//매개변수는 x, y는 값이 있어야함.
		System.out.println("생성자 BB"+x);
	}
}

public class ConstructorTest {
	public static void main(String[] args) {
		//부모 객체 생성 
		//AA a1 = new AA();
		//AA a2 = new AA(10);
		
		//자식 객체 생성 
		//BB b1 = new BB();
		//BB b2 = new BB(10);
	}
}
