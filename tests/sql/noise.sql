CREATE EXTENSION IF NOT EXISTS anon CASCADE;

-- test data
 
CREATE TABLE test_noise (
	id SERIAL,
	key   TEXT,
	int_value  INT,
	float_value FLOAT,
	date_value DATE
);

INSERT INTO test_noise
VALUES 
	( 1, 'a', 40 , 33.3, '01/01/2019'),
	( 2, 'b', 40 , 33.3, '01/01/2019'),
    ( 3, 'c', 40 , 33.3, '01/01/2019'),
    ( 4, 'd', 40 , 33.3, '01/01/2019'),
    ( 5, 'e', 40 , 33.3, '01/01/2019'),
    ( 6, 'f', 40 , 33.3, '01/01/2019'),
    ( 7, 'g', 40 , 33.3, '01/01/2019'),
    ( 8, 'h', 40 , 33.3, '01/01/2019'),
    ( 9, 'i', 40 , 33.3, '01/01/2019'),
    ( 10, 'j', 40 , 33.3, '01/01/2019')
;

--CREATE TABLE test_noise_backup 
--AS SELECT * FROM test_noise;

SELECT anon.numeric_noise_column('test_noise','int_value', 0.25);

SELECT anon.numeric_noise_column('test_noise','float_value', 3);

SELECT anon.datetime_noise_column('test_noise','date_value', '365 days');



-- TEST 1 :  int_value is between 30 and 50

SELECT min(int_value) >= 30  
AND    max(int_value) <= 50
FROM test_noise;


-- TEST 2 :  float_value is between 
SELECT min(float_value) >=  -66.6  
AND    max(float_value) <= 133.2
FROM test_noise;

-- TEST 3 :  date_value is between 2018 and 2020
SELECT min(date_value) >= '01/01/2018'  
AND    max(date_value) <= '01/01/2020'
FROM test_noise;


DROP EXTENSION anon CASCADE;

DROP TABLE test_noise;

