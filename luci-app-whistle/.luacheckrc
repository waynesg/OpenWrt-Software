allow_defined = true
module = true
max_string_line_length = false


stds.some_lib = { --luacheck: ignore
    globals = {
        "module",
        "package",


        "_",
        "alias",
        "call",
        "cbi",
        "entry",
        "firstchild",
        "form",
        "Flag",
        "luci",
        "Map",
        "nixio",
        "NamedSection",
        "node",
        "post",
        "post_on",
        "unpack",
        "table",
        "template",
        "TypedSection",
        "translate",
        "view",
        "Value",
    }
}
std = "min+some_lib"

-- 警告编号查看 https://luacheck.readthedocs.io/en/stable/warnings.html
ignore = {
    "631", --Line is too long.
    "21/_.*",  -- (W212)unused argument '_arg'
}

