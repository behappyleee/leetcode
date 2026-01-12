# Write your MySQL query statement below
SELECT p.firstName as firstName, p.lastname as lastname, a.city as city, a.state as state
           FROM Person p
LEFT OUTER JOIN Address a
             ON p.personId = a.personId;