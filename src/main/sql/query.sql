use demo;

select 
	a.*
from 
	t_devices d, 
	t_merchants m,
	t_target_merchants tm,
	t_targets t,
	t_target_ads ta,
	t_ads a
where 
	d.device_merchant_id = m.merchant_id
and m.merchant_id = tm.tm_merchant_id
and tm.tm_target_id = t.target_id
and t.target_id = ta.ta_target_id
and ta.ta_ad_id = a.ad_id
and d.device_id = '548c7e8eec9e412888c96b3f532e820a'
order by ta.ta_sequence asc;