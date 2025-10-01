#그림판을 띄우고 사용자에게 몇각형 도형을 그릴 건지 입력 받아 다각형 그리기

import turtle as t
t.up()
t.goto(-100, 200)
t.down()
s = t.textinput("", "숫자를 입력하시오 : ")
n = int(s)

angle = 360/n

t.up()
t.goto(0, -200)
t.down()

if n == 3 :
    t.forward(100)
    t.left (120)
    t.forward(100)
    t.left(120)
    t.forward(100)

if n == 4 :
    t.forward(100)
    t.left(90)
    t.forward(100)
    t.left(90)
    t.forward(100)
    t.left(90)
    t.forward(100)

if n == 5 :
    t.forward(100)
    t.left(72)
    t.forward(100)
    t.left(72)
    t.forward(100)
    t.left(72)
    t.forward(100)
    t.left(72)
    t.forward(100)
    t.left(72)

if n == 6 :
    t.forward(100)
    t.left(60)
    t.forward(100)
    t.left(60)
    t.forward(100)
    t.left(60)
    t.forward(100)
    t.left(60)
    t.forward(100)
    t.left(60)
    t.forward(100)
    t.left(60)

else :
    print("숫자는 3부터 6까지만 작성하시오.")

t.done()
