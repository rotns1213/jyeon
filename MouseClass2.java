package sec02;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class MouseClass2 extends JFrame{

	JLabel lbl;
	MouseClass2(){
		lbl=new JLabel("cheer up");
		setLayout(new FlowLayout());
		lbl.setForeground(Color.red);
		add(lbl);
		//2. 리스너 등록
		addMouseListener(new MyMouse());
		setSize(500,500);
		setVisible(true);
	}
	//1. 내부 클래스로 이벤트 리스너 작성(MouseAdapter이용)
	// 코드 작성

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new MouseClass2();

	}

}
