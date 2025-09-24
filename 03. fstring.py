#4주차 4강 f-string

#f-string 문법 사용 O
product = "coffee"
count = 3
price = 10000
print(f"상품{product} {count}개의 가격은 {count*price}원입니다.")

#f-string 문법 사용 X
product = "coffee"
count = 3
price = 10000
print("상품", product, str(count) + "개의 가격은", str(count * price) + "원입니다.")
