list
===
SELECT u.*,u.deptid AS uid,dept.pid AS pId,
	d.name AS SEXNAME,
	e.name AS STATUSNAME,
	dept.simpleName AS DEPTNAME,
	(SELECT GROUP_CONCAT(NAME) FROM tfw_role WHERE  INSTR(CONCAT(",",u.ROLEID,","),CONCAT(",",ID,","))>0) ROLENAME
FROM tfw_user u 
	LEFT JOIN (SELECT num,NAME FROM tfw_dict WHERE CODE=101) d ON u.sex=d.num 
	LEFT JOIN (SELECT num,NAME FROM tfw_dict WHERE CODE=901) e ON u.status=e.num 
	LEFT JOIN (SELECT id,pid,simpleName FROM tfw_dept) dept ON u.deptId=dept.id

mysqllist
===
SELECT u.*,u.deptid AS uid,dept.pid AS pId,
	d.name AS SEXNAME,
	e.name AS STATUSNAME,
	dept.simpleName AS DEPTNAME,
	(SELECT GROUP_CONCAT(NAME) FROM tfw_role WHERE  INSTR(CONCAT(",",u.ROLEID,","),CONCAT(",",ID,","))>0) ROLENAME
FROM tfw_user u 
	LEFT JOIN (SELECT num,NAME FROM tfw_dict WHERE CODE=101) d ON u.sex=d.num 
	LEFT JOIN (SELECT num,NAME FROM tfw_dict WHERE CODE=901) e ON u.status=e.num 
	LEFT JOIN (SELECT id,pid,simpleName FROM tfw_dept) dept ON u.deptId=dept.id
	
leader
===
SELECT id FROM tfw_user 
WHERE deptid = #{dept} AND roleid = 13