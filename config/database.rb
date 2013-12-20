ActiveRecord::Base.establish_connection(
  adapter:  "postgresql",
  host:     "localhost",
  username: "abruzzim", # ENV [PG_USER]
  database: "my_face_db",
  encoding: "utf8"
)