local db = require("lapis.db")
local schema = require("lapis.db.schema")

return {
  [1776714328] = function()
		schema.create_table("bin", {
			{ "id", schema.types.serial },
			{ "contents", schema.types.varchar },
			{ "secret", schema.types.varchar },

			"PRIMARY KEY (id)"
		})
  end
}
