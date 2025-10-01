#그림판을 띄우고 그림판에서 사용자에게 몇각형 그릴지 물어보고 해당 다각형 그리기
#반복 구문 이용하여 프로그램 간결하게 만들기

import turtle as t

n=1

while n != 0 :

    t.up()
    t.goto(0,0)
    t.down()
    n = int(t.textinput("","몇각형을 그릴까요? 종료는 0번"))

    if n == 0 :
        break

    elif n < 3 or n > 6 : #오류 걸러내기
        t.wirte("잘못된 입력 값")

    else : #다각형 그리기
        t.reset()
        angle = 360/n
        t.up()
        t.goto(0, -200)
        t.down()
        for i in range(n) :
            t.fd(100)
            t.right(angle)

t.write("프로그램 종료합니다.")
t.done()
