CREATE DATABASE catalog;

CREATE TABLE label (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE book (
    id  INT,
    publisher VARCHAR(100),
    publish_date DATE,
    archived BOOLEAN,
    cover_state VARCHAR(100),
    CONSTRAINT FK_bookId FOREIGN KEY(id) REFERENCES label(id)
);

CREATE TABLE genre (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE music_album (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100),
    on_spotify BOOLEAN,
    CONSTRAINT fk_albumId FOREIGN KEY(ID) REFERENCES item(ID)
);

CREATE TABLE author(
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
);

CREATE TABLE game (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  last_played_at DATE,
  multiplayer BOOLEAN,
  publish_date DATE,
  archived BOOLEAN,
  CONSTRAINT fk_authorId FOREIGN KEY (id) REFERENCES author(id),
);