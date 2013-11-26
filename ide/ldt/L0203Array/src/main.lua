--arr = {1,2,3,4,"Hello"}
--
--for key, var in pairs(arr) do
--	print(key,var)
--end

arr = {}

for var=1, 100 do
	table.insert(arr,1,var)
end

--for key, var in pairs(arr) do
--	print(key,var)
--end

print(table.maxn(arr))
