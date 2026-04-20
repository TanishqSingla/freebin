local config = require("lapis.config")

print(os.getenv("DB_HOST"))
print(os.getenv("DB_USER"))
print(os.getenv("DB_DATABASE"))
print(os.getenv("DB_PASSWORD"))

config("development", {
  server = "nginx",
  code_cache = "off",
  num_workers = "1",
	port = 8080,
	postgres = {
		host = os.getenv("DB_HOST"),
		user = os.getenv("DB_USER"),
		database = os.getenv("DB_DATABASE"),
		password = os.getenv("DB_PASSWORD"),
		port = 5432
	}
})

config("production", {
	port = os.getenv("PORT"),
	num_workers = 1,
	code_cache = "on",
	secret = os.getenv("APP_SECRET"),
	postgres = {
		host = os.getenv("DB_HOST"),
		user = os.getenv("DB_USER"),
		database = os.getenv("DB_DATABASE"),
		password = os.getenv("DB_PASSWORD")
	}
});
