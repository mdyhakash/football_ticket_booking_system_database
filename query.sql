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

-- ============================================================
--  QUERY 3
--  Bookings where payment_status IS NULL
--  Replace NULL with 'Action Required' using COALESCE
-- ============================================================
select
  booking_id,
  user_id,
  match_id,
  coalesce(payment_status, 'Action Required') as systematic_status
from
  bookings
where
  payment_status is null;

-- ============================================================
--  QUERY 4
--  Booking details joined with user name and match fixture
--  Concept: INNER JOIN (both sides must have a matching row)
-- ============================================================
select
  b.booking_id,
  u.full_name,
  m.fixture,
  b.total_cost
from
  bookings b
  inner join users u on b.user_id = u.user_id
  inner join matches m on b.match_id = m.match_id;

-- ============================================================
--  QUERY 5
--  All users and their booking IDs — fans with NO bookings
--  must still appear (NULL booking_id).
--  Concept: LEFT JOIN keeps every row from the left table (users)
-- ============================================================
select u.user_id,u.full_name,b.booking_id
from users u
left join bookings b on u.user_id = b.user_id
order by u.user_id;

-- ============================================================
--  QUERY 6
--  Bookings whose total_cost is strictly above the overall average
--  Concept: scalar subquery inside WHERE
-- ============================================================
select booking_id, match_id, total_cost
from bookings
where total_cost > (select avg(total_cost) from bookings);

-- ============================================================
--  QUERY 7
--  Top 2 most expensive matches, skipping the absolute highest
--  Concept: ORDER BY + LIMIT + OFFSET
--  OFFSET 1 skips the #1 row (Real Madrid vs Barcelona at 150)
-- ============================================================
select match_id,fixture,base_ticket_price
from matches
order by base_ticket_price desc
limit 2 offset 1;


