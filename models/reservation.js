const db = require("../utils/databasepg");

module.exports = class Reservation {
  constructor(book_id, user_id, borrowed_date) {
    this.book_id = book_id;
    this.user_id = user_id;
    this.borrowed_date = borrowed_date;
  }

  save() {
    return db.query(
      "INSERT INTO fin1.reservation (user_id, book_id, borrowed_date, borrowed) VALUES ($1, $2, $3, $4)",
      [this.user_id, this.book_id, this.borrowed_date, true]
    );
  }

  static findUserReservations(user_id) {
    return db.query(
      "SELECT * FROM fin1.user_reservation_view WHERE user_id = $1;",
      [user_id]
    );
  }

  static resolveReservation(id) {
    return db.query(
      "UPDATE fin1.reservation SET borrowed = false WHERE id = $1",
      [id]
    );
  }
};
