#6주차 실습 문제 구구단 출력 - 중첩 for문 사용, %d 서식 사용, 가로로 출력

print("구구단 출력")
for i in range(10): #0~9
    for dan in range (2,10): #2단~9단 
        if i==0: #단 제목 출력
            print(f"=={dan}단==", end = " ")
        else:
            print("%d*%d=%2d" % (dan, i, dan*i), end="  ")
    print("\n")

#구구단 역순으로 출력하기
print("구구단 역순 출력")
for i in range(10): #1~9
    for dan in range(9,1, -1): #9단~2단  
        if i == 0:
            print(f"=={dan}단==", end= " ")
        else:
            print("%d*%d=%2d" % (dan, i, dan*i), end="  ")
    print("\n")
