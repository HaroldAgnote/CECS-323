INSERT INTO student (campusID, firstName, lastName)
  VALUES
    ('4896484564', 'Mike', 'Lang'),
    ('8562655621', 'Joe', 'Smith'),
    ('2135644652','Derek', 'Fisher'),
    ('9874563210','Steven','Draug'),
    ('8545515516','Ben','James'),
    ('4651234615','Justin','Quake'),
    ('7418529632','Chris','Rogers'),
    ('3214567775','Jennifer','Sars'),
    ('1121212115','Harry','Stevens'),
    ('9812312390','Sylvanas','Windrunner'),
    ('9874653106','Son','Gohan'),
    ('4895649856','Mike','Hannigan'),
    ('85241','Joseph','Universe'),
    ('489553','Steven','Universe'),
    ('156235','Son','Goku'),
    ('65564','Son','Goten'),
    ('456465','Steven','Strange'),
    ('1567452','Bruce','Wayne'),
    ('565465','Clark','Kent'),
    ('44454445','Lapis','Lazuli');

INSERT INTO club (clubName, clubDesc, presidentID, secretaryID)
VALUES
  ('Math Club', 'We like Math!', '7412587414', '4574571257'),
  ('Anime Club', 'So Kawaii!', '4577845245','4859826866'),
  ('CECS Club', '00101010','4564891238','9874562148'),
  ('English Club', 'Words are great!','9874563215','7897456151'),
  ('Do Nothing Club', 'Let''s do nothing today','9756432159','4421354654');

INSERT INTO officertitle (titleName)
VALUES
  ('Vice President'),
  ('Treasurer'),
  ('Librarian'),
  ('IT'),
  ('Website Developer'),
  ('Media Technician'),
  ('Chief Writer');

INSERT INTO membership (membershipID, clubName, campusID)
   VALUES
     ('7412587414','Math Club','9874653106'),
     ('4574571257','Math Club','7418529632'),
     ('9874653106','English Club','4895649856'),
     ('7897456151','English Club', '8562655621'),
     ('4564891238','CECS Club','9874563210'),
     ('9874562148','CECS Club','4896484564'),
     ('4577845245','Anime Club','3214567775'),
     ('9756432159','Do Nothing Club','8545515516'),
     ('4421354654','Do Nothing Club','4651234615'),
     ('7418529638','English Club','9874653106'),
     ('7412589632','English Club','9812312390'),
     ('1414252546','CECS Club','3214567775'),
     ('6456856423','CECS Club','1121212115'),
     ('9874265852','Do Nothing Club','65564'),
     ('4896523','Do Nothing Club','489553'),
     ('84563','Do Nothing Club','85241'),
     ('9856243','CECS Club','1567452'),
     ('6523','English Club','456465'),
     ('652653','Do Nothing Club','3214567775'),
     ('8455','Math Club','456465'),
     ('984562','Anime Club','1121212115'),
     ('95452','English Club','1121212115'),
     ('8529637','Do Nothing Club','1121212115'),
     ('765435','Anime Club','44454445');


INSERT INTO office (officerID)
    VALUES
      ('7412587414'),
      ('4574571257'),
      ('9874653106'),
      ('7897456151'),
      ('4564891238'),
      ('9874562148'),
      ('4577845245'),
      ('4859826866'),
      ('9756432159'),
      ('4421354654'),
      ('7418529638'),
      ('7412589632'),
      ('6456856423'),
      ('984562'),
      ('95452'),
      ('8529637'),
      ('765435');

INSERT INTO officer (titleName, officerID)
    VALUES
      ('Vice President','7418529638'),
      ('Librarian','7412589632'),
      ('Treasurer','6456856423'),
      ('Website Developer','984562'),
      ('IT', '95452'),
      ('Media Technician','8529637'),
      ('Librarian','765435');

INSERT INTO club_officer (titleName, officeID, clubName)
    VALUES
      ('Vice President','7418529638','English Club'),
      ('Librarian','7412589632','English Club'),
      ('Treasurer','6456856423','CECS Club'),
      ('Website Developer','984562','Anime Club'),
      ('IT', '95452','English Club'),
      ('Media Technician','8529637','Do Nothing Club'),
      ('Librarian','765435','Anime Club');

INSERT INTO president (officeID)
    VALUES
      ('4564891238'),
      ('4577845245'),
      ('7412587414'),
      ('9874563215'),
      ('9756432159');

INSERT INTO secretary (officeID)
    VALUES
      ('9874561248'),
      ('4859826866'),
      ('4574571257'),
      ('7897456151'),
      ('4421354654');


