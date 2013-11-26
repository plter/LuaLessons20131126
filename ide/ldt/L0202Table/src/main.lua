
Config = {hello="Hello Lua",world="World"}
Config.words = "Hello"
Config.num = 100
Config["name"] = "ZhangSan"

--print(Config["words"])
--print(Config.name)
--print(Config.hello)

for key, var in pairs(Config) do
	print(key,var)
end