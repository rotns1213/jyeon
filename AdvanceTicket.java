package sec01;

public class AdvanceTicket extends Ticket {
	private int advancedays;
	public AdvanceTicket (int number, double price, int advancedays) {
		super(number, price);
		this.advancedays = advancedays;
	}
	public double getPrice() {
		double rate = 0.0;
		if (advancedays >= 30) rate = 0.5;
		else if (advancedays >= 10) rate = 0.8;
		else if (advancedays >= 5) rate = 0.9;
		
		price = price*rate;
		return price;
	}
	public int getAdvancedays() {
		return advancedays;
	}
	public String toString() {
		String tempStr = "";
		tempStr += "번호: " + getNumber();
		tempStr += ", 신용카드 결제: " + getAdvancedays();
		tempStr += ", 가격 : " + (int)getPrice();
		return tempStr;
	}
}
