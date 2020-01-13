name = "At You"
description = [[
It makes you able to @ someone. The person who got @ will say the sentence repeatly.

Usage:
- Press Y and type @someone#content
Replace someone with the keywords of his/her name and replace content with the words you wanna say.

For example, if his name is Jupiter, you can type @Jupiter#Hello or @Jup#Hi.
]]
author = "辣椒小皇纸"
version = "1.0.0"

forumthread = ""

api_version = 10

all_clients_require_mod = false
client_only_mod = false
dst_compatible = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {"At You"}

----------------------
-- General settings --
----------------------

configuration_options =
{
    {
        name = "repeat_times",
        label = "Repeat Times重复次数",
        hover = "",
        options =   {
                        {description = "5", data = 5, hover = ""},
                        {description = "10", data = 10, hover = ""},
                        {description = "15", data = 15, hover = ""},
                        {description = "20", data = 20, hover = ""},
                    },
        default = 5,
    },
}