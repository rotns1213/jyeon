package sec03;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class MyInfo extends JFrame{
	JButton btn1,btn2;
	JLabel lbl;
	MyInfo()
	{
		setTitle("나의 소개");
		//배경색 지정하기
		getContentPane().setBackground(Color.YELLOW);
		
		setLayout(new FlowLayout());
		btn1=new JButton("나의 이름");
		btn2=new JButton("나의 꿈");
		lbl=new JLabel();
		Font font = new Font("", Font.BOLD, 30);
		lbl.setFont(font);
		btn1.setFont(font);
		btn2.setFont(font);
		//리스너 등록
		btn1.addActionListener(new GUI1());
		btn2.addActionListener(new GUI2());
		
		add(btn1);
		add(btn2);
		add(lbl);
		setSize(600,300);
		setVisible(true);
	}
	
	class GUI1 implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			// TODO Auto-generated method stub
			lbl.setText("나의 이름은 나이화입니다.");
			lbl.setForeground(Color.blue);
		}
		
	}
	
	class GUI2 implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			// TODO Auto-generated method stub			
			lbl.setText("나의 이름은 잘 나가는 개발자입니다.");
			lbl.setForeground(Color.red);
		}
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new MyInfo();

	}

}
