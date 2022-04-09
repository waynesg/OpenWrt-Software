
local sys  = require "luci.sys"
local util = require "luci.util"
local uci = require "luci.model.uci".cursor()

-------------------------------------------env---------------------------------------
local localIPPtr = (util.execi("ifconfig | grep 192.168 | awk '{ print $2}' | awk -F ':' '{ print $2}'"));
local localIPDrivce = localIPPtr(0);--获取设备的 ip 地址
local localIP = uci:get_first("whistle", "whistle", "host");
if not localIP then--如果没配置过
    localIP = localIPDrivce or "0.0.0.0";--那么采用设备的 ip 或者找不到时用默认的 0.0.0.0
end

local hasInstall = (sys.call("whereis w2 | grep / > /dev/null") == 0);
local running = (sys.call("ps | grep -v grep | grep \"w2 run -M prod\" > /dev/null") == 0);
if not running then
    running = (sys.call("ps | grep -v grep | grep \"node_modules/whistle/node_modules\" > /dev/null") == 0);
end

--header
local header = translate("whistle proxy config");
header = header .. "<br /><br /><a href=\"https://github.com/avwo/whistle\" target=\"_blank\">whistle</a>";
header = header .. "<br /><br /><a href=\"https://github.com/fjqingyou/luci-app-whistle\" target=\"_blank\">luci-app-whistle</a>" ;
if not hasInstall then
    header = header .. "<br /><br /><span style=\"color:red;\">" .. translate("your need install whistle") .. "</span>";
end

if running then
    local port = uci:get_first("whistle", "whistle", "port") or 8899
    local url = "http://" .. localIPDrivce .. ":" .. port .. "/";
    local listenFinishd = (sys.call("netstat -anp | grep tcp | grep LISTEN | grep " .. localIP .. ":" .. port .. " > /dev/null") == 0);
    if not listenFinishd then
        header = header .. "<br /><br /><span style=\"color:red;\">" .. translate("whistle starting, plaese wait") .. "</span>";
    else
        header = header .. "<br /><br /><input type=\"button\" value=\" " .. translate("Open Web Interface") .. " \" onclick=\"window.open('" .. url .. "')\"/>"
    end
end

map = Map("whistle", translate("Whistle"), header);

---------------------------------------Basic Options-------------------------------------------
--class TypedSection (type, title, description)
--class NamedSection (name, type, title, description)
s=map:section(NamedSection, "config", "whistle", translate("Basic Options"))
s.addremove=false
s.anonymous=true

--是否启用
enable = s:option(Flag, "enabled", translate("Enabled"));
enable.rmempty = false -- 值为空时不删除
enable.enabled = "true"
enable.disabled = "false"

--host
host=s:option(Value, "host", translate("host"))
host.default = localIP;
host.placeholder = localIP;

--port
port=s:option(Value, "port", translate("port"))
port.default = 8899
port.placeholder = 8899
port.datatype = "range(1024,65535)"

--自定义证书目录
certDir=s:option(Value, "cert_dir", translate("cert_dir"), translate("cert_dir_description"));
certDir.default = "~/.WhistleAppData/custom_certs/";
----------------------------------------Authentication------------------------------------------

--安全性
s=map:section(TypedSection, "whistle", translate("Authentication"))
s.addremove=false
s.anonymous=true

--是否启用身份验证
o = s:option(Flag, "auth_enabled", translate("Enabled"))
o.rmempty = false
o.default = false
o.enabled = "true"
o.disabled = "false"

--用户名
o = s:option(Value, "auth_username", translate("username"))
o.value = ""

--密码
o = s:option(Value, "auth_password", translate("password"))
o.password = true;
o.default = "";
-------------------------------------------end---------------------------------------
return map
