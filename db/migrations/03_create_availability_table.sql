CREATE TABLE availability(
  id SERIAL PRIMARY KEY,
  space_id INTEGER REFERENCES spaces (id),
  date DATE);
