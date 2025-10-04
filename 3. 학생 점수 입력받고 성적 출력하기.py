#5주차 도전과제 3번 : 연습문제 4번 if-elif-else 사용하여 학생 성적 프로그램

s = int(input("성적을 입력하세요. :"))

if s >= 90:
    print("A학점입니다.")
elif s >= 80:
    print("B학점입니다.")
elif s >= 70:
    print("C학점입니다.")
elif s >= 60:
    print("D학점입니다.")
else:
    print("F학점입니다.")
