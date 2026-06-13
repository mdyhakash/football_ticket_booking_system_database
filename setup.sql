CREATE DATABASE Football_Ticket_Booking_System


-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;
  
-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE Users (
    user_id serial primary key,
    full_name varchar(100) not null,
    email varchar(50) not null unique,
    role varchar(50 )not null check(role in ('Ticket Manager', 'Football Fan')),
    phone_number varchar(20)
);

-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
CREATE TABLE Matches (
    match_id serial primary key,
    fixture varchar(200) not null,
    tournament_category varchar(50) not null,
    base_ticket_price numeric(10,2) not null,
    match_status varchar(20) not null check(match_status in('Available','Selling Fast','Sold Out','Postponed'))
);

-- =========================================================================
-- 3. CREATE BOOKINGS TABLE
-- =========================================================================
CREATE TABLE Bookings (
    booking_id serial primary key,
    user_id int not null references users(user_id),
    match_id int not null references matches(match_id),
    seat_number varchar(10) ,
    payment_status varchar(20) check(payment_status in('Pending','Confirmed','Cancelled','Refunded')),
    total_cost numeric(10,2) not null
);