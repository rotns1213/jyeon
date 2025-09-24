#4주차 3장 랜덤 산수 퀴즈

import random

print ("산수 퀴즈에 오신 것을 환영합니다! \n")

n = random.randint(1, 9)
m = random.randint(1, 9)

msg = str(n) + "+" + str(m) + "= "
input_value = int(input(msg))

print(input_value == n + m)
