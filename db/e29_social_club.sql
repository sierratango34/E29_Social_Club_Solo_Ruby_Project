DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS events;

CREATE TABLE bookings (
  id SERIAL4 PRIMARY KEY,
  member_id INT4 REFERENCES members(id),
  event_id INT4 REFERENCES events(id)
);

CREATE TABLE members (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  attendance_count INT4
);

CREATE TABLE events (
  id SERIAL4 PRIMARY KEY,
  type VARCHAR(255),
  number_attending INT4,
  max_capacity INT4
);
