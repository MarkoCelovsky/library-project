CREATE SCHEMA fin1; 

SET search_path TO fin1;

CREATE TABLE book (
    id SERIAL NOT NULL,
    title TEXT NOT NULL,
    author_id INT NOT NULL,
    genre_id INT NOT NULL,
    description TEXT NOT NULL,
    cover_image_url TEXT NOT NULL,
    book_amount INT NOT NULL DEFAULT 1,
    isbn TEXT NOT NULL DEFAULT 'ISBN-978-1-5445-1227-3'
    published_date TIMESTAMP
);

CREATE TABLE author (
    id SERIAL NOT NULL, 
    username TEXT NOT NULL,
);

CREATE TABLE user (
    id SERIAL NOT NULL,
    username TEXT NOT NULL,
    email TEXT NOT NULL,
    phone_number TEXT NOT NULL,
    home_address TEXT NOT NULL,
    fee FLOAT NOT NULL DEFAULT 0,
);

CREATE TABLE reservation (
    id SERIAL NOT NULL,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    borrowed_date TIMESTAMP NULL,
    borrowed BOOLEAN NOT NULL,
);

CREATE TABLE genre (
    id SERIAL NOT NULL,
    name TEXT NOT NULL
);

ALTER TABLE ONLY book
    ADD CONSTRAINT pk_book PRIMARY KEY (id);

ALTER TABLE ONLY author
    ADD CONSTRAINT pk_author PRIMARY KEY (id);

ALTER TABLE ONLY user
    ADD CONSTRAINT pk_user PRIMARY KEY (id);

ALTER TABLE ONLY genre
    ADD CONSTRAINT pk_genre PRIMARY KEY (id);

ALTER TABLE ONLY book
    ADD book_amount INT NOT NULL DEFAULT 0,
    ADD isbn TEXT NOT NULL default 'ISBN-978-1-5445-1227-3';

UPDATE book
    SET book_amount = 1,
    SET isbn = 'ISBN-978-1-5445-1227-3';

ALTER TABLE ONLY reservation
    ADD CONSTRAINT pk_reservation PRIMARY KEY (id);

ALTER TABLE ONLY book
    ADD CONSTRAINT fk_author_to_book FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE;

ALTER TABLE ONLY book
    ADD CONSTRAINT fk_book_to_genre FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE CASCADE;

ALTER TABLE ONLY reservation
    ADD CONSTRAINT fk_user_to_reservation FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;

ALTER TABLE ONLY reservation
    ADD CONSTRAINT fk_book_to_reservation FOREIGN KEY (book_id) REFERENCES book(id) ON DELETE CASCADE;

INSERT INTO author (username)
 VALUES
    ('William Shakespeare'),
    ('Jane Austen'),
    ('Mark Twain'),
    ('Charles Dickens'),
    ('Ernest Hemingway'),
    ('Fyodor Dostoevsky'),
    ('Leo Tolstoy'),
    ('George Orwell'),
    ('Franz Kafka'),
    ('Oscar Wilde'),
    ('Emily Bronte'),
    ('Charlotte Bronte'),
    ('James Joyce'),
    ('J.R.R. Tolkien'),
    ('Virginia Woolf'),
    ('Edgar Allan Poe'),
    ('Gabriel Garcia Marquez'),
    ('Homer'),
    ('J.D. Salinger'),
    ('F. Scott Fitzgerald'),
    ('Miguel de Cervantes'),
    ('John Steinbeck'),
    ('Vladimir Nabokov'),
    ('Albert Camus'),
    ('Haruki Murakami'),
    ('Toni Morrison');

INSERT INTO genre (name) VALUES
    ('Historical Fiction'),
    ('Mystery'),
    ('Romance'),
    ('Science Fiction'),
    ('Thriller'),
    ('Young Adult'),
    ('Fantasy'),
    ('Horror'),
    ('Non-Fiction'),
    ('Biography'),
    ('Autobiography'),
    ('Self-help'),
    ('Humor'),
    ('Philosophy'),
    ('Drama');

