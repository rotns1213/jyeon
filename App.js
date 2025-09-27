// App.js

import React from 'react';       // 리액트 사용 선언
import './App.css';              // CSS 파일 불러오기

// 함수형 컴포넌트 App 정의
function App() {
  return (
    <div className="App">
      {/* 상단 헤더 영역 */}
      <header className="App-header">
        <h1>🌸 모아봄 🌸</h1>
        <p>나에게 맞는 지원금, 여기 다 모아봄!</p>
      </header>

      {/* 본문 영역 */}
      <main className="App-main">
        <p>여기서 원하는 내용을 추가해보세요!</p>
        <button onClick={() => alert("버튼이 눌렸습니다!")}>
          클릭해보기
        </button>
      </main>

      {/* 하단 푸터 영역 */}
      <footer className="App-footer">
        <p>© 2025-2 프로젝트분석설계 에코웨어 서지연</p>
      </footer>
    </div>
  );
}

// App 컴포넌트를 다른 파일에서 사용할 수 있도록 내보내기
export default App;
