#5주차 도전과제 5번 : 2개의 2자리 정수 무작위 생성하여 사칙연산 문제를 내고, 사용자의 입력값과 계산값을 비교하여 정답인지 오답인지 출력하기 if-else 구문 사용 

import random

num1 = random.randrange(10, 100) #10부터 99 사이의 난수 출력
num2 = random.randrange(10, 100)

print(f"문제에 사용될 숫자는 {num1}, {num2} 입니다. \n") #f-string 사용

op = [ #연산자와 정답을 리스트에 저장
    ('+', num1 + num2),
    ('-', num1 - num2),
    ('*', num1 * num2),
    ('//', num1 // num2),
]

for o, answer in op: #반복문으로 리스트 값을 출력 
    answer_input = int(input(f"{num1} {o} {num2} = "))

    if answer_input == answer:
        print("정답입니다.")
    else:
        print("오답입니다.")
