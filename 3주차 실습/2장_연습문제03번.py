#2장 연습문제 3번 - 사용자로부터 3개의 숫자를 받아서 합과 평균을 계산하여 출력하는 프로그
num1 = int(input("1번째 숫자를 입력하세요. "))
num2 = int(input("2번째 숫자를 입력하세요. "))
num3 = int(input("3번째 숫자를 입력하세요. "))

sum = num1 + num2 + num3
avg = sum / 3

print("세 숫자의 합은", sum, "입니다.")
print("세 숫자의 평균 값은", avg, "입니다.")
