#6주차 예제 실습 문제 spiral2.py - ppt 6강 46p

import turtle as t

colors = ["red", "purple", "blue", "green", "yellow", "orange"] #리스트에 저장 후 하나씩 꺼내서 변경
t.bgcolor("black") #배경색 변경
t.speed(0) #거북이 속도를 0으로 설정하면 최대치임
t.width(3) #거북이가 그리는 선의 두께 정하는 함수
length = 10 #초기 선의 길이 설정

while length < 500: #선의 길이가 500보다 작으면 반
    t.forward(length)
    t.pencolor(colors[length%6]) #선 색상 변경
    t.right(89) #89도 회전
    length += 5 #선의 길이 5만큼 증가
    
t.done()
