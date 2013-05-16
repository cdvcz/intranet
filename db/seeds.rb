u = User.create(login: "admin", password: "abc123")
u.roles = ["admin"]
u.save!
