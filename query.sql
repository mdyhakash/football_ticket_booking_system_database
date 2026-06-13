-- ============================================================
--  QUERY 1
--  Retrieve all Champions League matches with status 'Available'
-- ============================================================
select
  match_id,
  fixture,
  base_ticket_price
from
  matches
where
  tournament_category = 'Champions League'
  and match_status = 'Available';

-- ============================================================
--  QUERY 2
--  Users whose name starts with 'Tanvir' OR contains 'Haque'
--  (case-insensitive using ILIKE)
-- ============================================================
select
  user_id,
  full_name,
  email
from
  users
where
  full_name ilike 'Tanvir%'
  or full_name ilike '%haque%';

