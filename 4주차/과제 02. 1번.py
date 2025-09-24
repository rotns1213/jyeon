#4주차 3장 도전과제 01번

#(a)
x = int(input("x값을 입력하시오. : "))
result = x**4 -9*x**3 + x**2
print(result)

#(b) 
import math

r = int(input("반지름 값을 입력하시오. : "))
result=(4/3) *math.pi * r**3
print(result)

#(c) 거듭제곱근
import math
a = int(input("a 값을 입력하시오. : "))
b = int(input("b 값을 입력하시오. : "))
c = int(input("c 값을 입력하시오. : "))

D = b**2 - 4*a*c
root1 = (-b + D**0.5) / (2*a)
root2 = (-b - D**0.5) / (2*a)
print ("첫번째 헤 : ", root1)
print ("두번째 해 : ", root2)
