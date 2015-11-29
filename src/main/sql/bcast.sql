use demo;

drop table if exists t_users;

create table t_users(
	user_id char(32) not null,
	user_name varchar(100) not null,
	user_password varchar(100) not null,
	user_desc varchar(200),
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	primary key(user_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_users(user_id, user_name, user_password, version)
	values('6eeea16a4ea5463f93f6120b9be1ab93', 'ell', 'ell', 0);
insert into t_users(user_id, user_name, user_password, version)
	values('2013cd8e0d8d40e6adc9e0e2e9d35bc2', 'q', 'q', 0);
	
drop table if exists t_roles;
	
create table t_roles(
	role_id char(32) not null,
	role_name varchar(100) not null,
	role_desc varchar(200),
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	primary key(role_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_roles(role_id, role_name, version)
	values('a8e6c0b58e4540f2a71ab6fa722ae9ed','administrator', 0);
insert into t_roles(role_id, role_name, version)
	values('69813f5d391945b5921a520dc0b2d4cc','user', 0);

drop table if exists t_menus;
	
create table t_menus(
	menu_id char(32) not null,
	menu_key char(30) not null,
	menu_prompt varchar(100) not null,
	menu_parent_id varchar(32),
	menu_desc varchar(200),
	menu_sequence int,
	func_id char(32),
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	primary key(menu_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('79a627c7f9654d69954ef5ff756c175a','M_ROOT','顶级菜单',null,0,null,0);

insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('eaafa50f51844514bf7107d9c6e26359','M_BUS','商户管理','79a627c7f9654d69954ef5ff756c175a',10000,null,0);
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('4de1a7d8526a40b4bcc3aa15dd2f821c','M_DEV','设备管理','79a627c7f9654d69954ef5ff756c175a',20000,null,0);
	
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('1c32b4ff6c8b48268749e50b91603465','M_ADV','广告管理','79a627c7f9654d69954ef5ff756c175a',30000,null,0);
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('42784df28fb14578ad15262199f688fd','M_ADV_SUP','广告商管理','1c32b4ff6c8b48268749e50b91603465',31000,null,0);
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('525125e92cc348ac8be2eb504f0ca1a5','M_ADV_RES','广告资源管理','1c32b4ff6c8b48268749e50b91603465',32000,null,0);
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('976e48f7f5634229953d10cb708860b1','M_ADV_CAST','广告投放管理','1c32b4ff6c8b48268749e50b91603465',33000,null,0);
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('81f8105f8f6f4501ab53cd4b7f3bf42a','M_ADV_SEQ','广告播放序列','1c32b4ff6c8b48268749e50b91603465',34000,null,0);
	
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('c039dc4cfc84431db0b30a3005ab13bf','M_BI','统计分析','79a627c7f9654d69954ef5ff756c175a',40000,null,0);
	
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('95e69d004bd249fb8f322544d9580ff6','M_SYS','系统管理','79a627c7f9654d69954ef5ff756c175a',50000,null,0);
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('8abf98df55d8453ebaeb91edcce6b58d','M_SYS_USER','用户管理','95e69d004bd249fb8f322544d9580ff6',51000,null,0);
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('2ecf8f58b6a54bb99d8c7dd8fdf54818','M_SYS_AUTH','权限管理','95e69d004bd249fb8f322544d9580ff6',52000,null,0);	
	
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('7bc9d96a5e0842efad3457645e22ab1a','M_SYS_AUTH_MENU','菜单管理','2ecf8f58b6a54bb99d8c7dd8fdf54818',52100,'aed515fee3d14457a39af9b6517c8c68',0);	
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('35759031fca744e6ba514455dc2b2f38','M_SYS_AUTH_ROLE','角色管理','2ecf8f58b6a54bb99d8c7dd8fdf54818',52200,null,0);	
	
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('11e8b8f65b034756b6030c148b3e75a0','M_SYS_LOK','数据字典','95e69d004bd249fb8f322544d9580ff6',53000,null,0);
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('70fce8f8ccb542b88d50141268c27f7d','M_SYS_LOK_CA','字典类型','11e8b8f65b034756b6030c148b3e75a0',53100,null,0);
insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('03490a7795ac44369ae724023c313b12','M_SYS_LOK_VS','字典值','11e8b8f65b034756b6030c148b3e75a0',53200,null,0);

insert into t_menus(menu_id, menu_key, menu_prompt, menu_parent_id, menu_sequence, func_id, version)
	values('887f192a7132480a8cdc71abb6506c3c','M_SYS_PROFILE','系统参数','95e69d004bd249fb8f322544d9580ff6',54000,'0ec29df240fa41d59dbdf4f8d0a7b06b',0);

drop table if exists t_user_roles;

create table t_user_roles(
	ur_id char(32) not null,
	ur_user_id char(32) not null,
	ur_role_id char(32) not null,
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	primary key(ur_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into t_user_roles(ur_id, ur_user_id, ur_role_id, version)
	values('bc4a4c27f39f4fdfac5e11b39a605ece','6eeea16a4ea5463f93f6120b9be1ab93', 'a8e6c0b58e4540f2a71ab6fa722ae9ed', 0);
insert into t_user_roles(ur_id, ur_user_id, ur_role_id, version)
	values('463f2ca5ccd04a239656074efb00e5a4','2013cd8e0d8d40e6adc9e0e2e9d35bc2', '69813f5d391945b5921a520dc0b2d4cc', 0);

drop table if exists t_role_menus;

create table t_role_menus(
	rm_id char(32) not null,
	rm_role_id char(32) not null,
	rm_menu_id char(32) not null,
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	primary key(rm_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_role_menus(rm_id, rm_role_id, rm_menu_id, version)
	values('12d928d1846b42bb8a4a4aebae555830', 'a8e6c0b58e4540f2a71ab6fa722ae9ed', '95e69d004bd249fb8f322544d9580ff6', 0);
insert into t_role_menus(rm_id, rm_role_id, rm_menu_id, version)
	values('4d73b5adc6074c1fa4a912b02dccd9e6', '69813f5d391945b5921a520dc0b2d4cc', '95e69d004bd249fb8f322544d9580ff6', 0);

drop table if exists t_funcs;

create table t_funcs(
	func_id char(32) not null,
	func_key char(30) not null,
	func_prompt varchar(100),
	func_url varchar(400),
	func_desc varchar(200),
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	primary key (func_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_funcs(func_id, func_key, func_prompt, func_url, version)
	values('aed515fee3d14457a39af9b6517c8c68', 'F_MENU_HOME', 'Menu Home', '/menu/home.do', 0);
insert into t_funcs(func_id, func_key, func_prompt, func_url, version)
	values('0ec29df240fa41d59dbdf4f8d0a7b06b', 'F_PROFILE_HOME', 'Profile Home', '/profile/home.do', 0);

drop table if exists t_profiles;

create table t_profiles(
	profile_id char(32) not null,
	profile_key char(30) not null,
	profile_value varchar(200) not null,
	profile_prompt varchar(100),
	profile_desc varchar(200),
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	primary key(profile_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists t_categories;

create table t_categories(
	category_id char(32) not null,
	category_key char(30) not null,
	category_prompt varchar(50),
	category_desc varchar(200),
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	primary key(category_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists t_lookups;

create table t_lookups(
	lookup_id char(32) not null,
	lookup_category_id char(32) not null,
	lookup_key char(30) not null,
	lookup_value varchar(200) not null,
	lookup_desc varchar(200),
	creation_time datetime,
	created_by char(32),
	update_time datetime,
	updated_by char(32),
	version integer,
	primary key(lookup_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*

random ids:











54b98d09e0d24feaa53d277f9027806a
4a29c61bdaa7446b8d52f216c0b4e5ff
fdf5ab3aacce47f8b5e76dafc76d61fe
ca8ab14b5bfb4d139965f60b4bf1fecd
e27534cc870347f183d5c8d151b08eb6
489ab30eef5148548a833fce98af4e5e
1bcc070eaced40f08b8d40f95ab85e73
bb2ed3d2bf684dc7934ee66a3e43763c
2deb71cdaecf40dabe1a99cc6f31dd67
103a70039a184cdfa15bbbd53dbf9a70
227eb0ca23a34297a80dbc214c875ba7
247551f60e3b4b4888681d275c3805e2
355bb18abab24faa8590a058f188d7ac
20ab7cac904141ca82f48e25afd38e64
d0edce6a718a4c65b64d25ffd947f7bb
a7231144627544caa856f6c4ffeb4262
c469f63a270249cc81d806e80003d255
069bf1625a3e4fd3857511ee952d4777
aa885bbe109549f39ab70a81dbcc1427
26e9cb65e2054f2c8c2ec5308841d1d5
a35c11fb41c04f5cae733df3b3c88584
339ec46b030448c386b4348c0b027faf
19e440b7b20c4a05b5640ec1cfad0b55
8bf1edafa3b9416fbe5f80075de13f7f
692404459fdd48abbee8c5a7d5c9c810
804d39f728324fc8973061a95f68d022
30af2f1d60b24a1ea9a992d0d2eab607
23c54e8367e746f7bde84cbbb04c656c
b8db7cf1fed6491fa61e324419688896
9136c634f90142ccb489f0b054400f4f
193aa58780b44f0798499164ad72f9d2
438da4022f474fa5bcd7fe25575176be
6109e3e658b342b48419af79baad7526
d2b99648adf24990a49026aefe58f7d6
df4d5b7b6d4643c4ba17950506bab2dd
959c01ab10cd4ceface6865410fc375b
3aae3d72f2a34eddac92389ddea9909f
d1bfc36818e747ec8fbc18123df2a53a
14b23a40a69b4778823604c0414c50c6
0cb066d3d7d943ee9a15e8c93aa3b758
5684bc5dd19a4da8a3f73c1bafac9ab5
6788631816ab42c2b2497547d94ad532
3ea7c70b16be4b6c9fa058e5e4407392
a073984172134391bf5c0e97a8d849a1
0eb5ce4b9b18457299c34a230b0c3e66
ae0a2ee607a74df5a0a6aa54ab5700a4
0cb9c83db6074aabbbe9b462b39af1db
b404095c68744c0ba30257ce16f5ba4c
f5dc1172771a4118a0c97233194cf99f
02a69ced2d9f45bc92559ba2071c247d
55dcbbdbca0540d9987fdb5734b9d478
28605a5b0fbd4a8b8ae16d302a52f523
3dbb7bda92a74e7f95365590bdb5ec1d
04ebfba883d1444999d88a1e67f699e9
87aa8f25dc524fe6b422e20f828ed9e4
38ddb6ee43ba401d85ba967c87e377c6
9c0eb86aee7345deb827208b86523d96
2820cf76dd704d4392a8eda296c6e3be
88614e287065478e899d831186e435fe
21e87e30f65b454fbf193ac8b62eba7c
180229b3ce7e4614a428701cc38fcfe3
f329e13ac1ed4a53b823a15e540cb1eb
e6ed10eb8cc340eea8feb7ad2890fe1e
f2ef0f63569c4c429597afc12b95759a
673e852569614965afbfb50e58802b36
b06735d425e64078a7ced0cf62ef2e71
d1f727ad821143858ddd66f146e75aa7
660c70d8900c4300a7c0fae6273fda1c
d3815a0963b5433eb939fd290769ca4b
a5bc6b02da9a45ebb643c131c7df0ac2
548c7e8eec9e412888c96b3f532e820a


*/