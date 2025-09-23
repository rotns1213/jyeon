//2024136024 서지연 
package sec03;

public class Executive extends Manager {
	private int stockOption;
	
	public Executive (String name, int salary, int bonus, int stockOption) {
		super(name, salary, bonus);
		this.stockOption = stockOption;
	}
	public int getStockOption() {
		return stockOption;
	}
	
	public int raiseSalary() {
		int increased_salary;
		increased_salary = (int)(salary * 1.2);
		return increased_salary;
	}
	public String showInfo() {
		String result = super.showInfo();
		result += "\n스톡옵 : " + stockOption;
		return result;
	}
}
