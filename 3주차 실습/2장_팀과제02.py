import turtle as t

t.shape("turtle")

# 사용자 입력
size = int(input("집의 크기를 입력하세요: ")) 
body_color = input("집 본체 색깔을 입력하세요: ")
roof_color = input("지붕 색깔을 입력하세요: ") 

# 본체 그리기 (정사각형)
t.up()
t.goto(0, 0)
t.down()

t.fillcolor(body_color)
t.begin_fill()

t.forward(size)
t.left(90)
t.forward(size)
t.left(90)
t.forward(size)
t.left(90)
t.forward(size)
t.left(90)

t.end_fill()

# 지붕 그리기 \
t.fillcolor(roof_color)
t.begin_fill()

t.up()
t.goto(0, size)
t.down()

t.goto(size / 2, size * 2)  \
t.goto(size, size)
t.goto(0, size)

t.end_fill()

# 바퀴\
t.fillcolor("brown")

t.up()
t.goto(size * 0.2, -size * 0.3)
t.down()
t.begin_fill()
t.circle(size * 0.15)
t.end_fill()

t.up()
t.goto(size * 0.8, -size * 0.3)
t.down()
t.begin_fill()
t.circle(size * 0.15)
t.end_fill()

t.done()
