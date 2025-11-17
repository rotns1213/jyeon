#9주차 도전과제 1번 : 6주차 도전과제 문제를 함수로 변경하기 

#학생 이름과 점수를 입력받는 함수
def student_scores(num_students):
    students = []  # 학생 정보를 저장할 리스트

    # 학생 수만큼 반복해서 입력받기
    for i in range(num_students):
        print(f"\n[{i+1}번째 학생 정보 입력]")
        name = input("이름을 입력하세요: ")
        kor = int(input("국어 점수를 입력하세요: "))
        eng = int(input("영어 점수를 입력하세요: "))
        math = int(input("수학 점수를 입력하세요: "))

        # 하나의 학생 정보를 리스트로 묶어서 추가
        students.append([name, kor, eng, math])
    
    return students  # 전체 학생 리스트 반환


def report():
    print("\n성명           국어    영어    수학    총점    평균")


#학생별 총점, 평균 계산하고 전체 총합과 평균 구하기
def score_sum(students, num_students):
    total_kor = 0
    total_eng = 0
    total_math = 0

    # 학생별 총점/평균 출력
    for student in students:
        name = student[0]
        kor = student[1]
        eng = student[2]
        math = student[3]
        total = kor + eng + math
        avg = total / 3

        # 과목별 합계 누적
        total_kor += kor
        total_eng += eng
        total_math += math

        # 학생별 출력
        print(f"{name:<14}{kor:<8}{eng:<8}{math:<8}{total:<8}{avg:.1f}")

    # 과목별 평균 계산
    avg_kor = total_kor / num_students
    avg_eng = total_eng / num_students
    avg_math = total_math / num_students

    # 과목별 총점/평균 출력
    print(f"총점/평균     {total_kor}/{avg_kor:.1f}   {total_eng}/{avg_eng:.1f}   {total_math}/{avg_math:.1f}")

def main():
    num_students = 3  # 학생 수 지정 (원하면 입력으로 바꿀 수도 있음)

    # 학생 정보 입력받기
    students_list = student_scores(num_students)

    report()
    score_sum(students_list, num_students)

if __name__ == "__main__":
    main()
