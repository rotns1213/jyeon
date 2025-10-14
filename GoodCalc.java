package app;
import lib.Calculator;
public class GoodCalc extends Calculator {

	@Override
	public int add(int a, int b) {
		// TODO Auto-generated method stub
		return a+b;
	}

	@Override
	public int sub(int a, int b) {
		// TODO Auto-generated method stub
		return a-b;
	}

	@Override
	public double avg(int[] arr) {
		double sum=0, avg;
		for(int i=0; i<arr.length; i++)
			sum+=arr[i];
		
		avg=sum/arr.length;
		return avg;
	}
	
}
