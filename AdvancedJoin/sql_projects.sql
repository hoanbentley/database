SELECT START_DATE, X FROM (
                              SELECT A.START_DATE, MIN(B.END_DATE) AS X
                              FROM
                                  (SELECT START_DATE FROM PROJECTS WHERE START_DATE NOT IN (SELECT END_DATE FROM PROJECTS)) A,
                                  (SELECT END_DATE FROM PROJECTS WHERE END_DATE NOT IN (SELECT START_DATE FROM PROJECTS)) B
                              WHERE START_DATE < END_DATE
                              GROUP BY A.START_DATE
                          ) P
ORDER BY DATEDIFF(X, START_DATE), START_DATE;