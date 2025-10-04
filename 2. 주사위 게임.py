#5주차 도전과제 2번 : 143p 주사위 게임 완성하기 

import random

print("주사위 게임을 시작합니다.")
dice = random.randrange(7)
if dice == 0:
    print("1 입니다!")
if dice == 1:
    print("2 입니다!")
if dice == 2:
    print("3 입니다!")
if dice == 3:
    print("4 입니다!")
if dice == 4:
    print("5 입니다!")
if dice == 5:
    print("6 입니다!")
else:
    print("게임을 종료합니다.")
