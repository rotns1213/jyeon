#5주차 도전과제 1번 : 사용자에게 각형, 크기, 색깔을 입력 받아 그림 그리기 

import turtle as t
import math

# 화면 중앙에 그리기
t.up()
t.goto(0, 0)
t.down()

#리스트 사용

color = ["black", "red", "yellow", "blue", "gren", "black"] #색깔

#사용자 입려 받기 t.text input / list명과 같으면 안 됨.
n = int(t.textinput("", "몇 각형을 그릴까요? (0~8 숫자 입력)"))
s = int(t.textinput("",  "크기는 얼마로 할까요?"))
c = t.textinput("", "무슨 색으로 칠할까요? (black/red/yellow/blue/green)")


if c in color: #list 불러오기 
    t.color(c)
else:
    t.color("오류입니다.")

if n==3 or n==4 or n==5 or n==6 or n==8:
        angle = 360/n
        for i in range(n):
            t.fd(s) #사용자가 입력한 사이즈로 그림.
            t.left(angle) #각도만큼 회전함
else:
    t.write("오류입니다.")

t.done()
    
