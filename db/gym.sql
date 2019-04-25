DROP TABLE bookings;
DROP TABLE members;
DROP TABLE group_classes;

CREATE TABLE group_classes (
  id SERIAL8 primary key,
  class_name VARCHAR(255),
  capacity INT4,
  start_at TIME,
  end_at TIME,
  class_date VARCHAR(255)
);

CREATE TABLE members (
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT4,
  membership_type VARCHAR(255)
);

CREATE TABLE bookings (
  id SERIAL8 primary KEY,
  group_classes_id INT8 REFERENCES group_classes(id),
  members_id INT8 REFERENCES members(id)
);
