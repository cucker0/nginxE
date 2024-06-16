--author: song yanlin

local version = "v0.2"  --版本号

local function timeFormat()
    --生成 MMDDHHmm时间格式，再转换成6位16进制的字符串
    local time_str = (os.date("%m%d%H%M", os.time()))
    local time_hex = string.format('%x', time_str)
    if #time_hex == 5 then
        --16进制的time字符串长度为5时前面补一个0
        time_hex = '0' .. time_hex
    end
    return time_hex
end

math.randomseed(os.time()) --随机数种子
local function generateId(num)
	--生成随机的ID
	--num 要生成随机ID的长度,int型
	local num = num or 16  --生成ID的长度,调用此方法不传参数时默认为16位
	num = num - 6
	--local string = "0123456789abcdef"
	--local id = ''
	--for i = 1, num, 1 do
	--	local r = math.random(1, 16)  --生成1-16之间的随机数
	--	local s = string.sub(string, r, r)
	--	id = id .. s
	--end
	local id = ''
    for i = 1, num, 1 do
        local s = string.format('%x', math.random(0, 15))  --随机的0-15数字转换成16进制的小写字符
        id = id .. s
    end
    id = timeFormat() .. id
    return id
end

_Conf = {
    generateId = generateId,  --生成随机ID
}
