local main = {}

function main.insert(dest)
	print("made part in dest")
	Instance.new("Part", dest).Name = "testpart"
end

return main