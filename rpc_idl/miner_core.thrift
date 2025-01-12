namespace go miner_core

struct QueryJobListReq {
    // 分页参数
    1: required i64 page_num
    2: required i64 page_size
    3: optional JobColumn order_by
    4: optional Order order

    // 过滤条件
    5: optional i64 id
    6: optional i64 created_by
    7: optional i64 created_at_start
    8: optional i64 created_at_end

}

struct QueryJobListResp {
    1: required list<Job> job_list
    2: required i64 total
}

service MinerCore{
    QueryJobListResp QueryJobList(1: QueryJobListReq req)
}

enum Order {
    desc
    asc
}

enum JobColumn {
    id
    name
    description
    created_by
    updated_by
    created_at
    updated_at
    extra
}

struct Job {
    1: required i64 id
    2: required string name
    3: required string description
    4: required i64 created_by
    5: required i64 updated_by
    6: required i64 created_at
    7: required i64 updated_at
    8: optional string extra
}
