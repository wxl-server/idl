namespace go miner_core

include "../dto.thrift"

struct QueryJobListReq {
    // 分页参数
    1: required i64 page_num
    2: required i64 page_size
    3: optional dto.JobColumn order_by
    4: optional dto.Order order

    // 过滤条件
    5: optional i64 id
    6: optional i64 created_by
    7: optional i64 created_at_start
    8: optional i64 created_at_end

}

struct QueryJobListResp {
    1: required list<dto.Job> job_list
    2: required i64 total
}

service MinerCore{
    QueryJobListResp QueryJobList(1: QueryJobListReq req)
}
