package sec01;

public class TicketTest {
	public static void main(String[] args) {
		WalkupTicket ticket1 = new WalkupTicket(101, 100000, true);
		//ticket1.setPrice(100000.0);
		System.out.println(ticket1.toString( ));
		
		AdvanceTicket ticket2 = new AdvanceTicket(201, 100000, 20);
		ticket2.setPrice(100000.0);
		System.out.println(ticket2.toString( ));
		
		AdvanceTicket ticket3 = new AdvanceTicket(202, 100000, 35);
		ticket3.setPrice(100000.0);
		System.out.println(ticket3.toString( ));
	}
}
