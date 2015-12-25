use demo;

drop table if exists t_devices;
create table t_devices(
	device_id char(32) not null,
	
	device_sn varchar(32) not null,
	device_batch varchar(20),
	device_status varchar(20),
	device_bind_status varchar(20),
	
	delete_flag integer default 0,
	disable_flag integer default 0,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer default 0,
	
	primary key(device_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_devices(device_id, device_sn, device_batch, device_status, device_bind_status, delete_flag, disable_flag, version)
	values('a7231144627544caa856f6c4ffeb4262', '6a05a302b1fdf8cd', 'b001', '1', '1', 0, 0, 0);

drop table if exists t_advers;
create table t_advers(
	adver_id char(32) not null,
	
	adver_name varchar(200),
	
	adver_addr varchar(400),
	adver_province varchar(20),
	adver_city varchar(20),
	adver_district varchar(20),
	
	adver_category varchar(20),
	
	adver_contact_person varchar(40),
	adver_contact_phone varchar(40),
	adver_operation_person varchar(40),
	
	delete_flag integer default 0,
	disable_flag integer default 0,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer default 0,
	
	primary key(adver_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_advers(adver_id, adver_name, adver_category, delete_flag, disable_flag, version)
	values('c469f63a270249cc81d806e80003d255','a001', '1', 0, 0, 0);

drop table if exists t_merchants;
create table t_merchants(
	merchant_id char(32) not null,
	
	merchant_name varchar(200),
	
	merchant_addr varchar(400),
	merchant_province varchar(20),
	merchant_city varchar(20),
	merchant_district varchar(20),
	
	merchant_level varchar(20),
	merchant_category varchar(20),
	
	merchant_contact_person varchar(40),
	merchant_contact_phone varchar(40),
	merchant_spread_person varchar(40),
	merchant_service_person varchar(40),
	
	delete_flag integer default 0,
	disable_flag integer default 0,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer default 0,
	
	primary key(merchant_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `t_merchants` VALUES 
	('069bf1625a3e4fd3857511ee952d4777','真味清城','软件大道1号','江苏','南京','雨花台','1','1','白凯南','13412312343','求解','秋季',0,0,NULL,'','2015-12-25 09:45:36','',0),
	('2694de5c4d674c8b8a6360b4a4b185b7','来一份','小行小区','江苏','南京','雨花台','2','1','小白','12334512345','求解','秋季',0,0,'2015-12-25 09:53:22',NULL,NULL,NULL,0);


drop table if exists t_resources;
create table t_resources(
	resource_id char(32) not null,
	resource_adver_id char(32),
	
	resource_type integer default 0,
	
	resource_origin_name varchar(200),
	resource_duration integer default 0,
	
	resource_upload_time datetime,
	resource_upload_status integer default 0,
	
	resource_category integer default 0,
	
	resource_range_age varchar(200),
	resource_range_group varchar(200),
	resource_target_status integer default 0,
	
	delete_flag integer default 0,
	disable_flag integer default 0,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer default 0,
	
	primary key(resource_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_resources(resource_id, resource_adver_id, resource_type, delete_flag, disable_flag, version)
	values('aa885bbe109549f39ab70a81dbcc1427','c469f63a270249cc81d806e80003d255',1, 0, 0, 0);
insert into t_resources(resource_id, resource_adver_id, resource_type, delete_flag, disable_flag, version)
	values('8bf1edafa3b9416fbe5f80075de13f7f','c469f63a270249cc81d806e80003d255',1, 0, 0, 0);
insert into t_resources(resource_id, resource_adver_id, resource_type, delete_flag, disable_flag, version)
	values('692404459fdd48abbee8c5a7d5c9c810','c469f63a270249cc81d806e80003d255',1, 0, 0, 0);

drop table if exists t_bindings;
create table t_bindings(
	binding_id char(32) not null,
	
	binding_device_id char(32),
	binding_merchant_id char(32),
	
	binding_bind_time datetime,
	binding_release_time datetime,
	
	binding_status integer default 0,
	
	delete_flag integer default 0,
	disable_flag integer default 0,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer default 0,
	
	primary key(binding_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_bindings(binding_id, binding_device_id, binding_merchant_id, binding_bind_time, binding_release_time, binding_status,
	delete_flag, disable_flag, version)
	values('26e9cb65e2054f2c8c2ec5308841d1d5','a7231144627544caa856f6c4ffeb4262','069bf1625a3e4fd3857511ee952d4777','2015-11-22 21:04:34', '2016-11-22 21:04:34', 1, 0, 0, 0);

drop table if exists t_targets;
create table t_targets(
	target_id char(32) not null,
	
	target_sn char(32),
	
	target_merchant_id char(32),
	target_resource_id char(32),
	
	target_begin_time datetime,
	target_end_time datetime,
	
	target_status integer default 0,
	target_desc varchar(200),
	
	target_play_sequence integer default 0,
	target_ban_time datetime,
	
	delete_flag integer default 0,
	disable_flag integer default 0,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer default 0,
	
	primary key(target_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_targets(target_id, target_sn, target_merchant_id, target_resource_id, target_begin_time, target_end_time,
	target_status, target_play_sequence, delete_flag, disable_flag, version)
	values('a35c11fb41c04f5cae733df3b3c88584', 't001', '069bf1625a3e4fd3857511ee952d4777', 'aa885bbe109549f39ab70a81dbcc1427', '2015-11-22 21:04:34', '2016-11-22 21:04:34', 1, 10, 0, 0, 0);
insert into t_targets(target_id, target_sn, target_merchant_id, target_resource_id, target_begin_time, target_end_time,
	target_status, target_play_sequence, delete_flag, disable_flag, version)
	values('339ec46b030448c386b4348c0b027faf', 't002', '069bf1625a3e4fd3857511ee952d4777', '8bf1edafa3b9416fbe5f80075de13f7f', '2015-11-22 21:04:34', '2016-11-22 21:04:34', 1, 20, 0, 0, 0);
insert into t_targets(target_id, target_sn, target_merchant_id, target_resource_id, target_begin_time, target_end_time,
	target_status, target_play_sequence, delete_flag, disable_flag, version)
	values('19e440b7b20c4a05b5640ec1cfad0b55', 't002', '069bf1625a3e4fd3857511ee952d4777', '692404459fdd48abbee8c5a7d5c9c810', '2015-11-22 21:04:34', '2016-11-22 21:04:34', 1, 30, 0, 0, 0);

drop table if exists t_counts;
create table t_counts(
	count_id char(32) not null,
	device_id char(32),
	resource_id char(32),
	count integer default 0,
	time integer default 0,
	count_time datetime,
	upload_time datetime,
	
	delete_flag integer default 0,
	disable_flag integer default 0,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer default 0,
	
	primary key(count_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists t_versions;
create table t_versions(
	version_id char(32) not null,
	version_code integer default 0,
	version_name char(32),
	version_url varchar(400),
	version_apply_flag integer default 0,
	
	delete_flag integer default 0,
	disable_flag integer default 0,
	
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer default 0,
	
	primary key(version_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_versions(version_id, version_code, version_name, version_url, version_apply_flag, delete_flag, disable_flag, version)
	values('804d39f728324fc8973061a95f68d022', 1, '1.0.1', 'http://shnlng.me:7090/app?version=1', 1, 0, 0, 0);
insert into t_versions(version_id, version_code, version_name, version_url, version_apply_flag, delete_flag, disable_flag, version)
	values('30af2f1d60b24a1ea9a992d0d2eab607', 2, '1.0.2', 'http://shnlng.me:7090/app?version=2', 0, 0, 0, 0);
insert into t_versions(version_id, version_code, version_name, version_url, version_apply_flag, delete_flag, disable_flag, version)
	values('23c54e8367e746f7bde84cbbb04c656c', 3, '1.0.3', 'http://shnlng.me:7090/app?version=3', 0, 0, 0, 0);


/*





f329e13ac1ed4a53b823a15e540cb1eb
e6ed10eb8cc340eea8feb7ad2890fe1e
f2ef0f63569c4c429597afc12b95759a
673e852569614965afbfb50e58802b36
b06735d425e64078a7ced0cf62ef2e71
d1f727ad821143858ddd66f146e75aa7

*/
