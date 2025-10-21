package sec01;

import javax.swing.JFrame;

public class HelloFrame extends JFrame {
	//생성자
	HelloFrame() {
		setSize(300, 300);
		setTitle("두번째 프로그램");
		setVisible(true);
	}
	public static void main(String[] args) {
		//객체 생성
		//HelloFrame f1 = new HelloFrame();
		new HelloFrame(); //object 생성 
	}
}
