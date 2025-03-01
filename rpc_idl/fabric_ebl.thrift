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
    28: required i64 numOfEbl
    29: required i64 dateOfIssueDeadline
    30: required string status
    31: required string file
    32: required list<i64> contractFiles
    33: required list<i64> invoiceFiles
    34: required string transferCompanyID
    35: required string transferCompanyName
    36: required string companyID
    37: required string companyName
    38: required string documentFiles
}

struct EblFilter {
    1: required string eblNo
    2: required string originCompanyID
    3: required string shipperCompanyID
    4: required string consigneeCompanyID
    5: required string notifyPartyCompanyID
    6: required string placeOfReceipt
    7: required string oceanVessel
    8: required string portOfLoading
    9: required string portOfDescharge
    10: required string placeOfDestination
    11: required string placeOfDelivery
    12: required string shippingMarkes
    13: required double quantityOfPackages
    14: required string kindOfPackagesGW
    15: required string kindOfPackagesM
    16: required string descriptionOfGoods
    17: required double grossWeight
    18: required double measurement
    19: required string freightAndCharges
    20: required string placeOfIssue
    21: required i64 dateOfIssue
    22: required string deliveryAgent
    23: required i64 shippedOnBoard
    24: required i64 numOfEbl
    25: required i64 dateOfIssueDeadline
    26: required string status
    27: required string transferCompanyID
    28: required string companyID
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
    4: required EblFilter eblFilter         // 过滤条件
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

struct CheckTokenReq {
    1: required string token
}

struct CheckTokenResp {
    1: required bool valid
}

struct CreateInvoiceReq {
    1: required string token
    2: required Invoice invoice
}

struct CreateInvoiceResp {
    1: required i64 id
}

struct CreateContractReq {
    1: required string token
    2: required Contract contract
}

struct CreateContractResp {
    1: required i64 id
}

struct CreateDocumentReq {
    1: required string token
    2: required Document document
}

struct CreateDocumentResp {
    1: required i64 id
}

struct QueryInvoiceListReq {
    1: required string token
    2: required i64 pageSize
    3: required i64 pageNum
    4: required InvoiceFilter invoice
}

struct QueryInvoiceListResp {
    1: required list<Invoice> invoiceList
    2: required i64 total
}

struct QueryContractListReq {
    1: required string token
    2: required i64 pageSize
    3: required i64 pageNum
    4: optional ContractFilter contract
}

struct QueryContractListResp {
    1: required list<Contract> contractList
    2: required i64 total
}

struct QueryDocumentListReq {
    1: required string token
    2: required i64 pageSize
    3: required i64 pageNum
    4: optional DocumentFilter document
}

struct QueryDocumentListResp {
    1: required list<Document> documentList
    2: required i64 total
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
    CheckTokenResp CheckToken(1: CheckTokenReq req)
    CreateInvoiceResp CreateInvoice(1: CreateInvoiceReq req)
    CreateContractResp CreateContract(1: CreateContractReq req)
    CreateDocumentResp CreateDocument(1: CreateDocumentReq req)
    QueryInvoiceListResp QueryInvoiceList(1: QueryInvoiceListReq req)
    QueryContractListResp QueryContractList(1: QueryContractListReq req)
    QueryDocumentListResp QueryDocumentList(1: QueryDocumentListReq req)
}

struct Invoice {
  1: required string InvoiceNumber
  2: required double Amount
  3: required i64 IssueDate
  4: required InvoiceType Type
  5: required string FileHash
  6: optional string extra
  7: required i64 CreatedAt
  8: required i64 UpdatedAt
}

struct InvoiceFilter {
    1: optional string InvoiceNumber
    2: optional double Amount
    3: optional i64 IssueDate
    4: optional InvoiceType Type
    5: optional string FileHash
}

struct Contract {
    1: required string ContractNumber
    2: required i64 SignDate
    3: required i64 EffectiveDate
    4: required double Amount
    5: required ContractStatus Status
    6: required string FileHash
    7: optional string extra
    8: required i64 CreatedAt
    9: required i64 UpdatedAt
}

struct ContractFilter {
    1: optional string ContractNumber
    2: optional i64 SignDate
    3: optional i64 EffectiveDate
    4: optional double Amount
    5: optional ContractStatus Status
    6: optional string FileHash
}

struct Document {
    1: required DocType DocType
    2: required string DocNumber
    3: required i64 RelatedDate
    4: required string FileHash
    5: optional string extra
    6: required i64 CreatedAt
    7: required i64 UpdatedAt
}

struct DocumentFilter {
    1: optional DocType DocType
    2: optional string DocNumber
    3: optional i64 RelatedDate
    4: optional string FileHash
}

struct Company {
    1: required i64 id
    2: required string company_code
    3: required string company_name
    4: required CompanyType company_type
}

enum FileType {
  Invoice = 1;
  Contract = 2;
  Document = 3;
  Seal = 4;
  Ebl = 5;
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

enum InvoiceType {
    Electronic = 1;
    Paper = 2;
}

enum ContractStatus {
    Active = 1;
    Terminated = 2;
}

enum DocType {
    StorageIn = 1;
    StorageOut = 2;
    Settlement = 3;
}