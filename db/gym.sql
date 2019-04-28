DROP TABLE bookings;
DROP TABLE members;
DROP TABLE group_classes;

CREATE TABLE group_classes (
  id SERIAL8 primary key,
  class_name VARCHAR(255),
  capacity INT4,
  start_at VARCHAR(255),
  end_at VARCHAR(255),
  class_date DATE
);

CREATE TABLE members (
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  membership_type VARCHAR(255)
);

CREATE TABLE bookings (
  id SERIAL8 primary KEY,
  group_class_id INT8 REFERENCES group_classes(id) ON DELETE CASCADE,
  member_id INT8 REFERENCES members(id) ON DELETE CASCADE
);
