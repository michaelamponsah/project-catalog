CREATE DATABASE catalog;

CREATE TABLE item (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre VARCHAR(100),
    author VARCHAR(100),
    label VARCHAR(100),
    publish_date DATE,
    archived BOOLEAN
);

CREATE TABLE author(
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  items ARRAY
);

CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  last_played_at DATE,
  publish_date Date,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  label_id INT,
  genre_id INT,
  source_id INT,
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id),
  FOREIGN KEY (source_id) REFERENCES sources(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id),
);

CREATE TABLE genre (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE music_albums (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100),
    publish_date DATE,
    on_spotify BOOLEAN,
    archived BOOLEAN,
    genre_id INT,
    genre VARCHAR(100),
    author VARCHAR(100),
    label VARCHAR(100),
    CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genre(id)
);
