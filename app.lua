local lapis = require("lapis")
local app = lapis.Application()

local respond_to = require("lapis.application").respond_to
local validate = require("lapis.validate")

app:enable("etlua")

app:match("home", "/", respond_to({
	GET = function (self)
		return { render = true }
	end,
	POST = function (self)
		local err = validate.validate(self.POST, {
			{ "content", exists = true, min_length = 2 }
		})

		if err ~= nil then
			self.err = { message = "validation error" }
			return { render = true, status = 422 }
		end

		return { render = true }
	end
}))

return app
