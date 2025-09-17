#3장 개별 실습

#사용자에게 초기값을 입력 받음
sec = int (input("초를 입력하세요."))

#이 초기값을 시간 분 초를 변환 ex) 3700초는 1시간 1분 40초 입니다.
hour = sec// (60 * 60) # //는 정수로 나눔
remain_time = sec % (60*60)
min = remain_time // 60
out_sec = remain_time % 60

#결과값 출력
print(sec,"초는",hour,"시간",min,"분",out_sec,"초 입니다.")
