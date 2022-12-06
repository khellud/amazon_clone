// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

const PORT = 3000;
const app = express();
const DB = "mongodb://localhost:27017";

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "192.168.2.83", () => {
  console.log(`Connected at port ${PORT}`);
});
