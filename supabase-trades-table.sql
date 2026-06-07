create table if not exists public.trades (
  id text primary key,
  created_at timestamptz not null default now(),
  trade_date date not null,
  data jsonb not null
);

create index if not exists trades_trade_date_idx on public.trades (trade_date);
create index if not exists trades_created_at_idx on public.trades (created_at desc);

alter table public.trades enable row level security;

drop policy if exists "Allow anon read trades" on public.trades;
drop policy if exists "Allow anon insert trades" on public.trades;
drop policy if exists "Allow anon delete trades" on public.trades;
drop policy if exists "Allow authenticated read trades" on public.trades;
drop policy if exists "Allow authenticated insert trades" on public.trades;
drop policy if exists "Allow authenticated delete trades" on public.trades;

create policy "Allow authenticated read trades"
on public.trades
for select
to authenticated
using (true);

create policy "Allow authenticated insert trades"
on public.trades
for insert
to authenticated
with check (true);

create policy "Allow authenticated delete trades"
on public.trades
for delete
to authenticated
using (true);
