const db = require("../utils/databasepg");

module.exports = class User {
  constructor(username, email, phone_number, home_address) {
    this.username = username;
    this.email = email;
    this.phone_number = phone_number;
    this.home_address = home_address;
  }

  save() {
    return db.query(
      "INSERT INTO fin1.user (username, email, phone_number, home_address) VALUES ($1, $2, $3, $4);",
      [this.username, this.email, this.phone_number, this.home_address]
    );
  }

  static findAllUsers() {
    return db.query(`SELECT * FROM fin1.user;`);
  }

  static getUserData(user_id) {
    return db.query(`SELECT * FROM fin1.user WHERE fin1.user.id = $1;`, [
      user_id,
    ]);
  }

  static payUserDebt(user_id) {
    return db.query(`UPDATE fin1.user SET fee = 0 WHERE fin1.user.id = $1;`, [
      user_id,
    ]);
  }
};
