DROP TABLE IF EXISTS space_cowboys;

CREATE TABLE space_cowboys(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  last_known_location VARCHAR(255),
  homeworld VARCHAR(255)
);
