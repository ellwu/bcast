drop view if exists v_counts;

create view v_counts as
select 
	c.count_id,
	m.merchant_id,
	m.merchant_name,
	m.merchant_category,
	a.adver_id,
	a.adver_name,
	a.adver_category,
	c.upload_time,
	c.count_time,
	r.resource_origin_name,
	sum(c.count) as count, 
	sum(c.time) as time,
	count(c.device_id) as devices
from 
	t_counts c
left join t_resources r 
	on c.resource_id = r.resource_id
left join t_advers a 
	on c.adver_id = a.adver_id
left join t_merchants m 
	on c.merchant_id = m.merchant_id
group by c.device_id, c.resource_id;

select * from v_counts;

