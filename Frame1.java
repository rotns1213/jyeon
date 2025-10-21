package sec02;

import java.awt.*; //배치관리자 
import javax.swing.*;

public class Frame1 extends JFrame{
	//생성자 정의 
	Frame1(){
		setTitle("BorderLayout");
		setSize(300, 300);
		//버튼 컴포넌트 생성(JButton)
		JButton b1 = new JButton("North");
		JButton b2 = new JButton("South");
		JButton b3 = new JButton("East");
		JButton b4 = new JButton("West");
		JButton b5 = new JButton("Center");
		
		add(b1,BorderLayout.NORTH); //"North"
		add(b2,BorderLayout.SOUTH);
		add(b3,BorderLayout.EAST);
		add(b4,BorderLayout.WEST);
		add(b5,BorderLayout.CENTER);
		
		//윈도우 보이기
		setVisible(true);
	}
	public static void main(String[] args) {
		//윈도우 생성 
		new Frame1();
	}
}
