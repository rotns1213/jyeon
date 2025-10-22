#6주차 도전과제 - 연습문제 9번 : 알파벳 3글자와 숫자 2글자로 패스워드 만들고 이걸 알아맞추는 프로그램

import random
import sys

user_pass = input("패스워드를 입력하세요. : ")
password = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j','k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't','u', 'v', 'w', 'x', 'y', 'z']

for letter 1 in password :
    for letter 2 in password :
        for letter 3 in password :
            guess = letter 1 + letter 2 + letter 3
            print(guess)
            if guess == user_pass :
                print("당신의 패스워드는" + guess)
                sys.exit()
