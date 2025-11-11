package sec03;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

import sec03.MyInfo.GUI1;
import sec03.MyInfo.GUI2;

public class Counter extends JFrame{

	JButton btnUp,btnDown;
	JLabel lblOut;
	int cnt;
	Counter(){
		setTitle("카운터기");
		
		setLayout(new FlowLayout());
		btnUp=new JButton("증가");
		btnDown=new JButton("감소");
		lblOut=new JLabel();
		Font font = new Font("", Font.BOLD, 30);
		lblOut.setFont(font);		
		btnUp.setFont(font);
		btnDown.setFont(font);
		//익명 리스너 등록
		btnUp.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				cnt++;
				lblOut.setText("현재 카운터 값:"+cnt);						
			}
			
		});
		
		btnDown.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				cnt--;
				if(cnt<0) {
					cnt=0;
					System.out.println("음수값 입니다.");
				}
				lblOut.setText("현재 카운터 값:"+cnt);						
			}
			
		});
		
		
		add(lblOut);
		add(btnUp);
		add(btnDown);
		setSize(600,300);
		setVisible(true);
	}
	public static void main(String[] args) {
		new Counter();
	}

}
