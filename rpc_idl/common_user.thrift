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

struct UpdatePasswordReq {
    1: required string email
    2: required string old_password
    3: required string password
}

struct UpdatePasswordResp {

}

struct ValidateTokenReq {
    1: required string token
}

struct ValidateTokenResp {
    1: required map<string,string> claims
}

service CommonUser{
    SignUpResp SignUp(1: SignUpReq req)
    UpdatePasswordResp UpdatePassword(1: UpdatePasswordReq req)
    LoginResp Login(1: LoginReq req)
    ValidateTokenResp ValidateToken(1: ValidateTokenReq req)
}
