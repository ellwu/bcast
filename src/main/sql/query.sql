use demo;

select resource_id, count(1) from t_qr_counts group by resource_id;

select * from v_qr_counts where resourece_id = :resourceId;

select * from t_qr_counts;
select * from v_counts;

select 
	q.resource_id, 
	count(q.resource_id),
	r.resource_origin_name,
	a.adver_id,
	a.adver_name,
	m.merchant_id,
	m.merchant_name
from t_qr_counts q,
t_resources r,
t_advers a,
t_merchants m
where q.resource_id = r.resource_id
and r.resource_adver_id = a.adver_id
and q.merchant_id = m.merchant_id
group by q.resource_id, 
	a.adver_id,
	m.merchant_id;

update t_qr_counts set creation_time = now() where creation_time is null;

   select
        qrcountvo0_.resource_id as col_0_0_,
        count(qrcountvo0_.resource_id) as col_1_0_,
        qrcountvo0_.resource_id as resource1_17_,
        qrcountvo0_.adver_id as adver_id2_17_,
        qrcountvo0_.adver_name as adver_na3_17_,
        qrcountvo0_.creation_time as creation4_17_,
        qrcountvo0_.merchant_id as merchant5_17_,
        qrcountvo0_.merchant_name as merchant6_17_,
        qrcountvo0_.resource_origin_name as resource7_17_ 
    from
        v_qr_counts qrcountvo0_ 
    where
        qrcountvo0_.adver_id = '17c0b45371184b8d83ef236e0c69d4a8'
        group by col_0_0_;


