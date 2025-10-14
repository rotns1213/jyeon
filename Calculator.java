package lib;
//추상클래스 : 객체 생성 불가능 
public abstract class Calculator {
	//추상메소드 + 일반메소드 가능 
	public abstract int add (int a, int b);
	public abstract int sub (int a, int b);
	public abstract double avg (int[] a);
}
