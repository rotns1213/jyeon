#6주차 실습 문제 -  답을 맞추거나 실행횟수가 10번 이상일 경우 빠져나오기
#ppt 6강 53p

import random

tries = 0
guess = 0
answer = random.randint(1, 100) #1~100 숫자 중 랜덤 출력 

print("1부터 100 사이의 숫자를 맞추시오")

while guess != answer and tries < 10:
    guess = int(input("숫자를 입력하시오: "))
    tries = tries + 1
    if guess < answer:
        print("정답보다 낮음!")
    if guess > answer:
        print("정답보다 높음!")

if guess == answer: #정답일 경우 
    print("축하합니다. 시도횟수 =", tries)
else: #시도 횟수가 10번이 넘어갈 경우
    print("횟수 제한 초과 또는 탈락. 정답은", answer)
