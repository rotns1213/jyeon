#도전 문제 3번 : 랜덤 된 다각형 그리기

import turtle as t
import random

# 다각형 그리는 함수
def draw_polygon(length, sides, color):
    t.color(color)
    angle = 360 / sides
    for _ in range(sides):
        t.forward(length)
        t.right(angle)

count = random.randint(1, 30)
print("그릴 다각형 개수:", count)

# 여러 개의 다각형 그리기
for i in range(count):
    x = random.randint(-200, 200)
    y = random.randint(-200, 200)
    side = random.randint(3, 8)
    length = random.randint(10, 100)
    color = random.choice(["red", "orange", "yellow", "green", "blue", "purple", "pink", "white"])

    t.penup()
    t.goto(x, y)
    t.pendown()
    draw_polygon(length, side, color)

t.done()
