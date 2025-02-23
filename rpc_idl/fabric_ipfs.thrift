namespace go fabric_ipfs

struct CreateEblDocxReq {
    1: required CreateEblDocx ebl
}

struct CreateEblDocxResp {
    1: required string file_hash
}

struct CreateEblDocx {
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
    32: required list<string> contractFiles
    33: required list<string> invoiceFiles
    34: required string transferCompanyID
    35: required string transferCompanyName
    36: required string companyID
    37: required string companyName
}


service FabricIpfs{
    CreateEblDocxResp CreateEblDocx(1: CreateEblDocxReq req)
}
