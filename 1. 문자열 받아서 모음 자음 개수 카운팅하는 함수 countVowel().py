#9주차 7강 문자열을 받아서 모음과 자음의 개수를 카운팅하여 반환하는 함수 countVowel() 사용하기 

def countVowel(string): #모음 개수
    count=0
    for ch in string:
        if ch in ['a','e','i','o','u']:
            count += 1
    return count

def countVowel2(string): #자음 개수
    count=0
    for ch in string:
        if ch not in ['a','e','i','o','u']: #not 사용 
            count += 1
    return count

s = input("문자열을 입력하시오: ")
n = countVowel(s)
k = countVowel2(s)

print(f"모음의 개수는 {n}개입니다.")
print(f"자음의 개수는 {k}개입니다.")