INSERT INTO book (title, author_id, genre_id, description, cover_image_url, book_amount, isbn, published_date)
 VALUES 
    ('Romeo and Juliet', 1, 1, 'A tragic play about two young lovers from rival families.', 'https://example.com/romeo-and-juliet.jpg', 10, 'ISBN-978-1-5445-1227-3', '1597-01-01'),
    ('Pride and Prejudice', 2, 3, 'A classic novel about the Bennet sisters and their relationships with wealthy gentlemen.', 'https://example.com/pride-and-prejudice.jpg', 5, 'ISBN-978-1-5445-1227-4', '1813-01-28'),
    ('The Adventures of Tom Sawyer', 3, 1, 'A story about a young boy growing up in a small town along the Mississippi River.', 'https://example.com/tom-sawyer.jpg', 7, 'ISBN-978-1-5445-1227-5', '1876-12-10'),
    ('Oliver Twist', 4, 1, 'A novel about a young orphan boy who struggles to survive in Victorian England.', 'https://example.com/oliver-twist.jpg', 8, 'ISBN-978-1-5445-1227-6', '1838-02-01'),
    ('The Old Man and the Sea', 5, 5, 'A novella about an old fisherman and his struggle to catch a giant marlin.', 'https://example.com/old-man-and-the-sea.jpg', 4, 'ISBN-978-1-5445-1227-7', '1952-09-01');

-- Author 6: Fyodor Dostoevsky
INSERT INTO book (title, author_id, genre_id, description, cover_image_url, book_amount, isbn, published_date) 
VALUES ('Crime and Punishment', 6, 2, 'A young man murders an old woman and grapples with his guilt.', 'https://www.example.com/images/crime-and-punishment.jpg', 5, 'ISBN-978-0-393-31473-0', '1866-01-01');

-- Author 7: Leo Tolstoy
INSERT INTO book (title, author_id, genre_id, description, cover_image_url, book_amount, isbn, published_date) 
VALUES ('War and Peace', 7, 1, 'The lives of several aristocratic families are intertwined during Napoleons invasion of Russia.', 'https://www.example.com/images/war-and-peace.jpg', 7, 'ISBN-978-0-141-18728-4', '1869-01-01');

-- Author 8: George Orwell
INSERT INTO book (title, author_id, genre_id, description, cover_image_url, book_amount, isbn, published_date) 
VALUES ('1984', 8, 4, 'A totalitarian government controls every aspect of citizens lives.', 'https://www.example.com/images/1984.jpg', 20, 'ISBN-978-0-141-18728-4', '1949-06-08');

-- Author 9: Franz Kafka
INSERT INTO book (title, author_id, genre_id, description, cover_image_url, book_amount, isbn, published_date) 
VALUES ('The Metamorphosis', 9, 2, 'A man wakes up one morning to find he has turned into a giant insect.', 'https://www.example.com/images/the-metamorphosis.jpg', 3, 'ISBN-978-0-393-09785-6', '1915-10-15');

-- Author 10: Oscar Wilde
INSERT INTO book (title, author_id, genre_id, description, cover_image_url, book_amount, isbn, published_date) 
VALUES ('The Picture of Dorian Gray', 10, 1, 'A man remains young and beautiful while a portrait of him ages and reflects his true nature.', 'https://www.example.com/images/the-picture-of-dorian-gray.jpg', 8, 'ISBN-978-0-393-35405-3', '1890-07-01');

INSERT INTO book (title, author_id, genre_id, description, cover_image_url, book_amount, isbn, published_date) 
 VALUES 
    ('Wuthering Heights', 11, 1, 'The story of the intense and almost demonic love between Catherine Earnshaw and Heathcliff', 'https://images.gr-assets.com/books/1388212715l/6185.jpg', 5, 'ISBN-978-3-16-148410-0', '1847-12-20'),
    ('Jane Eyre', 12, 3, 'The story of governess Jane Eyre and her passionate romance with Mr. Rochester', 'https://images.gr-assets.com/books/1342064408l/10210.jpg', 3, 'ISBN-978-0-306-81325-4', '1847-10-16'),
    ('Ulysses', 13, 15, 'A day in the life of Leopold Bloom, a middle-aged Jewish man living in Dublin, Ireland', 'https://images.gr-assets.com/books/1405396306l/338798.jpg', 2, 'ISBN-978-1-788-17826-1', '1922-02-02'),
    ('The Hobbit', 14, 7, 'The adventure of hobbit Bilbo Baggins, who is recruited by the wizard Gandalf to help a group of dwarves reclaim their treasure from a dragon', 'https://images.gr-assets.com/books/1372847500l/5907.jpg', 10, 'ISBN-978-0-618-00221-9', '1937-09-21'),
    ('Mrs. Dalloway', 15, 3, 'The story of one day in the life of Clarissa Dalloway, an upper-class woman living in London, England', 'https://images.gr-assets.com/books/1390787409l/1493.jpg', 4, 'ISBN-978-1-501-26772-6', '1925-05-14'),
    ('The Fall of the House of Usher and Other Tales', 16, 8, 'A collection of gothic short stories by Edgar Allan Poe', 'https://images.gr-assets.com/books/1348178967l/12395.jpg', 7, 'ISBN-978-1-420-93234-1', '1839-10-31'),
    ('One Hundred Years of Solitude', 17, 1, 'The story of the Buendía family and their seven generations living in the fictional town of Macondo, Colombia', 'https://images.gr-assets.com/books/1327881361l/320.jpg', 6, 'ISBN-978-0-06-088328-7', '1967-05-30'),
    ('The Iliad', 18, 1, 'An epic poem set during the Trojan War, focusing on the wrath of Achilles and its consequences', 'https://images.gr-assets.com/books/1613251618l/11718.jpg', 8, 'ISBN-978-0-06-124418-6', '1200-07-16'),
    ('The Catcher in the Rye', 19, 6, 'The story of Holden Caulfield, a teenage boy who has been expelled from his prep school and is experiencing a mental breakdown', 'https://images.gr-assets.com/books/1398034300l/5107.jpg', 5, 'ISBN-978-0-316-76949-8', '1951-07-16');

