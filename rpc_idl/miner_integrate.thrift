namespace go miner_integrate

struct UpdateMockProducerQpsReq {
    1: optional i64 product_base_info_qps
    2: optional i64 product_shop_info_qps
    3: optional i64 product_logo_model_info_qps
    4: optional i64 product_image_model_info_qps
}

struct UpdateMockProducerQpsResp {
}

service MinerIntegrate {
    UpdateMockProducerQpsResp UpdateMockProducerQps(1: UpdateMockProducerQpsReq req)
}