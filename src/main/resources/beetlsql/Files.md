list
===
SELECT CONCAT(IFNULL(f.`visiable`,""),',',IFNULL(f.`copy`,""),',',IFNULL(f.`u_id`,"")) vv,f.*,type.name typename,dept.fullname fullname,user.name uname ,sta.name staname
FROM nsl_files f
LEFT JOIN (SELECT num,NAME FROM tfw_dict WHERE CODE=103) TYPE ON f.type=type.num
LEFT JOIN (SELECT num,NAME FROM tfw_dict WHERE CODE=104) sta ON f.status=sta.num
LEFT JOIN tfw_dept dept ON f.d_id = dept.id 
LEFT JOIN tfw_user USER ON f.u_id = user.id

one
===
SELECT CONCAT(IFNULL(f.`visiable`,""),',',IFNULL(f.`copy`,""),',',IFNULL(f.`u_id`,"")) vv,f.*,type.name typename,dept.fullname fullname,user.name uname ,sta.name staname
FROM nsl_files f
LEFT JOIN (SELECT num,NAME FROM tfw_dict WHERE CODE=103) TYPE ON f.type=type.num
LEFT JOIN (SELECT num,NAME FROM tfw_dict WHERE CODE=104) sta ON f.status=sta.num
LEFT JOIN tfw_dept dept ON f.d_id = dept.id 
LEFT JOIN tfw_user USER ON f.u_id = user.id
where f.id = #{id}


spfile
===
SELECT * FROM nsl_files 
WHERE visiable LIKE #{userid}
AND id NOT IN (SELECT f_id FROM nsl_files_log WHERE u_id LIKE #{userid} GROUP BY f_id)
order by id desc


read
===
SELECT NAME FROM  tfw_user  WHERE id IN (SELECT u_id FROM nsl_files_log WHERE f_id = #{fid} GROUP BY u_id)


myround
===
SELECT COUNT(id) FROM (SELECT id FROM nsl_files WHERE ROUND = 1 AND visiable LIKE #{uidl} GROUP BY id) c

hasround
===
SELECT COUNT(1) FROM (SELECT *  FROM nsl_files_log WHERE u_id = #{uid}) c

round
===
SELECT id,title_o FROM nsl_files 
WHERE visiable LIKE #{uidlike}
AND `round` = 1 
AND id NOT IN (SELECT IFNULL(f_id,1) FROM nsl_files_log WHERE u_id = #{uid} GROUP BY f_id) 
ORDER BY id DESC


casher
===
SELECT id,title FROM nsl_casher 
WHERE visible LIKE #{uidlike}
AND `status` NOT IN (8,9,10,11,12)
AND id NOT IN (SELECT IFNULL(c_id,1) FROM nsl_casher_log WHERE u_id = #{uid} GROUP BY c_id) 
ORDER BY id DESC

dofiles
===
SELECT * FROM nsl_files WHERE STATUS = 8 AND copy LIKE #{uidlike}


index
===
SELECT * FROM (
SELECT f.id,f.title_o title ,'/files/splog/' TYPE,l.`date` cd ,u.name uname,'1' vers
FROM nsl_files  f
LEFT JOIN nsl_files_vislog l ON l.`f_id` = f.`id`
LEFT JOIN tfw_user u ON l.`u_id` = u.id 
WHERE f.visiable LIKE #{uidlike}
AND f.id NOT IN (SELECT f_id FROM nsl_files_log WHERE u_id LIKE #{uidlike} and ispass = 2 GROUP BY f_id)

UNION

SELECT f.id,f.title_o title ,'/files/splog/' TYPE,l.`fudate` cd ,u.name uname,'2' vers
FROM nsl_files_log l
LEFT JOIN  nsl_files f ON l.`f_id` = f.id
LEFT JOIN  tfw_user u ON u.id = f.`u_id`
WHERE l.u_id = #{uid}
AND l.VERSION = 1
GROUP BY f.id

UNION ALL

SELECT c.id,c.title,'/casher/casherlog?cid=' TYPE ,c.date cd , cu.name uname ,'3' vers
FROM nsl_casher c
LEFT JOIN nsl_casher_log cl ON cl.c_id = c.id
LEFT JOIN tfw_user u ON cl.`u_id` = u.id
LEFT JOIN tfw_user cu ON c.`u_id` = cu.id
WHERE visible LIKE #{uidlike}
AND c.`status` NOT IN (8,9,10,11,12)
AND c.id NOT IN (SELECT IFNULL(c_id,1) FROM nsl_casher_log WHERE u_id like #{uidlike} GROUP BY c_id)
ORDER BY cd DESC
)c
GROUP BY title
order by c.cd desc





splog
===
SELECT l.* ,u.`name` uname,fu.`NAME` funame,IF(f.u_id = #{uid},1,0) me
FROM nsl_files_log l
LEFT JOIN tfw_user u ON u.id = l.`u_id`
LEFT JOIN nsl_files f ON f.id = l.`f_id`
LEFT JOIN tfw_user fu ON fu.id = f.`u_id`
WHERE f.id = #{fid}
AND l.`ispass` = 2
ORDER BY DATE DESC


logview
===
UPDATE nsl_files_log SET VERSION = 2 WHERE f_id=#{fid} AND u_id = #{uid}


visible
===
SELECT v.u_id,u.name `before`,v.`after` , v.afterid  
FROM nsl_files_vislog v
LEFT JOIN tfw_user u ON  v.`u_id` = u.id
WHERE f_id = #{fid} ORDER BY DATE ASC