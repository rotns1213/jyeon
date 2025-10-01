#사용자에게 이름, 나이, 주소 입력 받아서 리스트로 저장
#f-string을 이용해서 각 요소를 출력함

friend = []
friend.append(input("이름 : ")) #원소 값을 append에 바로 넣어서 리스트에 저장
friend.append(int(input("나이 : ")))
friend.append(input("주소 : "))

print(f"당신의 이름은 {friend[0]}이고 \n 나이는 {friend[1]}세이며 \n {friend[2]}에 사는군요")
