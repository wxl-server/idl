namespace go miner_core

struct QueryJobListReq {
    // 分页参数
    1: required i64 page_num
    2: required i64 page_size
    3: optional JobColumn order_by
    4: optional Order order

    // 过滤条件
    5: optional string name
    6: optional i64 created_by
    7: optional i64 created_at_start
    8: optional i64 created_at_end

}

struct QueryJobListResp {
    1: required list<Job> job_list
    2: required i64 total
}

struct CreateJobReq {
    1: required string name
    2: optional string description
    3: required string token
}

struct CreateJobResp {
    1: required i64 id
}

struct SignUpReq {
    1: required string email
    2: required string password
}

struct SignUpResp {
    1: required i64 id
}

struct LoginReq {
    1: required string email
    2: required string password
}

struct LoginResp {
    1: required string token
}

service MinerCore{
    QueryJobListResp QueryJobList(1: QueryJobListReq req)
    CreateJobResp CreateJob(1: CreateJobReq req)
    SignUpResp SignUp(1: SignUpReq req)
    LoginResp Login(1: LoginReq req)
}

enum Order {
    DESC = 0;
    ASC = 1;
}

enum JobColumn {
    ID = 0;
    NAME = 1;
    DESCRIPTION = 2;
    CREATED_BY = 3;
    UPDATED_BY = 4;
    CREATED_AT = 5;
    UPDATED_AT = 6;
    EXTRA = 7;
}

struct Job {
    1: required i64 id
    2: required string name
    3: required string description
    4: required User created_by
    5: required User updated_by
    6: required i64 created_at
    7: required i64 updated_at
    8: optional string extra
}

struct User {
  1: required i64 id
  2: required string email
}