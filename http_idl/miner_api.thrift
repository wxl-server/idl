namespace go miner_api

include "common.thrift"
include "domain.thrift"

struct QueryJobListReq {
    // 分页参数
    1: required i64 page_num (api.body="page_num");
    2: required i64 page_size (api.body="page_size");
    3: optional domain.JobColumn order_by (api.body="order_by");
    4: optional common.Order order (api.body="order");

    // 过滤条件
    5: optional i64 id (api.body="id");
    6: optional i64 created_by (api.body="created_by");
    7: optional i64 created_at_start (api.body="created_at_start");
    8: optional i64 created_at_end (api.body="created_at_end");
}

struct QueryJobListResp {
    1: required i64 code;
    2: required string message;
    3: optional QueryJobListData data;
}

struct QueryJobListData {
    1: required list<domain.Job> job_list
    2: required i64 total
}

service MinerApi {
    QueryJobListResp QueryJobList(1: QueryJobListReq request) (api.post="/job/query/list");
}