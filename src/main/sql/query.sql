use demo;

select resource_id, count(1) from t_qr_counts group by resource_id;
