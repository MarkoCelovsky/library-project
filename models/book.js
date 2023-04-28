const db = require("../utils/databasepg");

module.exports = class Book {
  constructor(
    title,
    author,
    description,
    cover_image_url,
    published_date,
    isbn,
    book_amount
  ) {
    this.title = title;
    this.author = author;
    this.description = description;
    this.cover_image_url = cover_image_url;
    this.published_date = published_date;
    this.isbn = isbn;
    this.book_amount = book_amount;
  }

  save() {
    return db.query(
      `
       INSERT INTO fin1.book (title, author_id, description, cover_image_url, published_date, isbn, book_amount)
       VALUES ($1, $2, $3, $4, $5, $6, $7);`,
      [
        this.title,
        this.author,
        this.description,
        this.cover_image_url,
        this.published_date,
        this.isbn,
        this.book_amount,
      ]
    );
  }

  static findById(bookId) {
    return db.query("SELECT * FROM fin1.book_author_view WHERE id = $1;", [
      bookId,
    ]);
  }

  static findByGenre(genreId) {
    return db.query(
      "SELECT * FROM fin1.book_reservation_view WHERE genre_id = $1;",
      [genreId]
    );
  }

  static findAllBooks() {
    return db.query("SELECT * FROM fin1.book_reservation_view;");
  }

  static findAllGenres() {
    return db.query("SELECT * FROM fin1.genre;");
  }

  static deleteBook(bookId) {
    return db.query("DELETE FROM fin1.book WHERE id = $1;", [bookId]);
  }

  static editBook(bookId, cover_image_url) {
    return db.query(
      "UPDATE fin1.book SET cover_image_url = $1 WHERE id = $2;",
      [cover_image_url, bookId]
    );
  }

  // static editBook(bookId, title, description, cover_image_url) {
  //   return db.query(
  //     `UPDATE fin1.book SET title = $1, description = $2,
  //      cover_image_url = $3 WHERE id = $4;`,
  //     [title, description, cover_image_url, bookId]
  //   );
  // }
};
