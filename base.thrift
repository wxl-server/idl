namespace go base

struct Base {
    1: string LogID = ""
    2: string Caller = ""
    3: string Addr = ""
    4: string Client = ""
}

struct BaseResp {
    1: i32 Code
    2: string Msg
}
