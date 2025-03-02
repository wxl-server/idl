namespace go miner_core

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

struct QueryUserListReq {

}

struct QueryUserListResp {
    1: required list<User> user_list
}

struct QueryJobListReq {
    // 分页参数
    1: required i64 page_num
    2: required i64 page_size
    3: optional JobColumn order_by
    4: optional Order order

    // 过滤条件
    5: optional i64 id
    6: optional string name
    7: optional i64 created_by
    8: optional i64 created_at_start
    9: optional i64 created_at_end

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

struct DeleteJobReq {
    1: required i64 id
    2: required string token
}

struct DeleteJobResp {

}

struct QueryIndicatorListReq{

}

struct QueryIndicatorListResp{
  1: required list<FirstLevelIndicator> indicators
}

struct FirstLevelIndicator {
  1: required string display_name
  2: required list<SecondLevelIndicator> children
}

struct SecondLevelIndicator {
  1: required string factor_code
  2: required string display_name
  3: required list<AllowOperators> allow_operators
}

struct AllowOperators {
  1: required string operator_code
  2: required string display_name
  3: required InputElType input_el_type
  4: optional list<AllowValues> allow_values
}

struct AllowValues {
  1: required string display_name
  2: required string value
}

struct RunTaskReq {
    1: required i64 job_id
    2: required list<Rule> rules
    3: required string logic_expression
    4: required i64 limit
}

struct Rule {
  1: required i64 id
  2: required string factor_code
  3: required string operator_code
  4: required list<string> value_list
}

struct RunTaskResp {
}

service MinerCore{
    SignUpResp SignUp(1: SignUpReq req)
    LoginResp Login(1: LoginReq req)
    QueryUserListResp QueryUserList(1: QueryUserListReq req)
    QueryJobListResp QueryJobList(1: QueryJobListReq req)
    CreateJobResp CreateJob(1: CreateJobReq req)
    DeleteJobResp DeleteJob(1: DeleteJobReq req)
    QueryIndicatorListResp QueryIndicatorList(1: QueryIndicatorListReq req)
    RunTaskResp RunTask(1: RunTaskReq req)
}

enum InputElType {
  Unknown = 0;
  InputTag = 1;
  Input = 2;
  Select = 3;
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