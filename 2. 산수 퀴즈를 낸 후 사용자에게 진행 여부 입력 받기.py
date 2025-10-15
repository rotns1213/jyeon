#6주차 실습 문제 - 5주차 5번 변형

import random

num1 = random.randrange(10, 100) #10부터 99 사이의 난수 출력
num2 = random.randrange(10, 100)

print(f"문제에 사용될 숫자는 {num1}, {num2} 입니다. \n") #f-string 사용

op = [ #연산자와 정답을 리스트에 저장
    ('+', num1 + num2),
    ('-', num1 - num2),
    ('*', num1 * num2),
    ('/', num1 // num2),
]

for o, answer in op: #반복문으로 리스트 값을 출력 
    answer_input = int(input(f"{num1} {o} {num2} = "))

    if answer_input == answer:
        print("정답입니다.")
    else:
        print("오답입니다.")
        ...

#조건1 : 무작위로 2자리 숫자 사칙연산을 출력해서 결과값을 물어보는 산수 퀴즈
#조건2 : 사용자에게 계속할 지 물어본 후 'yes'라고 답하면 산수퀴즈를 계속한다

input_user = 'yes'
while input_user == 'yes':
    num1 = r.randrange(1, 100)
    num2 = r.randrange(1, 100)

    op_list = ["+", "-", "x", "/"]
    op = r.choice(op_list)

    print(f' {null} {op} {num2} = ?')
    user_answer = int (input("정답을 입력해주세요. : "))

    answer = 0
    if op == "+":
        answer = num1 + num2
    elif op == "-":
        answer = int(num1 - num2)
    elif op == "X":
        answer = int(num1 * num2)
    elif op == "/":
        answer = int(num1 / num2)

    if answer == user_answer :
        print("정답입니다!")
    else :
        print ("오답입니다!")

    input_user = input("산수 퀴즈를 계속할래요?(yes/no): ")

print("프로그램을 종료합니다.")
input()
