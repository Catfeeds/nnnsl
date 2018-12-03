list
===
select c.*,u.name uname,d.fullname fullname ,dict.name dname,di.name sname,c.visible uid
from nsl_casher c
    left join tfw_user u on c.u_id = u.id
    left join tfw_dept d on d.id = c.d_id
	left join (select num,name from tfw_dict where code=105) dict on c.type=dict.num 
    left join (select num,name from tfw_dict where code=106) di on c.status=di.num

one
===
select c.*,u.name uname
  from nsl_casher c
  left join tfw_user u on u.id = c.u_id
  where c.id = #{cid}

casherlog
===
select l.*,spu.name uname ,IF(c.u_id = #{uid},1,0) me
    from nsl_casher_log l
    left join nsl_casher c on l.c_id = c.id
    left join tfw_user spu on spu.id = l.u_id
    left join tfw_user jbu on jbu.id = c.u_id
    WHERE c.id = #{cid}
    ORDER BY DATE DESC
