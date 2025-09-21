package sec03;

public class CoffeeTest {
	public static void main(String[] args) {
		Coffee c1=new Coffee("아이스 아메리카노", 3000);
		
		System.out.println(c1.toString());		
		c1.setPrice(c1.getPrice()+500);
		
		System.out.println("가격 변경 후 : " + c1.toString());
		
		Coffee c2 = new Coffee("핫 아메리카노", 2000);
		Coffee c3 = new Coffee("바닐라 라떼", 4000);
		Coffee[] list = {c1, c2, c3};
		int sum=0;
		double avg;
		
		for(int i = 0; i<list.length; i++) {
			System.out.println(list[i].toString());
			sum += list[i].getPrice();
		}
		/* for(Coffee c : list) {
			System.out.println(c.toString());
		//더 나아가기 : 커피 평균 단가를 계산한 후 출력하시오.
		} */
		//평균 계산 및 출력 
		avg=sum/list.length;
		System.out.println("커피 평균 단가 : " + avg);
	}
}
