/*
 * A. Print the names of the clubs and the number of offices they have sorted in descending order.
 */

SELECT clubName, COUNT(officerID) AS "Number of Offices" FROM club
INNER JOIN membership USING (clubName)
INNER JOIN office ON membership.membershipID = office.officerID
GROUP BY clubName
ORDER BY COUNT(officerID) DESC;

/*
 *
 * B. Print the names of the students who are in clubs, as well as the number of offices that the student is holding,
 *    in descending order by the number of offices that they are holding.
 *
 */

SELECT firstName, lastName, COUNT(officerID) AS "Number of Offices Holding" from student
INNER JOIN membership USING (campusID)
INNER JOIN office ON membershipID = officerID
GROUP BY firstName,lastName
ORDER BY COUNT(officerID) DESC;


/*
 *
 * C. Print the offices that the clubs are using, in descending order, the offices used by the most clubs, down to the
 *    ones used by the smallest number of clubs.
 *
 */
SELECT query.Title, query.Count FROM
  ((SELECT 'President' AS "Title", COUNT(officeID) AS "Count" FROM president)
UNION
  (SELECT 'Secretary' AS "Title", COUNT(officeID) AS "Count" FROM secretary)
UNION
  (SELECT titleName AS "Title", COUNT(officerID) AS "Count" from officertitle
  INNER JOIN officer USING (titleName)
  INNER JOIN office USING (officerID)
  GROUP BY titleName)) query
ORDER BY query.Count DESC;

/*
 *
 * D. Print the student names of any students who are president of one club and also are vice president of at
 *    least one other club.
 *
 */

SELECT firstName, lastName from student
WHERE campusID IN
      (SELECT campusID from student
        INNER JOIN membership USING (campusID)
        INNER JOIN president ON officeID = membershipID)
AND campusID IN
    (SELECT campusID from membership
    INNER JOIN office ON membershipID = officerID
    INNER JOIN officer USING (officerID)
    WHERE titleName = 'Vice President')