list
===
SELECT l.* ,u.`NAME` uname ,c.`title` cname
FROM nsl_casher_log l
LEFT JOIN tfw_user u ON l.u_id = u.`ID`
LEFT JOIN nsl_casher c ON l.c_id = c.id


isexist
===
select * from nsl_casher_log where c_id = #{cid} and u_id = #{uid}