### login
```bash
curl -X POST -d "nickname=foo&password=111111" http://115.28.142.45:8083/api/login
```
### get record list with month
```bash
curl -X GET -d "month=201611" --header "Authorization: Token token=#{token}, nickname=foo" http://115.28.142.45:8083/api/records/list_with_month
month: optional
```
### get project list
```bash
curl -X GET http://115.28.142.45:8083/api/projects
```
### add a record
```bash
curl -X POST --header "Authorization: Token token=#{token}, nickname=foo" -d "project_ids=1,2&date=2016-11-01" http://115.28.142.45:8083/api/records
date: 如果date是当天，则删除之前提交的当天记录，录入新纪录，或者直接录入新纪录。如果是未来，则返回错误信息。如果是过去，如果当天已经有纪录，则无法添加新纪录，如果当天没有纪录，则可以添加新纪录。
```
### update password
```bash
curl -X PATCH --header "Authorization: Token token=#{token}, nickname=foo" -d "password=222222" http://115.28.142.45:8083/api/users/update_password
重置密码的同时，token也会改变
```