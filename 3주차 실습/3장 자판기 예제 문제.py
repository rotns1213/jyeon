#3장 자판기 예제 문제
ame_price = 2000
latte_price = 3000
capu_price = 3500

#사용자로부터 투입한 돈과 음료 값을 입력 받는다.
money int(input("투입한 돈 : "))
price int(input("음료 금액 : "))

#잔돈 계산하여 출력하기
change = money-price
print("거스름돈 : ", change)
coin 500s = change //500
change = change % 500
coin 100s = change //100
change = change % 100
coind50s = change //50
print("500원 동전의 개수 : ", coin500s)
print("100원 동전의 개수 : ", coin100s)
