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
}

service FabricEbl{
    CreateCompanyResp CreateCompany(1: CreateCompanyReq req)
}

enum CompanyType {
    Ship = 1;
    Bank = 2;
    Common = 3;
}