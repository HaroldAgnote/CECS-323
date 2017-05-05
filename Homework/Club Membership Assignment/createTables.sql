SET FOREIGN_KEY_CHECKS  = 0;

CREATE TABLE club (
  clubName VARCHAR(24) NOT NULL,
  clubDesc TEXT,
  presidentID VARCHAR(10) NOT NULL,
  secretaryID VARCHAR(10) NOT NULL,

  CONSTRAINT club_pk
    PRIMARY KEY (clubName),

  CONSTRAINT club_president_fk
  FOREIGN KEY (presidentID)
    REFERENCES president (officeID),

  CONSTRAINT club_secretary_fk
  FOREIGN KEY (secretaryID)
    REFERENCES secretary (officeID)
);

CREATE TABLE student (
  campusID VARCHAR(10) NOT NULL,
  firstName VARCHAR(20),
  lastName VARCHAR(20),
  CONSTRAINT student_pk
    PRIMARY KEY (campusID)
);

CREATE TABLE membership (
  membershipID VARCHAR(10) NOT NULL,
  clubName VARCHAR(24) NOT NULL,
  campusID VARCHAR(10) NOT NULL,

  CONSTRAINT membership_pk
  PRIMARY KEY (membershipID),

  CONSTRAINT membership_uk01
  UNIQUE (clubName,campusID),

  CONSTRAINT membership_club_fk
  FOREIGN KEY (clubName)
    REFERENCES club (clubName),

  CONSTRAINT membership_student_fk
  FOREIGN KEY (campusID)
    REFERENCES student (campusID)
);

CREATE TABLE office (
  officerID VARCHAR(10) NOT NULL,

  CONSTRAINT office_pk
  PRIMARY KEY (officerID),

  CONSTRAINT office_membership_fk
  FOREIGN KEY (officerID)
    REFERENCES membership (officerID)
);

CREATE TABLE officerTitle (
  titleName VARCHAR(20) NOT NULL,

  CONSTRAINT officerTitle_pk
  PRIMARY KEY (titleName)
);

CREATE TABLE officer (
  titleName VARCHAR(20) NOT NULL,
  officerID VARCHAR(10) NOT NULL,

  CONSTRAINT officer_pk
  PRIMARY KEY (titleName, officerID),

  CONSTRAINT officer_officerTitle_fk
  FOREIGN KEY (titleName)
    REFERENCES officerTitle (titleName),

  CONSTRAINT officer_office_fk
  FOREIGN KEY (officerID)
    REFERENCES office (officerID)
);

CREATE TABLE president (
  officeID VARCHAR(10) NOT NULL,

  CONSTRAINT president_pk
  PRIMARY KEY (officeID),

  CONSTRAINT president_office_fk
  FOREIGN KEY (officeID)
    REFERENCES office (officeID)
);

CREATE TABLE secretary (
  officeID VARCHAR(10) NOT NULL,

  CONSTRAINT secretary_pk
  PRIMARY KEY (officeID),

  CONSTRAINT secretary_office_fk
  FOREIGN KEY (officeID)
    REFERENCES office (officeID)
);

CREATE TABLE club_officer (
  titleName VARCHAR(20) NOT NULL,
  officeID VARCHAR(10) NOT NULL,
  clubName VARCHAR(24) NOT NULL,

  CONSTRAINT club_officer_pk
  PRIMARY KEY (titleName, officeID, clubName),

  CONSTRAINT club_officer_officer_fk
  FOREIGN KEY (titleName, officeID)
    REFERENCES officer (titleName, officerID),

  CONSTRAINT club_officer_club
  FOREIGN KEY (clubName)
    REFERENCES club (clubName)
);