package sec01;

public class Ticket {
	protected int number;
	protected double price;
	protected double fprice;
	
	public Ticket (int number, double price) {
		this.number = number;
		this.price = price;
	}
	public int getNumber() {
		return number;
	}
	public double getPrice() {
		return price;
	}
	public String toString() {
		return "번호: " + number + ", 가격: " + price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
}
