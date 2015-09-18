-- Maurice Cox
-- Flights Assignment


-- problem 1
-- How many airplanes have listed speeds?
-- What is the minimum listed speed and the maximum listed speed?
SELECT * FROM planes WHERE speed IS NOT NULL
ORDER BY speed ASC;


-- problem 2
-- What is the total distance flown by all of the planes in January 2013? 
SELECT SUM(distance) FROM flights WHERE year=2013 AND month=1;

-- What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
SELECT SUM(distance) FROM flights WHERE year=2013 AND month=1 AND tailnum IS NULL;

-- problem 3
-- What is the total distance flown by all of the planes in July 5, 2013? 
SELECT * FROM flights WHERE year = 2013 AND month=7 AND day=5;
SELECT * FROM planes;

-- Inner Join
SELECT manufacturer, distance
FROM planes 
INNER JOIN flights
ON planes.tailnum=flights.tailnum
WHERE flights.year=2013 AND flights.month=7 AND flights.day=5
GROUP BY manufacturer ASC;


-- Left Outer Join
SELECT manufacturer, distance
FROM planes 
LEFT OUTER JOIN flights
ON planes.tailnum=flights.tailnum
WHERE flights.year=2013 AND flights.month=7 AND flights.day=5
GROUP BY manufacturer ASC;

-- problem 4
-- trying to select airplanes that fly into EWR airport and see what the weather is on July 5th
SELECT * 
FROM flights f
INNER JOIN weather w
ON f.year = w.year AND f.month = w.month AND f.day = w.day AND f.hour = w.hour
INNER JOIN planes p
ON f.tailnum = p.tailnum
WHERE f.year = 2013 AND f.month = 7 AND f.day = 5;


