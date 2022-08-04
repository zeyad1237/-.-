repeat wait() until game:IsLoaded()

do
	getgenv().is_synapse_function = newcclosure(function()
		return false
	end)

    local req
    if is_synapse_function then
        req = syn.request
    else
        req = request
    end

	local ReqHook
	ReqHook = hookfunction(req, newcclosure(function(...)
		t = {...}
        if t[1].Url:find('auth') then
			return {
                Success = true,
                StatusMessage = "OK",
				StatusCode = 200,
                Cookies = {},
				Body = '{"error":true, "message":"di me may nhen con suc vat bucki nameki"}',
				Headers = game:GetService("HttpService"):JSONEncode({
					Authorization = 'vando123'
				}),
			}
		end
		return ReqHook(...)
	end))

	local SubHook
	SubHook = hookfunction(string.sub, newcclosure(function(...)
		t = {...}
		if checkcaller() then
			if #t[1] == 128 then
				return 'vando123vando123vando123vando123vando123vando123vando123vando123'
			end
		end
		return SubHook(...)
	end))

	local DecodeHook
	DecodeHook = hookfunction(game:GetService("HttpService").JSONDecode, newcclosure(function(...) 
		t = {...}
		if checkcaller() and t[2] and t[2]:find('"message":') then
			return {
				error = false,
				message = "vando123vando123vando123vando123vando123vando123vando123vando123"
			}
		end
		return DecodeHook(...)
	end))


	local DecodeHookV2
	DecodeHookV2 = hookmetamethod(game,"__namecall", newcclosure(function(...) 
		if checkcaller() then 
			t = {...}
			if getnamecallmethod() == "JSONDecode" and t[2] and t[2]:find('"message":') then 
				return {
					error = false,
					message = "vando123vando123vando123vando123vando123vando123vando123vando123"
				}
			end
		end    
		return DecodeHookV2(...)
	end))
end

-- Delete Xenon Hub's folder if you have, Table Hub won't let you execute the script if you got xenon folder in workspace, just like my sea hub :troll:
if isfolder("Xenon Hub Premium Scripts") then
    delfolder("Xenon Hub Premium Scripts")
end

local function Loader()
	getgenv().key = 'Table-1233-1234-1234-1234'
	getgenv().discord_id = '809804156956835841'

    local Status, Script = pcall(game.HttpGet, game, 'https://raw.githubusercontent.com/AltsegoD/scripts/egoD/TableHub.lua')
    -- You can change the above link to 'https://tablehub.net/v2/script' if you want to get the latest update of the script, will not gonna work if they patched this

    if Status ~= true then Loader() end
    loadstring(Script)()
end
Loader()
    