INSERT INTO book (title, author_id, genre_id, description, cover_image_url, book_amount, isbn, published_date) 
VALUES ('The Great Gatsby', 20, 1, 'A story of the decadence and excess of the Jazz Age, and the disillusionment and corruption that lurked beneath its surface.', 'https://images-na.ssl-images-amazon.com/images/I/51R5RmXmCPL._SX307_BO1,204,203,200_.jpg', 5, 'ISBN-978-3-16-148410-0', '1925-04-10');

INSERT INTO book (title, author_id, genre_id, description, cover_image_url, book_amount, isbn, published_date) 
VALUES ('The Catcher in the Rye', 21, 6, 'A novel about teenage alienation and angst.', 'https://images-na.ssl-images-amazon.com/images/I/41O+UxT6UOL._SX322_BO1,204,203,200_.jpg', 8, 'ISBN-978-3-16-148410-1', '1951-07-16');

INSERT INTO book (title, author_id, genre_id, description, cover_image_url, book_amount, isbn, published_date) 
VALUES ('To Kill a Mockingbird', 22, 1, 'A novel set in the American South during the Great Depression, that deals with issues of race and prejudice through the eyes of a young girl.', 'https://images-na.ssl-images-amazon.com/images/I/41O11EXll-L._SX327_BO1,204,203,200_.jpg', 7, 'ISBN-978-3-16-148410-2', '1960-07-11');

INSERT INTO book (title, author_id, genre_id, description, cover_image_url, book_amount, isbn, published_date) 
VALUES ('Lolita', 23, 1, 'A controversial novel that follows a middle-aged literature professor and his obsession with a 12-year-old girl.', 'https://images-na.ssl-images-amazon.com/images/I/41HdchBvL1L._SX323_BO1,204,203,200_.jpg', 4, 'ISBN-978-3-16-148410-3', '1955-09-15');

INSERT INTO book (title, author_id, genre_id, description, cover_image_url, book_amount, isbn, published_date) 
VALUES ('The Stranger', 24, 1, 'A philosophical novel that explores themes of existentialism and the absurd.', 'https://images-na.ssl-images-amazon.com/images/I/51p6YYWWHzL._SX314_BO1,204,203,200_.jpg', 6, 'ISBN-978-3-16-148410-4', '1942-06-01');

INSERT INTO book (title, author_id, genre_id, description, cover_image_url, book_amount, isbn, published_date)
VALUES
    ('Norwegian Wood', 25, 6, 'A coming-of-age story set in 1960s Tokyo', 'https://images.example.com/norwegian-wood.jpg', 5, 'ISBN-978-0-307-94748-2', '1987-09-01'),
    ('Beloved', 26, 9, 'A novel about a former slave who is haunted by the memories of her past', 'https://images.example.com/beloved.jpg', 3, 'ISBN-978-1-4000-3343-7', '1987-09-02'),
    ('Think and Grow Rich', 27, 12, 'A self-help book that teaches the reader how to achieve financial success', 'https://images.example.com/think-and-grow-rich.jpg', 10, 'ISBN-978-0-670-26116-0', '1937-03-15');



INSERT INTO reservation (user_id, book_id, borrowed_date, borrowed)
VALUES (3, 85, '2022-12-01', true),
       (3, 89, '2023-01-15', true);

-- User 4
INSERT INTO reservation (user_id, book_id, borrowed_date, borrowed)
VALUES (4, 86, '2023-02-01', true),
       (4, 88, '2023-03-15', true);

-- User 5
INSERT INTO reservation (user_id, book_id, borrowed_date, borrowed)
VALUES (5, 87, '2023-04-01', true),
       (5, 91, '2023-05-15', true);

-- User 6
INSERT INTO reservation (user_id, book_id, borrowed_date, borrowed)
VALUES (6, 90, '2023-06-01', true),
       (6, 92, '2023-07-15', true);

