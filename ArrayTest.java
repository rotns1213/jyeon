package sec02;
import java.util.Arrays;
public class ArrayTest {

	public static void main(String[] args) {
		int[] arr = {50, 30, 40, 10, 20};
		
		printArray(arr);
		Arrays.sort(arr);
		printArray(arr);
		System.out.println(Arrays.binarySearch(arr, 40)); //이진탐색기법 
		Arrays.fill(arr,  100);
		printArray(arr);
	}
	public static void printArray(int[] arr) {
		System.out.print("[");
		for(int i = 0; i<arr.length; i++)
			System.out.print(arr[i]+" ");
		System.out.println("]");
	}
}
