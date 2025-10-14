package sec01;

public class WalkupTicket extends Ticket {
	private boolean payBYcredit;
	
	public WalkupTicket (int number, double price , boolean payBYcredit) {
		super(number, price); //super : 부모의 생성자 호출 
		this.payBYcredit = payBYcredit;
	}
	public double getPrice() {
		if (payBYcredit) return price * 1.05;
		else return price;
	}
	public boolean getPayByCredit() {
		return payBYcredit;
	}
	public String toString() {
		String tempStr = "";
		tempStr += "번호: " + getNumber();
		tempStr += ", 신용카드 결제: " + getPayByCredit();
		tempStr += ", 가격 : " + getPrice();
		return tempStr;
	}
}
