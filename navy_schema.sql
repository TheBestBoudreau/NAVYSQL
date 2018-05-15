SELECT 'hello, SQlite';
CREATE TABLE fleet (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE ship(
  id INTEGER PRIMARY KEY,
  fleet_id INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  dateBuilt VARCHAR(255) NOT NULL,
  FOREIGN KEY(fleet_id) REFERENCES fleet(id)
);

CREATE TABLE sailors(
  id INTEGER PRIMARY KEY,
  ship_id INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  birthdate VARCHAR(255) NOT NULL,
  FOREIGN KEY(ship_id)REFERENCES ship(id)
);

CREATE TABLE duty(
  id INTEGER PRIMARY KEY,
  sailors_id INTEGER NOT NULL,
  dutyName VARCHAR(255),
  startDate VARCHAR(255),
  endDate VARCHAR(255),
  isDutyHighRank INTEGER,
  FOREIGN KEY(sailors_id)REFERENCES sailors(id)
);

CREATE TABLE duty_ships(
  id INTEGER PRIMARY KEY,
  ship_id INTEGER NOT NULL REFERENCES ship(id),
  duty_id INTEGER NOT NULL REFERENCES duty(id)

);

INSERT INTO fleet
(name)
VALUES ('Soaring Kiwis'),
('Mom''s Book Club');

INSERT INTO ship
(name, dateBuilt,fleet_id)
VALUES ('Sam JazzHands', 'April 15, 2018',1),
('Joels Blow Piano', 'October 29, 1994',1),
('MaryAnn','March 17, 1956',1),
('Dirty Dunkirk','September 20, 1956',2),
('Steel Salmon','December 12, 1940',2);

INSERT INTO sailors
(name, birthdate, ship_id)
VALUES ('Tom Sawyer', 'May 14, 1979', 1),
('Captain Philips', 'April 19, 1950',2),
('Luke Jenson', 'August 13, 1980',1),
('Jane Doe', 'September 20, 1999',3),
('John Doe', 'January 30, 2001',3),
('Velma Summers', 'July 28, 1988',3);

INSERT INTO duty
(dutyName, startDate, endDate,isDutyHighRank, sailors_id)
VALUES ('Swap the desk', 'September 10, 2018', 'September 10,2019',1,1),
('Wash the dishes', 'April 20, 2018', 'April 21, 2018',1,3),
('Laundry', 'July 21, 2018', 'July 22, 2018',0,4);
