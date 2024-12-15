-- Keep a log of any SQL queries you execute as you solve the mystery.

-- List all tables in the database to see what information is available
.tables
-- Check the schema of the crime_scene_reports table for relevant columns
.schema crime_scene_reports


-- Retrieve the crime scene report for the theft on July 28, 2023, at Humphrey Street
SELECT * FROM crime_scene_reports
WHERE year = 2023 AND month = 7 AND day = 28 AND street = 'Humphrey Street';

--
-- Retrieve all witness interview transcripts to gather details about the theft
SELECT name, transcript FROM interviews
WHERE transcript LIKE '%bakery%';

-- bakery_security_logs
SELECT * FROM bakery_security_logs
WHERE year = 2023 AND month = 7 AND day = 28 AND hour = 10 AND minute > 15 AND minute <= 25 AND activity = 'exit' ;
+-----+------+-------+-----+------+--------+----------+---------------+
| id  | year | month | day | hour | minute | activity | license_plate |
+-----+------+-------+-----+------+--------+----------+---------------+
| 260 | 2023 | 7     | 28  | 10   | 16     | exit     | 5P2BI95       |
| 261 | 2023 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
| 262 | 2023 | 7     | 28  | 10   | 18     | exit     | 6P58WS2       |
| 263 | 2023 | 7     | 28  | 10   | 19     | exit     | 4328GD8       |
| 264 | 2023 | 7     | 28  | 10   | 20     | exit     | G412CB7       |
| 265 | 2023 | 7     | 28  | 10   | 21     | exit     | L93JTIZ       |
| 266 | 2023 | 7     | 28  | 10   | 23     | exit     | 322W7JE       |
| 267 | 2023 | 7     | 28  | 10   | 23     | exit     | 0NTHK55       |
+-----+------+-------+-----+------+--------+----------+---------------+

-- Find the person associated with each ATM withdrawal
SELECT ba.person_id, a.account_number ,a.transaction_type,a.amount
FROM atm_transactions a
JOIN bank_accounts ba ON a.account_number = ba.account_number
WHERE a.year = 2023 AND a.month = 7 AND a.day = 28 AND a.atm_location = 'Leggett Street' AND transaction_type = 'withdraw';

+-----------+----------------+------------------+--------+
| person_id | account_number | transaction_type | amount |
+-----------+----------------+------------------+--------+
| 467400    | 28500762       | withdraw         | 48     |
| 395717    | 28296815       | withdraw         | 20     |
| 449774    | 76054385       | withdraw         | 60     |
| 686048    | 49610011       | withdraw         | 50     |
| 458378    | 16153065       | withdraw         | 80     |
| 396669    | 25506511       | withdraw         | 20     |
| 438727    | 81061156       | withdraw         | 30     |
| 514354    | 26013199       | withdraw         | 35     |
+-----------+----------------+------------------+--------+

-- Retrieve phone call records around the time of the theft (10:15 AM)
SELECT * FROM phone_calls
WHERE year = 2023 AND month = 7 AND day = 28
AND duration < 60;

+-----+----------------+----------------+------+-------+-----+----------+
| id  |     caller     |    receiver    | year | month | day | duration |
+-----+----------------+----------------+------+-------+-----+----------+
| 221 | (130) 555-0289 | (996) 555-8899 | 2023 | 7     | 28  | 51       |
| 224 | (499) 555-9472 | (892) 555-8872 | 2023 | 7     | 28  | 36       |
| 233 | (367) 555-5533 | (375) 555-8161 | 2023 | 7     | 28  | 45       |
| 251 | (499) 555-9472 | (717) 555-1342 | 2023 | 7     | 28  | 50       |
| 254 | (286) 555-6063 | (676) 555-6554 | 2023 | 7     | 28  | 43       |
| 255 | (770) 555-1861 | (725) 555-3243 | 2023 | 7     | 28  | 49       |
| 261 | (031) 555-6622 | (910) 555-3251 | 2023 | 7     | 28  | 38       |
| 279 | (826) 555-1652 | (066) 555-9701 | 2023 | 7     | 28  | 55       |
| 281 | (338) 555-6650 | (704) 555-2131 | 2023 | 7     | 28  | 54       |
+-----+----------------+----------------+------+-------+-----+----------+
SELECT * FROM people WHERE phone_number ='(375) 555-8161' --no passport
SELECT * FROM people WHERE phone_number ='(725) 555-3243'
-- Find Info OF THEf
SELECT * FROM people
WHERE id IN (
    SELECT ba.person_id
    FROM atm_transactions a
    JOIN bank_accounts ba ON a.account_number = ba.account_number
    WHERE a.year = 2023 AND a.month = 7 AND a.day = 28 AND a.atm_location = 'Leggett Street' AND transaction_type = 'withdraw')
    AND license_plate IN (
        SELECT license_plate FROM bakery_security_logs
        WHERE year = 2023 AND month = 7 AND day = 28 AND hour = 10 AND minute > 15 AND minute <= 25 AND activity = 'exit')
    AND phone_number IN(
        SELECT caller FROM phone_calls
        WHERE year = 2023 AND month = 7 AND day = 28 AND duration < 60);

+--------+-------+----------------+-----------------+---------------+
|   id   | name  |  phone_number  | passport_number | license_plate |
+--------+-------+----------------+-----------------+---------------+
| 514354 | Diana | (770) 555-1861 | 3592750733      | 322W7JE       |
| 686048 | Bruce | (367) 555-5533 | 5773159633      | 94KL13X       |
+--------+-------+----------------+-----------------+---------------+

SELECT *
FROM flights
WHERE year = 2023 AND month = 7 AND day = 29 AND origin_airport_id IN (SELECT id FROM airports WHERE city = 'Fiftyville') ORDER BY hour,minute LIMIT 1;
+----+-------------------+------------------------+------+-------+-----+------+--------+
| id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
+----+-------------------+------------------------+------+-------+-----+------+--------+
| 36 | 8                 | 4                      | 2023 | 7     | 29  | 8    | 20     |
| 43 | 8                 | 1                      | 2023 | 7     | 29  | 9    | 30     |
| 23 | 8                 | 11                     | 2023 | 7     | 29  | 12   | 15     |
| 53 | 8                 | 9                      | 2023 | 7     | 29  | 15   | 20     |
| 18 | 8                 | 6                      | 2023 | 7     | 29  | 16   | 0      |
+----+-------------------+------------------------+------+-------+-----+------+--------+

--Bruce

SELECT * FROM passengers WHERE passport_number = 3391710505 AND flight_id IN (SELECT id FROM flights WHERE year = 2023 AND month = 7 AND day = 29 AND  origin_airport_id = 8);



--The ACCOMPLICE is
SELECT * FROM people WHERE phone_number ='(375) 555-8161';
+--------+-------+----------------+-----------------+---------------+
|   id   | name  |  phone_number  | passport_number | license_plate |
+--------+-------+----------------+-----------------+---------------+
| 864400 | Robin | (375) 555-8161 | NULL            | 4V16VO0       |
+--------+-------+----------------+-----------------+---------------+

