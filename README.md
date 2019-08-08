nginxE
======
nginx扩展

# 功能：
* http请求头 X-B3-TraceId、X-B3-SpanId处理，如果请求中没有这两个http请求头时，添加这两个请求头，值都为一个随机生产的16位16进制数，
    如果有，则不处理
    
    
# 使用方法：
```
1.nginx需要扩展 lua-nginx-module 模块
lua-nginx-module 安装方法：https://github.com/openresty/lua-nginx-module#installation

2.假设nginx配置目录为 /etc/nginx，把nginxE项目clone到/etc/nginx
cd /etc/nginx;
git clone git@git.tuandai888.com:songyanlin/nginxE.git

3.配置nginx
nginx.conf配置文件的http {} 块中添加如下内容(注意路径与实际的一致)：

http {
    lua_package_path "/etc/nginx/nginxE/?.lua";
    init_by_lua_file "/etc/nginx/nginxE/init.lua";
    access_by_lua_file "/etc/nginx/nginxE/runtime.lua";
    lua_max_running_timers 1;

... ...

}

4.若要在nginx日志中打印X-B3-TraceId、X-B3-SpanId http请求头值，通过下列变量获取：
X-B3-TraceId 变量 $http_x_b3_traceid
X-B3-SpanId 变量$http_x_b3_spanid

5.nginx是支持读取非nginx标准的用户自定义header的，但是需要在http或者server下开启header的下划线支持:

underscores_in_headers on

```

# Change log
## v0.2
* 调优生成id的随机性，增加时间特性

## v0.1
*  开发http请求头 X-B3-TraceId、X-B3-SpanId处理功能
