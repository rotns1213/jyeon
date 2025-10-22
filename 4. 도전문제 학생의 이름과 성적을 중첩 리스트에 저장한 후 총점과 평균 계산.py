#6주차 도전 문제 4번
# 3명 학생의 이름, 국어, 영어, 수학 점수를 입력받아 중첩 리스트에 저장한 후
# 각 학생의 총점과 평균을 계산하여 출력하는 프로그램

students = []  # 학생 정보 저장

def get_score(prompt):
    while True:
        try:
            value = int(input(prompt))
            if value < 0:
                print("0 이상의 정수를 입력하세요.")
                continue
            return value
        except ValueError:
            print("숫자만 입력하세요. 예: 95")

#3명 학생 정보 입력
for i in range(3):
    print(f"\n[{i+1}번째 학생 입력]")
    name = input("이름: ").strip() or f"Student{i+1}"
    kor = get_score("국어 점수: ")
    eng = get_score("영어 점수: ")
    math = get_score("수학 점수: ")
    students.append([name, kor, eng, math])

#열 너비를 맞추기
print("\n성명      국어   영어   수학    총점    평균")
print("-" * 40)

# 과목별 합계 초기화
kor_sum = eng_sum = math_sum = 0

# 각 학생 출력
for s in students:
    name, kor, eng, math = s
    total = kor + eng + math
    avg = total / 3
    print(f"{name:<8}{kor:>6}{eng:>6}{math:>7}{total:>8}{avg:>8.1f}")
    kor_sum += kor
    eng_sum += eng
    math_sum += math

# 과목별 평균 계산
kor_avg = kor_sum / 3
eng_avg = eng_sum / 3
math_avg = math_sum / 3

print("=" * 40)
# 과목별 총점/평균 출력 (형식 맞춤)
print(f"총점/평균 {kor_sum:>6}/{kor_avg:>5.1f} {eng_sum:>6}/{eng_avg:>5.1f} {math_sum:>6}/{math_avg:>5.1f}")

input("\n엔터를 누르면 프로그램이 종료됩니다.")
