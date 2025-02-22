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
    1: required string token
}

struct GetUserInfoResp {
    1: required i64 user_id
    2: required string user_email
    3: required string user_name
    4: required UserType user_type
    5: required i64 company_id
    6: required string company_name
    7: required string company_code
    8: required CompanyType company_type
}

struct GetCompanyAllListReq {
}

struct GetCompanyAllListResp {
    1: required list<Company> company_list
}

struct CreateEblReq {
    1: required Ebl ebl
    2: required string token
}

struct CreateEblResp {
    1: required i64 id
}

struct Ebl {
    1: required string eblNo
    2: required string originCompanyID
    3: required string originCompanyName
    4: required string shipperCompanyID
    5: required string shipperCompanyName
    6: required string consigneeCompanyID
    7: required string consigneeCompanyName
    8: required string notifyPartyCompanyID
    9: required string notifyPartyCompanyName
    10: required string placeOfReceipt
    11: required string oceanVessel
    12: required string portOfLoading
    13: required string portOfDescharge
    14: required string placeOfDestination
    15: required string placeOfDelivery
    16: required string shippingMarkes
    17: required double quantityOfPackages
    18: required string kindOfPackagesGW
    19: required string kindOfPackagesM
    20: required string descriptionOfGoods
    21: required double grossWeight
    22: required double measurement
    23: required string freightAndCharges
    24: required string placeOfIssue
    25: required i64 dateOfIssue
    26: required string deliveryAgent
    27: required i64 shippedOnBoard
    28: required i64 numOfEBL
    29: required i64 dateOfIssueDeadline
    30: required string status
    31: required string file
    32: required list<string> contractFiles
    33: required list<string> invoiceFiles
    34: required string transferCompanyID
    35: required string transferCompanyName
    36: required i64 companyID
    37: required string companyName
}

struct QueryAllEblListReq {
    1: required string token            // 身份验证Token
    2: optional i64 pageSize         // 可选的分页大小，默认值是10
    3: optional string bookmark        // 分页标记，用于后续请求获取更多数据
}

struct QueryAllEblListResp {
    1: required list<Ebl> eblList       // 返回的 Ebl 列表
    2: required i64 fetchedRecordsCount      // 总记录数，便于计算分页
    3: required string bookmark         // 返回的分页标记，用于继续分页查询
}

struct QueryEblListReq {
    1: required string token            // 身份验证Token
    2: optional i64 pageSize         // 可选的分页大小，默认值是10
    3: optional string bookmark        // 分页标记，用于后续请求获取更多数据
    4: required Ebl eblFilter         // 过滤条件
}

struct QueryEblListResp {
    1: required list<Ebl> eblList       // 返回的 Ebl 列表
    2: required i64 fetchedRecordsCount      // 总记录数，便于计算分页
    3: required string bookmark         // 返回的分页标记，用于继续分页查询
}

struct OperateEblReq {
    1: required string token            // 身份验证Token
    2: required string eblNo            // Ebl ID
    3: required OperationType type           // Ebl 状态转换类型 1 submitEbl 2 approveEbl 3 rejectEbl
}

struct OperateEblResp {
    1: required i64 id
}

struct UploadSealReq {
    1: required string token            // 身份验证Token
    2: required list<byte> seal         // Seal
}

struct UploadSealResp {
    1: required i64 id
}

service FabricEbl{
    CreateCompanyResp CreateCompany(1: CreateCompanyReq req)
    LoginResp Login(1: LoginReq req)
    GetUserInfoResp GetUserInfo(1: GetUserInfoReq req)
    GetCompanyAllListResp GetCompanyAllList(1: GetCompanyAllListReq req)
    CreateEblResp CreateEbl(1: CreateEblReq req)
    QueryAllEblListResp QueryAllEblList(1: QueryAllEblListReq req)
    QueryEblListResp QueryEblList(1: QueryEblListReq req)
    OperateEblResp OperateEbl(1: OperateEblReq req)
    UploadSealResp UploadSeal(1: UploadSealReq req)
}

struct Company {
    1: required i64 id
    2: required string company_code
    3: required string company_name
    4: required CompanyType company_type
}

enum OperationType {
  Submit = 1;
  Approve = 2;
  Reject = 3;
  Retreat = 4;
  Seal = 5;
  Issue = 6;
  Accept = 7;
  Transfer = 8;
  Redeem = 9;
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