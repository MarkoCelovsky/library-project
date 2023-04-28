const db = require("../utils/databasepg");

module.exports = class Author {
  constructor(author_name) {
    this.author_name = author_name;
  }

  save() {
    return db.query("INSERT INTO fin1.author (username) VALUES ($1);", [
      this.author_name,
    ]);
  }

  static findAllAuthors() {
    return db.query(`SELECT * FROM fin1.author;`);
  }

  static findAllAuthorBooks(authorId) {
    return db.query("SELECT * FROM fin1.author_books WHERE id_author = $1;", [
      authorId,
    ]);
  }
};
