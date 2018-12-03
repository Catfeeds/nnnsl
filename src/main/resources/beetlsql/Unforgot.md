list
===
SELECT *  FROM nsl_unforgot


unforgot
===
SELECT *,DATE_FORMAT(DATE,'%Y-%m-%d') dateformat FROM nsl_unforgot
where u_id = #{uid} and DATE_FORMAT(DATE,'%Y-%m-%d') like #{dateformat}

initdate
===
SELECT DATE FROM nsl_unforgot WHERE u_id = #{uid}
