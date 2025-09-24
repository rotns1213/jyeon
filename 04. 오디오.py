from gtts import gTTS
import os

text = "2학년 여러분 다들 열공해"

tts = gTTS(text=text, lang = 'ko')
tts.save("ttt.mp3")
os.system("ttt.mp3")
