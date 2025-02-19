namespace go fabric_ebl

struct CreateCompanyReq {
    1: required string company_code
    2: required string company_name
    3: required CompanyType company_type
    4: required string admin_email
    5: required string admin_password
    6: required string admin_name
}

struct CreateCompanyResp {
    1: required i64 id
}

struct LoginReq {
    1: required string email
    2: required string password
}

struct LoginResp {
    1: required string token
}

struct GetUserInfoReq {
}

struct GetUserInfoResp {
    1: required string user_id
    2: required string user_email
    3: required string user_name
    4: required UserType user_type
    5: required string company_id
    6: required string company_name
    7: required string company_code
    8: required CompanyType company_type
}

service FabricEbl{
    CreateCompanyResp CreateCompany(1: CreateCompanyReq req)
    LoginResp Login(1: LoginReq req)
    GetUserInfoResp GetUserInfo(1: GetUserInfoReq req)
}

enum CompanyType {
    Ship = 1;
    Bank = 2;
    Common = 3;
}

enum UserType {
    Admin = 1;
    User = 2;
}