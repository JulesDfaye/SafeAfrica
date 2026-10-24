create extension if not exists "pgcrypto";

create table if not exists public.users (
 id uuid primary key default gen_random_uuid(),
 email varchar(180) unique,
 role varchar(20) default 'user',
 created_at timestamptz default now()
);

create table if not exists public.scam_categories (
 id serial primary key,
 name varchar(100),
 slug varchar(100) unique,
 description text
);

create table if not exists public.scam_reports (
 id uuid primary key default gen_random_uuid(),
 category_id int references public.scam_categories(id),
 country varchar(80), city varchar(120),
 title varchar(180) not null,
 description text not null,
 scammer_phone varchar(30), suspicious_link varchar(500),
 status varchar(20) default 'pending',
 is_anonymous boolean default true,
 created_at timestamptz default now()
);

insert into public.scam_categories(name,slug,description) values
('Mobile Money','mobile-money','Faux agents et OTP'),
('Phishing','phishing','Faux liens et messages'),
('Faux investissement','faux-investissement','Rendements garantis'),
('Usurpation d’identité','usurpation-identite','SIM swap et piratage')
on conflict(slug) do nothing;