#5주차 도전과제 5번 : 2개의 2자리 정수 무작위 생성하여 사칙연산 문제를 내고, 사용자의 입력값과 계산값을 비교하여 정답인지 오답인지 출력하기 if-else 구문 사용 

import random

num1 = random.randrange(10, 100) #10부터 99 사이의 난수 출력
num2 = random.randrange(10, 100)

print ("숫자는", num1,",", num2, "입니다.")

q1 = num1 + num2
print(num1, "+", num2, "= ")
a1 = int(input("정답을 입력하세요 : "))
if a1 == q1:
    print("정답입니다.")
else:
    print("틀렸습니다.")


q2 = num1 - num2
print(num1, "-", num2, "= ")
a2 = int(input("정답을 입력하세요 : "))
if a2 == q2:
    print("정답입니다.")
else:
    print("틀렸습니다.")

q3 = num1 * num2
print(num1, "*", num2, "= ")
a3 = int(input("정답을 입력하세요 : "))
if a3 == q3:
    print("정답입니다.")
else:
    print("틀렸습니다.")

q4= num1 // num2
print(num1, "//", num2, "= ")
a4 = int(input("정답을 입력하세요 : "))
if a4 == q4:
    print("정답입니다.")
else:
    print("틀렸습니다.")
