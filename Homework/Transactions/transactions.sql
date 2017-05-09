CREATE TABLE dummy (
  name        VARCHAR(20),
  Description VARCHAR(200)
);

START TRANSACTION;

SAVEPOINT alpha;

INSERT INTO dummy (name, description) VALUES ('Bozo', 'A clown'),
  ('Junior', 'Bozo''s assistant');
SAVEPOINT alpha;

INSERT INTO dummy (name, description) VALUES ('Felix', 'A notable cat indeed'),
  ('Gumby', 'One really flexible guy');

SAVEPOINT beta;

DELETE FROM dummy;

SELECT count(*)
FROM dummy;

ROLLBACK WORK TO SAVEPOINT alpha;
