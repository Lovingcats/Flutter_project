const express = require("express");
const app = express();
const mongoose = require("mongoose");
const loginRouter = require("./router/LoginAPI");
const imageRouter = require("./router/image");
const cookieParser = require("cookie-parser");

app.set("view engine", "ejs");
app.set("views", "./views");
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use("/static", express.static("public"));
app.use(cookieParser());

mongoose.connect(
  "mongodb+srv://over1122:dmswn1122!@cluster0.5mcs5.mongodb.net/cluster0?retryWrites=true&w=majority"
);
var db = mongoose.connection;
db.on("error", console.error);
db.once("open", function () {
  // CONNECTED TO MONGODB SERVER
  console.log("Connected to mongod server");
});

app.get("/", (req, res) => {
  res.status(200).json({
    massage: "인덱스 화면과 연결 잘 됨.",
  });
});

app.use("/image", imageRouter);
app.use("/login", loginRouter);

let port = 8888;
app.listen(port, () => {
  console.log("server on! http://localhost:" + port);
});
