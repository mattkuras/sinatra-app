matt = User.create(email: "mattkuras@gmail.com", username: "matt", password: "password")
mike = User.create(email: "mikejorand@gmail.com", username: "mike", password: "password")

matt.hikes.create(name: "Devil's Pass", rating: 8.9, difficulty: "medium")
mike.hikes.create(name: "Long Range Traverse", rating: 10.0, difficulty: "hard")