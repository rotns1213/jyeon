// index.js

import React from 'react';
import ReactDOM from 'react-dom/client'; 
import './index.css';   // CSS 파일 불러오기 (전체 스타일)
import App from './App'; // App.js 불러오기

// React 18 버전 이후부터는 createRoot 방식을 사용합니다.
const root = ReactDOM.createRoot(document.getElementById('root'));

// root라는 id를 가진 HTML 요소에 App 컴포넌트를 넣어줍니다.
root.render(
  <React.StrictMode>
    <App />  
  </React.StrictMode>
);
