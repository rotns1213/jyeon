#9주차 도전과제 2번 : 랜덤으로 중복되는 값 없이 추출하여 리스트변수에 저장후 최고값을 화면에 출력

import random

def find_max(num_list):

    max_val = max(num_list)
    return max_val

random_numbers = random.sample(range(1, 101), 10)

#정의한 함수를 호출하여 최고값을 찾기
high = find_max(random_numbers)

print(f"무작위로 추출된 10개 숫자: {random_numbers}")
print(f"이 중에서 최고값은: {high}")
