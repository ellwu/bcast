use demo;

drop table if exists t_devices;
create table t_devices(
	device_id char(32) not null,
	
	device_sn varchar(32) not null,
	device_batch varchar(20),
	device_status integer,
	device_bind_status integer,
	
	delete_flag integer,
	disable_flag integer,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(device_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_devices(device_id, device_sn, device_batch, device_status, device_bind_status, delete_flag, disable_flag, version)
	values('a7231144627544caa856f6c4ffeb4262', 'd001', 'b001', 1, 1, 0, 0, 0);

drop table if exists t_advers;
create table t_advers(
	adver_id char(32) not null,
	
	adver_name varchar(200),
	
	adver_addr varchar(400),
	adver_province varchar(20),
	adver_city varchar(20),
	adver_district varchar(20),
	
	adver_category integer,
	
	adver_contact_person varchar(40),
	adver_contact_phone varchar(40),
	adver_operation_person varchar(40),
	
	delete_flag integer,
	disable_flag integer,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(adver_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_advers(adver_id, adver_name, adver_category, delete_flag, disable_flag, version)
	values('c469f63a270249cc81d806e80003d255','a001', 1, 0, 0, 0);

drop table if exists t_merchants;
create table t_merchants(
	merchant_id char(32) not null,
	
	merchant_name varchar(200),
	
	merchant_addr varchar(400),
	merchant_province varchar(20),
	merchant_city varchar(20),
	merchant_district varchar(20),
	
	merchant_level integer,
	
	merchant_contact_person varchar(40),
	merchant_contact_phone varchar(40),
	merchant_spread_person varchar(40),
	merchant_service_person varchar(40),
	
	delete_flag integer,
	disable_flag integer,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(merchant_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_merchants(merchant_id, merchant_name, merchant_level, delete_flag, disable_flag, version)
	values('069bf1625a3e4fd3857511ee952d4777','m001', 1, 0, 0, 0);

drop table if exists t_resources;
create table t_resources(
	resource_id char(32) not null,
	resource_adver_id char(32),
	
	resource_type integer,
	
	resource_origin_name varchar(200),
	resource_duration integer,
	
	resource_upload_time datetime,
	resource_upload_status integer,
	
	resource_category integer,
	
	resource_range_age varchar(200),
	resource_range_group varchar(200),
	resource_target_status integer,
	
	delete_flag integer,
	disable_flag integer,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(resource_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_resources(resource_id, resource_adver_id, resource_type, delete_flag, disable_flag, version)
	values('aa885bbe109549f39ab70a81dbcc1427','c469f63a270249cc81d806e80003d255',1, 0, 0, 0);

drop table if exists t_bindings;
create table t_bindings(
	binding_id char(32) not null,
	
	binding_device_id char(32),
	binding_merchant_id char(32),
	
	binding_bind_time datetime,
	binding_release_time datetime,
	
	binding_status integer,
	
	delete_flag integer,
	disable_flag integer,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(binding_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists t_targets;
create table t_targets(
	target_id char(32) not null,
	
	target_sn char(32),
	
	target_merchant_id char(32),
	target_resource_id char(32),
	
	target_begin_time datetime,
	target_end_time datetime,
	
	target_status integer,
	target_desc varchar(200),
	
	target_play_sequence integer,
	target_ban_time datetime,
	
	delete_flag integer,
	disable_flag integer,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(target_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists t_counts;
create table t_counts(
	count_id char(32) not null,
	device_id char(32),
	resource_id char(32),
	count integer,
	time integer,
	count_time datetime,
	upload_time datetime,
	
	delete_flag integer,
	disable_flag integer,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	
	primary key(count_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*





f329e13ac1ed4a53b823a15e540cb1eb
e6ed10eb8cc340eea8feb7ad2890fe1e
f2ef0f63569c4c429597afc12b95759a
673e852569614965afbfb50e58802b36
b06735d425e64078a7ced0cf62ef2e71
d1f727ad821143858ddd66f146e75aa7

*/
