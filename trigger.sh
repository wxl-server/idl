#!/bin/bash

# 检查是否有修改的 .thrift 文件
if [ -z "$idls" ]; then
  echo "No .thrift files have been modified."
  exit 0
fi

# 遍历每个 .thrift 文件
for idl in $idls; do
  echo "Going to trigger code gen: $idl"
  # 在这里添加处理每个 IDL 文件的逻辑
  # 发送请求
  curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $token" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/qcq1/rpc_$idl/dispatches \
  -d '{"event_type":"idl_update","client_payload":{"repository":"'$repo'","ref":"'$branch'","commit_msg":"'$commit_msg'","idl":"'$idl'"}}'
done
