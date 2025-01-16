namespace go common_user

struct SignUpReq {
    1: required string email
    2: required string password
}

struct SignUpResp {
    1: required i64 id
}

struct LoginReq {
    1: required string email
    2: required string password
}

struct LoginResp {
    1: required string token
}

service CommonUser{
    SignUpResp SignUp(1: SignUpReq req)
    LoginResp Login(1: LoginReq req)
}
