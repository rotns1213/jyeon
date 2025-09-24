#4주차 4강 도전과제 10번

import random as r

a_list = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j','k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't','u', 'v', 'w', 'x', 'y', 'z','1', '2', '3', '4', '5', '6', '7', '8', '9', '10']

# 랜덤으로 3글자 선택
n1 = r.choice(a_list)
n2 = r.choice(a_list)
n3 = r.choice(a_list)
print("생성된 패스워드:", n1 + n2 + n3)
