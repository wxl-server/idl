
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