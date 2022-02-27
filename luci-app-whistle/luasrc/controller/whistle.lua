
module("luci.controller.whistle", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/whistle") then
		return
	end

	local page = entry({"admin", "services", "whistle"}, cbi("whistle"), _("Whistle"));
    page.dependent = true;

end
