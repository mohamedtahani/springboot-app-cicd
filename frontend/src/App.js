import React, { useState } from "react";
import "./App.css";

function App() {
  const [auth, setAuth] = useState({ username: "", password: "" });
  const [message, setMessage] = useState("");

  const fetchMessage = async () => {
    const res = await fetch("http://localhost:8080/api/message", {
      headers: {
        "Authorization": "Basic " + btoa(auth.username + ":" + auth.password)
      }
    });

    if (res.ok) {
      const data = await res.text();
      setMessage(data);
    } else {
      setMessage("🛑 Login failed");
    }
  };

  return (
    <div className="App">
      <h1>💬 DevOps Love Message</h1>

      <input
        type="text"
        placeholder="Username"
        onChange={e => setAuth({ ...auth, username: e.target.value })}
      />
      <input
        type="password"
        placeholder="Password"
        onChange={e => setAuth({ ...auth, password: e.target.value })}
      />

      <button onClick={fetchMessage}>Login & Fetch</button>

      <h2>{message}</h2>
    </div>
  );
}

export default App;
