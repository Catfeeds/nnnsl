list
===
SELECT c.* ,a.url img ,e.`NAME` ss FROM nsl_cars c
LEFT JOIN tfw_attach a ON c.`pic` = a.`ID`
LEFT JOIN (SELECT num,NAME FROM tfw_dict WHERE CODE=107) e ON c.status=e.num 

initcars
===
UPDATE nsl_cars SET status = 1 WHERE STATUS = 2
