import React from "react";
import LoginPage from "./page/LoginPage";
import SearchPassword from "./page/SearchPassword";
import { Routes, Route } from "react-router-dom";

const App = () => {
  return (
    <div>
      <Routes>
        <Route path="/login" element={<LoginPage />}></Route>
        <Route path="/searchPassword" element={<SearchPassword />}></Route>
      </Routes>
    </div>
  );
};

export default App;
