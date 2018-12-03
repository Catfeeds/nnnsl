list
===
SELECT c.*,car.`num` cnum,car.`name` cname,u.`NAME` dname ,DAYOFWEEK(c.start) `week`  FROM nsl_carslog c
LEFT JOIN tfw_user u ON u.id = c.`p_id`
LEFT JOIN nsl_cars car ON car.id = c.c_id

one
===
SELECT c.*,car.`num` cnum,car.`name` cname,u.`NAME` dname FROM nsl_carslog c
LEFT JOIN tfw_user u ON u.id = c.`p_id`
LEFT JOIN nsl_cars car ON car.id = c.c_id
where c.id = #{id}

bytime
===
SELECT c.*,car.`num` cnum,car.`name` cname,u.`NAME` dname ,DAYOFWEEK(c.start) `week` FROM nsl_carslog c
LEFT JOIN tfw_user u ON u.id = c.`p_id`
LEFT JOIN nsl_cars car ON car.id = c.c_id
WHERE START BETWEEN #{start} AND #{over}
order by c.start asc
