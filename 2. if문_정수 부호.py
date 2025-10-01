#사용자로부터 정수를 받아서 정수의 부호에 따라서 거북이를 (100, 100), (100, 0), (100, -100)

import turtle as t
t.shape("turtle")

t.penup() #펜 들기
t.goto(100,100)
t.write("거북이가 여기로 오면 양수입니다.")
t.goto(100,0)
t.write("거북이가 여기로 오면 0입니다.")
t.goto(100,-100)
t.write("거북이가 여기로 오면 음수입니다.")

t.goto(0,0)
t.pendown()
s=t.textinput("", "숫자를 입력하시오. : ")

n=int(s) #문자열로 받은 걸 숫자로 형 변환
if n > 0 :
    t.goto(100,100)
if n == 0 :
    t.goto(100,0)
if n < 0 :
    t.goto(100,-100)

t.done()
