package app;

public class PackageTest {
	public static void  main(String[] args) {
		GoodCalc calc=new GoodCalc();
		int[] arr = {10, 20, 30, 40, 50};
		
		System.out.println(calc.add(10,20));
		System.out.println(calc.sub(10,20));
		System.out.println(calc.avg(arr));
	}
}
