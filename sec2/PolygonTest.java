//2024136024 서지연

package sec2;

import java.util.Scanner;

public class PolygonTest {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Polygon p = null;

        System.out.print("도형 선택 (1)삼각형 (2)직사각형 (3)정사각형: ");
        int select = sc.nextInt();

        switch(select) {
            case 1: // 삼각형
                p = new Polygon("Triangle", 10, 20);   // 가로=10, 세로=20
                p.clacArea(p.width, p.height, 1);     // s=1 → 삼각형
                break;
            case 2: // 직사각형
                p = new Polygon("Rectangle", 10, 20);
                p.clacArea(p.width, p.height, 2);     // s=2 → 직사각형
                break;
            case 3: // 정사각형
                p = new Polygon("Square", 10);        // 한 변=10
                p.clacArea(p.width);                  // 정사각형 메서드 호출
                break;
            default:
                System.out.println("잘못된 선택입니다.");
                break;
        }

        if (p != null) {
            p.printArea(); // 결과 출력
        }

        sc.close();
    }
}
