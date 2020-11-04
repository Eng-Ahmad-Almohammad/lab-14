-- Query1: Creat table called AUTHORS with unique id and all Authors name 

CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));


-- Query2: this command will add authors names from books table to AUTHORS table without duplicating 
INSERT INTO authors(name) SELECT DISTINCT author FROM books;

-- Query3: add new coulmn to books table to be foreign key for the table
ALTER TABLE books ADD COLUMN author_id INT;


-- Query4: In this command we will join two tables to each other where author_id for books table will equal to id in AUTHORS table
UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;



-- Query5: Delete author coulmn from books table 
ALTER TABLE books DROP COLUMN author;



-- Query6: Assign the coulmn (author_id) as a foreign key
ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);