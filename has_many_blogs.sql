-- ###### TABLES ######

-- users table
drop table if exists users;
create table if not exists users (
	id serial primary key,
	username varchar (90)not null,
	first_name varchar (90) null default null,
	last_name varchar (90) null default null,
	created_at timestamptz not null default now(),
	updated_at timestamptz not null default now()
);

-- posts table
drop table if exists posts cascade;
create table if not exists posts (
	id serial primary key,
	title varchar(180) null default null,
	url varchar(510) null default null,
	"content" text null default null,
	created_at timestamptz not null default now(),
	updated_at timestamptz not null default now(),
	users_id_fk int not null references users(id)
);

-- comments table
drop table if exists "comments" cascade;
create table if not exists "comments" (
	id serial primary key,
	body varchar(510) null default null,
	created_at timestamptz not null default now(),
	updated_at timestamptz not null default now(),
	users_id_fk int not null references users(id),
	posts_id_fk int not null references posts(id)
);


