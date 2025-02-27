namespace go fabric_ipfs

struct CreateEblDocxReq {
    1: required CreateEblDocx ebl
}

struct CreateEblDocxResp {
    1: required string file_hash
}

struct CreateEblDocx {
    1: required string eblNo
    2: required string originCompanyName
    3: required string shipperCompanyName
    4: required string consigneeCompanyName
    5: required string notifyPartyCompanyName
    6: required string placeOfReceipt
    7: required string oceanVessel
    8: required string portOfLoading
    9: required string portOfDescharge
    10: required string placeOfDestination
    11: required string placeOfDelivery
    12: required string shippingMarkes
    13: required string quantityOfPackages
    14: required string kindOfPackagesGW
    15: required string kindOfPackagesM
    16: required string descriptionOfGoods
    17: required string grossWeight
    18: required string measurement
    19: required string freightAndCharges
    20: required string placeOfIssue
    21: required string dateOfIssue
    22: required string deliveryAgent
    23: required string shippedOnBoard
    24: required string numOfEbl
    25: required string dateOfIssueDeadline
}

struct SealEblReq {
    1: required string token
    2: required CreateEblDocx ebl
}

struct SealEblResp {
    1: required string file_hash
}

service FabricIpfs{
    CreateEblDocxResp CreateEblDocx(1: CreateEblDocxReq req)
    SealEblResp SealEbl(1: SealEblReq req)
}
