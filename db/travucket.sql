DROP TABLE sights;
DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  visited BOOLEAN NOT NULL,
  picture VARCHAR(255),
  stars INT4
);

CREATE TABLE cities (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  visited BOOLEAN NOT NULL,
  country_id INT8 REFERENCES countries(id) ON DELETE CASCADE,
  picture VARCHAR(255)
);

CREATE TABLE sights (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  visited BOOLEAN NOT NULL,
  city_id INT8 REFERENCES cities(id) ON DELETE CASCADE
);
