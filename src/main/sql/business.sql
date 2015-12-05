use demo;

drop table if exists t_merchants;
create table t_merchants(
	merchant_id char(32) not null,
	merchant_name varchar(200),
	merchant_desc varchar(200),
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(merchant_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;




insert into t_merchants(merchant_id, merchant_name, merchant_desc, version)
	values('04ebfba883d1444999d88a1e67f699e9','DEMO_MERCHANT', 'Demo Merchant', 0);

drop table if exists t_devices;
create table t_devices(
	device_id char(32) not null,
	device_sequence_num char(32) not null,
	device_merchant_id char(32),
	device_status int,	
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(device_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_devices(device_id, device_sequence_num, device_merchant_id, device_status, version)
	values('548c7e8eec9e412888c96b3f532e820a','a5bc6b02da9a45ebb643c131c7df0ac2', '04ebfba883d1444999d88a1e67f699e9', 1, 0);

drop table if exists t_advertisers;
create table t_advertisers(
	advertiser_id char(32) not null,
	advertiser_name varchar(200),
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(advertiser_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_advertisers(advertiser_id, advertiser_name, version)
	values('d3815a0963b5433eb939fd290769ca4b','DEMO_ADVER', 0);

drop table if exists t_ads;
create table t_ads(
	ad_id char(32) not null,
	ad_type int,
	ad_child_sequence varchar(500),
	ad_duration int,
	ad_desc varchar(500),
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(ad_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_ads(ad_id, ad_type, ad_child_sequence, ad_duration, ad_desc, version)
	values('87aa8f25dc524fe6b422e20f828ed9e4', 1, null, '40', 'ADV0001', 0);
insert into t_ads(ad_id, ad_type, ad_child_sequence, ad_duration, ad_desc, version)
	values('38ddb6ee43ba401d85ba967c87e377c6', 1, null, '45', 'ADV0002', 0);
insert into t_ads(ad_id, ad_type, ad_child_sequence, ad_duration, ad_desc, version)
	values('9c0eb86aee7345deb827208b86523d96', 1, null, '23', 'ADV0003', 0);


drop table if exists t_targets;
create table t_targets(
	target_id char(32) not null,
	target_advertiser_id char(32) not null,
	target_begin_time datetime,
	target_end_time datetime,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(target_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_targets(target_id, target_advertiser_id, target_begin_time, target_end_time, version)
	values('660c70d8900c4300a7c0fae6273fda1c', 'd3815a0963b5433eb939fd290769ca4b', now(), now() + 100, 0);

drop table if exists t_target_merchants;
create table t_target_merchants(
	tm_id char(32) not null,
	tm_target_id char(32) not null,
	tm_merchant_id char(32) not null,
	tm_status int,
	tm_begin_time datetime,
	tm_end_time datetime,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(tm_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_target_merchants(tm_id, tm_target_id, tm_merchant_id, tm_status, tm_begin_time, tm_end_time, version)
	values('2820cf76dd704d4392a8eda296c6e3be', '660c70d8900c4300a7c0fae6273fda1c', '04ebfba883d1444999d88a1e67f699e9', 1, null, null, 0);
	
	


drop table if exists t_target_ads;
create table t_target_ads(
	ta_id char(32) not null,
	ta_target_id char(32) not null,
	ta_ad_id char(32) not null,
	ta_sequence int,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(ta_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
insert into t_target_ads(ta_id, ta_target_id, ta_ad_id, ta_sequence, version)
	values('88614e287065478e899d831186e435fe', '660c70d8900c4300a7c0fae6273fda1c', '87aa8f25dc524fe6b422e20f828ed9e4', 10, 0);
insert into t_target_ads(ta_id, ta_target_id, ta_ad_id, ta_sequence, version)
	values('21e87e30f65b454fbf193ac8b62eba7c', '660c70d8900c4300a7c0fae6273fda1c', '38ddb6ee43ba401d85ba967c87e377c6', 30, 0);
insert into t_target_ads(ta_id, ta_target_id, ta_ad_id, ta_sequence, version)
	values('180229b3ce7e4614a428701cc38fcfe3', '660c70d8900c4300a7c0fae6273fda1c', '9c0eb86aee7345deb827208b86523d96', 20, 0);

drop table if exists t_counts;
create table t_counts(
	count_device_id char(32) not null,
	count_ad_id char(32) not null,
	count_play_count int,
	count_time datetime,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(count_device_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*





f329e13ac1ed4a53b823a15e540cb1eb
e6ed10eb8cc340eea8feb7ad2890fe1e
f2ef0f63569c4c429597afc12b95759a
673e852569614965afbfb50e58802b36
b06735d425e64078a7ced0cf62ef2e71
d1f727ad821143858ddd66f146e75aa7

*/
