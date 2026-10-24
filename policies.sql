alter table public.scam_reports enable row level security;

create policy "public_insert" on public.scam_reports for insert with check (true);
create policy "public_read_verified" on public.scam_reports for select using (status='verified');