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
curl -X POST --header "Authorization: Token token=#{token}, nickname=foo" -d "project_ids[]=1&project_ids[]=2&date=2016-11-01" http://115.28.142.45:8083/api/records
```