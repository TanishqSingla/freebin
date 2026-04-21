local lapis = require("lapis")
local app = lapis.Application()

local respond_to = require("lapis.application").respond_to
local validate = require("lapis.validate")

local pkey = require("openssl.pkey")

local rsa = pkey.new({ type = 'RSA', bits = 512 })

local public, private = rsa:toPEM("public", "private")
print(public)
print(ngx.encode_base64(public))
app:enable("etlua")

app:match("home", "/", respond_to({
	GET = function (self)
		return { render = true }
	end,
	POST = function (self)
--		local ciphertext = public_key.encrypt(self.POST.content, "oaep")

--		print("Encrypted data (hex):", ciphertext:gsub('.', function (c)
--			return string.format('%02X', string.byte(c))
--		end))


		return { render = true }
	end
}))

return app
