#연습문제 05번 - 반지름 초기값 50을 radius 변수에 저장, (0,0),(100,0),(200,0)좌표에 반지름을 20씩 증가하면서 원 3개 그리기 : 변수 사용하기
import turtle as t
t.shape("turtle")
radius = 50

t.up()
t.goto(0, 0)
t.down()
t.color("black")
t.circle(radius)

t.up()
t.goto(100, 0)
t.down()
t.color("black")
t.circle(radius+20)

t.up()
t.goto(200, 0)
t.down()
t.color("black")
t.circle(radius+40)
