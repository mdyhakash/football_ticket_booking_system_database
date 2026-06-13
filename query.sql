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