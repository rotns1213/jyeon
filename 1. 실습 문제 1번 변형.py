#6주차 도전 문제 - 실습문제 1번 : 숫자 2개, 사칙연산자 무작위 생성 + 정답 맞출 때까지 풀게함 + 진행 여부(y/n) 묻기

import random

while True: #참인 동안 반복 
    num1 = random.randint(10, 99)
    num2 = random.randint(10, 99)

    op = random.choice(['+', '-', '*', '/'])

    if op == '+':
        answer = num1 + num2
    elif op == '-':
        answer = num1 - num2
    elif op == '*':
        answer = num1 * num2
    else:
        answer = num1 // num2

    print(f"문제: {num1} {op} {num2}")
    user_answer = int(input("정답을 입력하세요. : "))

    if user_answer == answer:
        print("정답입니다!")
    else:
        print(f"오답입니다. 정답은 {answer} 입니다.")

    # 계속 여부 묻기
    ing = input("산수 퀴즈를 계속할래요? (y/n): ")

    if ing != 'y':
        print("프로그램을 종료합니다.")
        break
