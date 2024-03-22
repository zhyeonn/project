import { useEffect, useState } from "react";
import "./App.css";

// 로그인 누르면 메인화면으로 이동
// 아이디, 비밀번호 찾기 누르면 찾기 화면

function App() {
  const [email, setEmail] = useState("");
  const [pw, setPw] = useState("");

  const [emailValid, setEmailValid] = useState(false);
  const [pwValid, setPwValid] = useState(false);

  const [notAllow, setNotAllow] = useState(true);

  const handleEmail = (e) => {
    setEmail(e.target.value);
    const emailRegex =
      /^[A-Za-z0-9]([-_.]?[A-Za-z0-9])*@[A-Za-z0-9]([-_.]?[A-Za-z0-9])*\.[A-Za-z]{2,3}$/;
    if (emailRegex.test(email)) {
      setEmailValid(true);
    } else {
      setEmailValid(false);
    }
  };
  console.log(email);

  const handlePassword = (e) => {
    setPw(e.target.value);
    const pwRegex = /^[A-Za-z0-9]{8,20}$/;
    if (pwRegex.test(pw)) {
      setPwValid(true);
    } else {
      setPwValid(false);
    }
  };

  useEffect(() => {
    if (emailValid && pwValid) {
      setNotAllow(false);
      return;
    }
    setNotAllow(true);
  }, [emailValid, pwValid]);

  return (
    <div className="page">
      <div className="titleWrap">서비스를 이용하려면 로그인하세요.</div>
      <div className="contentWrap">
        <div className="inputWrap">
          <input
            type="text"
            className="input"
            placeholder="이메일"
            value={email}
            onChange={handleEmail}
          />
        </div>
        <div className="errorMessageWrap">
          {!emailValid && email.length > 0 && (
            <div>올바른 이메일을 입력해주세요.</div>
          )}
        </div>
        <div className="inputWrap">
          <input
            type="password"
            className="input"
            placeholder="비밀번호"
            value={pw}
            onChange={handlePassword}
          />
        </div>
        <div className="errorMessageWrap">
          {!pwValid && pw.length > 0 && (
            <div>올바른 비밀번호를 입력해주세요.</div>
          )}
        </div>
      </div>
      <div>
        <button disabled={notAllow} class="button">
          로그인
        </button>
      </div>
    </div>
  );
}

export default App;
