const Author = require("../models/author");
const Book = require("../models/book");
const Reservation = require("../models/reservation");
const User = require("../models/user");

exports.getBooks = async (req, res, next) => {
  const books = await Book.findAllBooks();
  const genres = await Book.findAllGenres();
  console.log(books.rows[0]);
  return res.render("index", {
    pageTitle: "Home Page",
    path: "/",
    books: books.rows,
    genres: genres.rows,
  });
};

exports.getBooksByGenre = async (req, res, next) => {
  const genre_id = req.params.gid;
  const books = await Book.findByGenre(genre_id);
  return res.render("books-by-genre", {
    pageTitle: "Books Page",
    path: "/genre-books",
    books: books.rows,
  });
};

exports.getCreateBook = async (req, res, next) => {
  const authors = await Author.findAllAuthors();
  return res.render("create-book", {
    pageTitle: "Book Page",
    path: "/create-book",
    authors: authors.rows,
  });
};

exports.getAuthors = async (req, res, next) => {
  const authors = await Author.findAllAuthors();
  return res.render("authors", {
    pageTitle: "Authors Page",
    path: "/authors",
    authors: authors.rows,
  });
};

exports.getUsers = async (req, res, next) => {
  const users = await User.findAllUsers();
  return res.render("users", {
    pageTitle: "Users Page",
    path: "/users",
    users: users.rows,
  });
};

exports.getUser = async (req, res, next) => {
  const user_id = req.params.uid;
  const reservations = await Reservation.findUserReservations(user_id);
  const user = await User.getUserData(user_id);
  return res.render("user", {
    pageTitle: "User Page",
    path: "/user/uid",
    reservations: reservations.rows,
    user: user.rows[0],
  });
};

exports.getBorrowBook = async (req, res, next) => {
  const bookId = req.params.bid;
  const users = await User.findAllUsers();
  const book = await Book.findById(bookId);
  return res.render("borrow-book", {
    pageTitle: "Borrow Page",
    path: "/borrow-book",
    users: users.rows,
    bookId: bookId,
    book: book.rows[0],
  });
};

exports.getEditBook = async (req, res, next) => {
  const bookId = req.params.bid;
  const book = await Book.findById(bookId);
  return res.render("edit-book", {
    pageTitle: "Edit Page",
    path: "/edit-book",
    bookId: bookId,
    book: book.rows[0],
  });
};

exports.postEditBook = async (req, res, next) => {
  const data = req.body;
  await Book.editBook(data.book_id, data.cover_image_url);
  res.redirect(`authors/${data.author_id}`);
};

exports.postBorrowBook = (req, res, next) => {
  const data = req.body;
  const reservation = new Reservation(
    data.book_id,
    data.user_id,
    new Date(),
    0
  );
  // new Date(Date.now() - 2851200000),
  // use this to prove the fee paying
  reservation
    .save()
    .then((reservation) => {
      console.log(reservation);
      res.redirect("/");
    })
    .catch((err) => {
      console.log(err);
    });
};

exports.resolveReservation = async (req, res, next) => {
  const data = req.body;
  await Reservation.resolveReservation(data.reservation_id);
  res.redirect(`/users/${data.user_id}`);
};

exports.payUserDebt = async (req, res, next) => {
  const data = req.body;
  await User.payUserDebt(data.user_id);
  res.redirect(`/users/${data.user_id}`);
};

exports.getAuthorBooks = async (req, res, next) => {
  const authorId = req.params.aid;
  const books = await Author.findAllAuthorBooks(authorId);
  return res.render("author-books", {
    pageTitle: "Author books",
    path: "/author-books",
    books: books.rows,
  });
};

exports.deleteBook = async (req, res, next) => {
  const data = req.body;
  await Book.deleteBook(data.book_id);
  res.redirect("/");
};

exports.createBook = (req, res, next) => {
  const data = req.body;
  const book = new Book(
    data.title,
    data.author,
    data.description,
    data.cover_image_url
      ? data.cover_image_url
      : "https://picsum.photos/200/300",
    data.published_date,
    data.isbn,
    data.book_amount
  );
  book
    .save()
    .then((book) => {
      console.log(book);
      res.redirect("/");
    })
    .catch((err) => {
      console.log(err);
    });
};

exports.createAuthor = (req, res, next) => {
  const data = req.body;
  const author = new Author(data.username);
  author
    .save()
    .then((author) => {
      console.log(author);
      res.redirect("/authors");
    })
    .catch((err) => {
      console.log(err);
    });
};

exports.createUser = (req, res, next) => {
  const data = req.body;
  const user = new User(
    data.username,
    data.email,
    data.phone_number,
    data.home_address
  );
  user
    .save()
    .then((user) => {
      console.log(user);
      res.redirect("/users");
    })
    .catch((err) => {
      console.log(err);
    });
};