INSERT INTO reservation (user_id, book_id, borrowed_date, borrowed)
 VALUES
    (7, 85, '2023-04-05 14:00:00', true),
    (7, 86, '2023-04-06 10:00:00', false),
    (8, 87, '2023-04-05 12:00:00', true),
    (8, 88, '2023-04-07 16:00:00', true),
    (9, 89, '2023-04-06 09:00:00', true),
    (9, 90, '2023-04-08 15:00:00', false),
    (10, 91, '2023-04-05 11:00:00', true),
    (10, 92, '2023-04-07 13:00:00', true),
    (11, 93, '2023-04-06 14:00:00', true),
    (11, 94, '2023-04-08 12:00:00', false),
    (12, 95, '2023-04-05 16:00:00', true),
    (12, 96, '2023-04-07 10:00:00', true),
    (13, 97, '2023-04-06 13:00:00', true),
    (13, 98, '2023-04-08 11:00:00', false),
    (14, 99, '2023-04-05 15:00:00', true),
    (14, 100, '2023-04-07 14:00:00', true),
    (15, 101, '2023-04-06 11:00:00', true);


SET search_path TO fin1;


CREATE VIEW author_books AS
    SELECT book.id AS id_book, book.title,
     book.description, book.cover_image_url,
     book.published_date, author.id AS id_author,
     genre.name,
     author.username
    FROM book
    JOIN genre ON book.genre_id = genre.id
    JOIN author ON book.author_id = author.id;

CREATE VIEW book_author_view AS
    SELECT book.id, book.title, book.description, book.cover_image_url, book.published_date, genre.name,
           author.id as author_id, author.username
    FROM book
     JOIN genre ON book.genre_id = genre.id
     JOIN author ON book.author_id = author.id;
    

-- dopln do knihy pocet kusov knihy DONE
CREATE VIEW book_reservation_view AS
    SELECT 
        book.*,
        reservation.borrowed_date, 
        reservation.id AS id_reservation,
        reservation.borrowed,
        author.username,
        genre.name
    FROM 
        book 
        JOIN author ON book.author_id = author.id
        JOIN genre ON book.genre_id = genre.id
        LEFT JOIN (
            SELECT DISTINCT ON (book_id) *
            FROM reservation
            ORDER BY book_id, borrowed_date DESC
        ) reservation ON book.id = reservation.book_id;


-- dopln meno pouzivatela do pohladu DONE

CREATE VIEW user_reservation_view AS
SELECT 
    reservation.id AS reservation_id, 
    reservation.user_id, 
    reservation.book_id AS reservation_book_id, 
    reservation.borrowed_date, 
    reservation.borrowed, 
    book.id AS book_id, 
    book.title, 
    book.author_id, 
    book.description, 
    book.cover_image_url, 
    "user".username,
    book.published_date
FROM 
    fin1.reservation
    INNER JOIN fin1.book ON reservation.book_id = book.id
    INNER JOIN fin1.user ON reservation.user_id = "user".id

UPDATE book
SET cover_image_url = 
    CASE
        WHEN random() < 0.125 THEN 'https://images.unsplash.com/photo-1614188045506-2f275a78c18e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y2xhc3NpY2FsJTIwYm9vayUyMGNvdmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
        WHEN random() < 0.25 THEN 'https://images.unsplash.com/photo-1544185310-0b3cf501672b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGNsYXNzaWNhbCUyMGJvb2slMjBjb3ZlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
        WHEN random() < 0.375 THEN 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9va3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
        WHEN random() < 0.50 THEN 'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGJvb2t8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
        WHEN random() < 0.625 THEN 'https://images.unsplash.com/photo-1512820790803-83ca734da794?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJvb2t8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
        WHEN random() < 0.75 THEN 'https://images.unsplash.com/photo-1532012197267-da84d127e765?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Ym9va3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
        WHEN random() < 0.875 THEN 'https://images.unsplash.com/photo-1495640388908-05fa85288e61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGJvb2t8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
        ELSE 'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNsYXNzaWNhbCUyMGJvb2slMjBjb3ZlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
    END;

-- add 20c for each day after 30 days of borrowing
CREATE OR REPLACE FUNCTION check_borrowed_date() 
RETURNS TRIGGER AS $$
DECLARE 
  days_late INT;
BEGIN
  IF NOT NEW.borrowed AND OLD.borrowed THEN
    SELECT DATE_PART('day', CURRENT_DATE - OLD.borrowed_date) INTO days_late;
    IF days_late > 30 THEN
      UPDATE user
      SET fee = fee + (0.20 * (days_late - 30))
      WHERE id = OLD.user_id;
    END IF;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;