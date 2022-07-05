const { User } = require('../models/User');

let auth = (req, res, next) => {
    //인증 처리를 하는곳 
    //클라이언트 쿠키에서 토큰을 가져온다.

    let token = req.cookies.user_auth;
    // 토큰을 복호화 한후  유저를 찾는다.
    User.findByToken(token, (err, user) => {
        if (err) throw err;
        if (!user) return res.json({massage:'로그인 후 이용해주시기 바랍니다.'})


        // console.log('userh', user)

        req.token = token;
        req.user = user;
        next();
    })
}


module.exports = { auth };