list
===
SELECT l.id,l.f_id,l.`ispass`,l.`date`,l.`opinion` ,u.`NAME` uname ,f.`title_o` fname,e.name pass
FROM nsl_files_log l
LEFT JOIN nsl_files f ON f.`id` = l.`f_id`
LEFT JOIN tfw_user u ON l.`u_id` = u.id
left join (select num,name from tfw_dict where code=903) e on l.ispass=e.num 

isexist
===
select * from nsl_files_log where f_id = #{fid} and u_id = #{uid}