import turtle as t

# 사용자 입력 받기
t.up()
t.goto(0,0)
t.down()
n = int(t.textinput("", "몇 각형을 그릴까요? (3~6 숫자 입력): "))

if n == 3 or n == 4 or n == 5 or n == 6:
    angle = 360 / n

    # 다각형 그리기
    for i in range(n):
        t.fd(100)
        t.left(angle)   # 각도만큼 회전

else:
    t.write("3부터 6까지의 숫자를 입력해주세요.")

t.done()  # 그래픽 창을 유지하기 위해 추가
