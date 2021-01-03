local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ltrim(input)
    return (string.gsub(input, "^[ \t\n\r]+", ""))
end

function ReceiveFriendMsg(CurrentQQ, data)
    if (string.find(data.Content, "查看证件照") ~= 1) then
        return 1
    end
    local num = string.gsub(data.Content, "查看证件照", "")
    num = ltrim(num)

    local url = "https://imgservice.scu.edu.cn/image/avatar/" .. num .. ".JPG"
    ApiRet = Api.Api_SendMsg(
            CurrentQQ,
            {
                toUser = data.FromGroupId,
                sendToType = 2,
                sendMsgType = "PicMsg",
                groupid = 0,
                content = text,
                picUrl = url,
                atUser = 0
            }
    )
    return 1
end
function ReceiveGroupMsg(CurrentQQ, data)
    return 1
end
function ReceiveEvents(CurrentQQ, data, extData)
    return 1
end
