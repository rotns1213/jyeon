package sec03;

public class Coffee {
	
	private String name;
	private int price;
	Coffee(String name, int price)
	{
		this.name=name;
		this.price=price;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	
	//객체 정보를 반환
	public String toString() {
	return String.format("%s(%d)원", name, price);
	}
}
