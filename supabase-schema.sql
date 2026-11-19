-- Supabase SQL Editor: review and run manually. Public practice leaderboard, NOT verified scores.
create table if not exists public.quiz_scores (
 id bigint generated always as identity primary key,
 quiz_id text not null check (quiz_id in ('nfts-week9-fall2026','week10-fall2026','week11-fall2026','week12-fall2026')),
 nickname text not null check (length(nickname) between 2 and 30 and nickname ~ '^[[:alnum:]_.@ -]+$'),
 difficulty text not null check (difficulty in ('easy','intermediate','difficult','mixed')),
 question_count int not null check (question_count between 1 and 25),
 correct_count int not null check (correct_count >= 0 and correct_count <= question_count),
 created_at timestamptz not null default now()
);
create index if not exists quiz_scores_ranking on public.quiz_scores(quiz_id,difficulty,question_count,correct_count desc,created_at asc);
alter table public.quiz_scores enable row level security;
-- Avoid enabling UPDATE/DELETE for browsers; limit column grants to public fields.
revoke all on public.quiz_scores from anon, authenticated;
grant usage on schema public to anon, authenticated;
grant select (nickname,difficulty,question_count,correct_count,created_at,quiz_id) on public.quiz_scores to anon, authenticated;
grant insert (quiz_id,nickname,difficulty,question_count,correct_count) on public.quiz_scores to anon, authenticated;
-- Identity sequence access for inserts where required.
grant usage on sequence public.quiz_scores_id_seq to anon, authenticated;
drop policy if exists "Anyone can read practice scores" on public.quiz_scores;
create policy "Anyone can read practice scores" on public.quiz_scores for select to anon, authenticated using (true);
drop policy if exists "Anyone can submit practice scores" on public.quiz_scores;
create policy "Anyone can submit practice scores" on public.quiz_scores for insert to anon, authenticated with check (quiz_id in ('nfts-week9-fall2026','week10-fall2026','week11-fall2026','week12-fall2026'));
