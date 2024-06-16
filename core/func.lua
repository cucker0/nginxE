--author: song yanlin


ngxE = {}

function ngxE.TraceIdAndSpanId()
    --处理TraceId、SpanId
    local headers, err = ngx.req.get_headers()  --ngx.req.get_headers() 默认取100个header, ngx.req.get_headers(0) 获取所有header
    if not err then
        local id = _Conf.generateId(16)
        if not headers['X-B3-TraceId'] then
            ngx.req.set_header('X-B3-TraceId', id)  --设置X-B3-TraceId请求头
        end
        if not headers['X-B3-SpanId'] then
            ngx.req.set_header('X-B3-SpanId', id)  --设置X-B3-SpanId 请求头
        end
    end
end

return ngxE