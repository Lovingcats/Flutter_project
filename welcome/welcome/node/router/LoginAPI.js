var express = require("express");
var router = express.Router();
const nodemailer = require("nodemailer");
const { User } = require("../models/User");
const { auth } = require("../middleware/auth");

router.post("/register", (req, res) => {
  const user = new User({
    username: req.body.name,
    userid: req.body.id,
    password: req.body.pwd,
    email: req.body.email,
    status: req.body.status,
    grade: req.body.grade,
  });
  user.save((err, result) => {
    if (err) {
      console.log(err);
      res.json({
        success: false,
        massage:
          "post data가 제대로 들어오지 않았습니다. 다시 시도해주겠습니까?",
      });
    } else {
      console.log("저장 완료");
      res.status(200).json({
        username: req.body.name,
        userid: req.body.id,
        password: req.body.pwd,
        email: req.body.email,
        status: req.body.status,
        grade: req.body.grade,
        success: true,
      });
    }
  });
});

router.post("/signin", (req, res) => {
  var userid = req.body.id;
  var password = req.body.pwd;
  console.log(userid, password);
  if (typeof userid !== "string" && typeof password !== "string") {
    res.send("login failed");
    return;
  }
  User.findOne({ userid: userid }, (err, user) => {
    if (!user) {
      return res.json({ massage: "유저를 찾을 수 없습니다." });
    }
    // 요청된 이메일이 db에 있다면 비밀번호 일치여부 확인
    user.comparePassword(password, (err, isMatch) => {
      if (!isMatch)
        return res.json({
          loginSuccess: false,
          message: "틀린 패스워드를 입력하셨습니다.",
        });
      else {
        console.log("로그인 되었습니다.");
        user.generateToken((err, user) => {
          if (err)
            return res.status(400).send({ success: false, massage: "error" });
          // 토큰을 쿠키에 저장
          res.cookie("user_auth", user.token).json({
            success: true,
            name: req.body.name,
            id: req.body.id,
            pwd: req.body.pwd,
          });
        });
      }
    });
  });
});

router.get("/logout", auth, (req, res) => {
  let token = req.cookies.user_auth;
  User.findOneAndUpdate({ token: token }, { token: "" }, (err, user) => {
    if (err)
      return res.json({ massage: "login을 한 뒤에 할 수 있는 기능입니다." });
    return res.json({ massage: "로그아웃이 완료되었습니다.", isAuth: true });
  });
});

router.get("/mail", async (req, res) => {
  let authNum = Math.random().toString().substr(2, 6);
  let transporter = nodemailer.createTransport({
    service: "gmail",
    host: "smtp.gmail.com",
    port: 587,
    secure: false,
    auth: {
      user: "lap721181@gmail.com",
      pass: "hrjeywvvlkybdszv",
    },
  });

  const mailOptions = await transporter.sendMail({
    from: "lap721181@gmail.com",
    to: req.query.email,
    subject:
      "회원가입 완료를 위해 아래에 적혀진 인증코드를 인증코드 입력 칸에 적어주세요.",
    html: `<p style='color: black'>회원 가입을 위한 인증번호 입니다.</p>
        <p style = 'color:black'>아래의 인증 번호를 입력하여 인증을 완료해주세요.</p>
        <h2>${authNum}</h2>`,
  });

  transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
      res.json({ error: error, success: false });
    } else {
      res.status(200).json({ success: true, email: req.query.email });
    }
    console.log("Finish sending email : " + info.response);
    transporter.close();
  });
});

router.get("/check", (req, res) => {
  console.log(req.query.name);
  User.findOne({ username: req.query.name }, function (err, user) {
    if (err) return res.json({ success: false, massage: err });
    else if (user == null) {
      //닉네임이 없다는 것은 중복되는 닉네임이 없다는 것을 의미함.
      return res.json({ success: true, massage: "중복된 닉네임 X" });
    } else {
      // 닉네임이 찾아졌다는 것은 이미 DB에 있다는 것임. 즉, 중복된 닉네임이므로 불가능하다는 메세지 보내기.
      return res.json({ success: false, massage: "닉네임 중복 됨." });
    }
  });
});

router.get("/checkCode", function (req, res) {
  console.log(authNum, req.query.code);
  if (req.query.code === authNum) {
    res.json({ success: true, code: req.query.code });
  } else {
    res.json({ success: false, massage: "코드가 일치하지 않습니다." });
  }
});

module.exports = router;
