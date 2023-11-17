# 최댓값 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/59415
SELECT DATETIME
FROM ANIMAL_INS
WHERE DATETIME = (SELECT MAX(DATETIME) FROM ANIMAL_INS);


# 특정 옵션이 포함된 자동차 리스트 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/157343
SELECT CAR_ID, CAR_TYPE, DAILY_FEE, OPTIONS
FROM CAR_RENTAL_COMPANY_CAR
WHERE INSTR(OPTIONS, '네비게이션') > 0
ORDER BY CAR_ID DESC;


# 자동차 대여 기록에서 장기/단기 대여 구분하기
# https://school.programmers.co.kr/learn/courses/30/lessons/151138
-- DATEDIFF 는 단순하게 날짜 차이, 렌트일은 포함
SELECT HISTORY_ID, CAR_ID,
    DATE_FORMAT(START_DATE, '%Y-%m-%d') AS START_DATE,
    DATE_FORMAT(END_DATE, '%Y-%m-%d') AS END_DATE,
    IF(DATEDIFF(END_DATE, START_DATE)+1 >= 30, '장기 대여', '단기 대여') AS RENT_TYPE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE YEAR(START_DATE) = '2022' AND MONTH(START_DATE) = '9'
ORDER BY HISTORY_ID DESC;


# 조건에 부합하는 중고거래 댓글 조회하기
# https://school.programmers.co.kr/learn/courses/30/lessons/164673
SELECT ub.TITLE, ub.BOARD_ID, ur.REPLY_ID, ur.WRITER_ID, ur.CONTENTS,
        DATE_FORMAT(ur.CREATED_DATE, '%Y-%m-%d') AS CREATED_DATE
FROM USED_GOODS_BOARD AS ub INNER JOIN USED_GOODS_REPLY AS ur ON ub.BOARD_ID = ur.BOARD_ID
WHERE YEAR(ub.CREATED_DATE) = '2022' AND MONTH(ub.CREATED_DATE) = '10'
ORDER BY CREATED_DATE ASC, ub.TITLE ASC;


