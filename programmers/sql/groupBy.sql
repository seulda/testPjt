-- 고양이와 개는 몇 마리 있을까
SELECT ANIMAL_TYPE, count(ANIMAL_TYPE) AS count FROM ANIMAL_INS
GROUP BY ANIMAL_TYPE ORDER BY ANIMAL_TYPE;

-- 동명 동물 수 찾기
SELECT NAME, COUNT(NAME) AS COUNT FROM ANIMAL_INS
GROUP BY NAME
HAVING COUNT > 1
ORDER BY NAME;

-- 입양 시각 구하기(1)
SELECT DATE_FORMAT(DATETIME, '%H') AS HOUR, COUNT(DATE_FORMAT(DATETIME, '%H')) AS COUNT FROM ANIMAL_OUTS
GROUP BY HOUR
HAVING HOUR > 8 AND HOUR < 20
ORDER BY HOUR;

-- 입양 시각 구하기(2)
SET @HOUR = -1;
SELECT (@HOUR := @HOUR +1) AS HOUR ,
    (SELECT COUNT(HOUR(DATETIME)) FROM ANIMAL_OUTS 
     WHERE HOUR(DATETIME)=@HOUR) AS COUNT
FROM ANIMAL_OUTS
WHERE @HOUR < 23;
