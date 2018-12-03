list
===
select g.*,c.num cnum,c.name cname from nsl_cars_gas g
left join nsl_cars c on c.id = g.c_id

one
===
select g.*,c.num cnum,c.name cname from nsl_cars_gas g
left join nsl_cars c on c.id = g.c_id
where g.id = #{id}