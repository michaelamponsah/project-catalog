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
