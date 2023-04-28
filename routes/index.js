const express = require("express");

const pageController = require("../controllers/index");

const router = express.Router();

router.get("/", pageController.getBooks);

router.get("/books/:gid", pageController.getBooksByGenre);

router.get("/authors", pageController.getAuthors);

router.get("/users", pageController.getUsers);

router.get("/users/:uid", pageController.getUser);

router.get("/borrow-book/:bid", pageController.getBorrowBook);

router.post("/borrow-book", pageController.postBorrowBook);

router.get("/edit-book/:bid", pageController.getEditBook);

router.post("/edit-book", pageController.postEditBook);

router.post("/resolve-reservation", pageController.resolveReservation);

router.post("/create-user", pageController.createUser);

router.post("/pay-user-debt", pageController.payUserDebt);

router.get("/authors/:aid", pageController.getAuthorBooks);

router.get("/create-book", pageController.getCreateBook);

router.post("/create-book", pageController.createBook);

router.post("/create-author", pageController.createAuthor);

router.post("/delete-book", pageController.deleteBook);

module.exports = router;
