//2024136024 서지연 
package sec02;
import java.util.Scanner;
public class DivideZeroTest {
	public static void main(String[] args) {
		Scanner s=new Scanner(System.in);
		int x,y, result=0;
		System.out.println("피젯수: ");
		x=s.nextInt();
		System.out.println("젯수: ");
		y=s.nextInt();
		try { //try 입력 후 컨트롤+스페이스바 -> 자동완성 
			result=x/y;
		} catch (ArithmeticException e) {
			System.out.println("젯수는 0으로 나눌 수 없음");
		}
		System.out.println(result);
	}
}
