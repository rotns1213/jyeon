//2024136024 서지연 3주차 과제 : 1번 문제 풀이 
package sec04;

public class Circle {
	String name;
	int radius;
	
	Circle(String name, int radius) {
		this.name=name;
		this.radius = radius;
	}
	
	String getName() {
		return name;
	}
	int getRadius() {
		return radius;
	}
	double getArea() {
		return Math.PI * radius * radius;
	}
	double getPerimeter() {
		return 2 * Math.PI * radius;
	}
	void getPrint() {
		System.out.printf("%s의 반지름은 %d\n -> 면적은 %f\n, 둘레길이는 %.2f\n", name, radius, getArea(), getPerimeter());
	}
}
