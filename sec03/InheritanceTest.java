//2024136024 서지연 
package sec03;

public class InheritanceTest {
	public static void main(String[] args) {
		
		Employee em = new Employee ("서지연", 1000000);
		Manager mn = new Manager ("지욘니", 1000000, 100);
		Executive exe = new Executive ("서지연띠니", 1000000, 100, 500);
		System.out.println(em.showInfo());
		System.out.println("====================\n");
		System.out.println(mn.showInfo());
		System.out.println("====================\n");
		System.out.println(exe.showInfo());
	}
}
