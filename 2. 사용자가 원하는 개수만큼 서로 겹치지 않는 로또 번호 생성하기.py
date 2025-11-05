#9주차 7강 겹치지않는 로또 번호를 생성하는 함수 작성하기
#사용자에게 로또 번호 개수를 입력 받아서 그 숫자만큼 번호 출력하기

import random
user = int(input("로또 개수를 입력하세요.: "))

def getLotto():
    numbers = []
    while len(numbers) < 6:
        n = random.randint(1, 45)
        if n not in numbers:
            numbers.append(n)
    return numbers

print(f"사용자 입력값: {user}개")

for i in range (user): #사용자가 입력한 개수만큼 반복 출력 
    lotto = getLotto()
    print(f"로또 번호 : {lotto}") #들여쓰기 필수 : for문 안에 들어가야 반복 출력함 
