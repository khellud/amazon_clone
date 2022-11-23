console.log("hello, world");

const express = require("express");
const PORT = 3000;

const app = express();

app.get("/", (req, res) => {
  res.json({ name: "Khalid" });
});

app.get("/hello-world", (req, res) => {
  res.json({ hi: "hello world!" });
});

app.listen(PORT, () => {
  console.log(`Connected at port ${PORT}`);
});
