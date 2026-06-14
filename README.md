# Football Ticket Booking System

A relational database project built. This system models how football fans browse matches, purchase tickets, and receive booking confirmations all managed through a structured SQL database.

---

## Project Overview

This project covers:

- Designing a normalized relational database schema
- Creating an Entity Relationship Diagram (ERD) with proper cardinality
- Writing intermediate to advanced SQL queries using JOINs, subqueries, aggregations, NULL handling, and pagination

---

## Database Schema

The system consists of three tables:

### Users

Stores all registered users — both football fans and ticket managers.

| Column       | Type         | Description                        |
| ------------ | ------------ | ---------------------------------- |
| user_id      | SERIAL PK    | Unique user identifier             |
| full_name    | VARCHAR(100) | First and last name                |
| email        | VARCHAR(50)  | email (unique)                     |
| role         | ENUM         | `Ticket Manager` or `Football Fan` |
| phone_number | VARCHAR(20)  | Contact number (nullable)          |

### Matches

Catalogs all football match events with pricing and availability.

| Column              | Type          | Description                                          |
| ------------------- | ------------- | ---------------------------------------------------- |
| match_id            | SERIAL PK     | Unique match identifier                              |
| fixture             | VARCHAR(200)  | Two competing teams                                  |
| tournament_category | VARCHAR(100)  | League or cup name                                   |
| base_ticket_price   | NUMERIC(10,2) | Standard seat price                                  |
| match_status        | ENUM          | `Available`, `Selling Fast`, `Sold Out`, `Postponed` |

### Bookings

Junction table linking users to matches — one row per ticket purchase.

| Column         | Type          | Description                                     |
| -------------- | ------------- | ----------------------------------------------- |
| booking_id     | SERIAL PK     | Unique booking identifier                       |
| user_id        | INT FK        | References Users(user_id)                       |
| match_id       | INT FK        | References Matches(match_id)                    |
| seat_number    | VARCHAR(20)   | Allocated seat (nullable)                       |
| payment_status | ENUM          | `Pending`, `Confirmed`, `Cancelled`, `Refunded` |
| total_cost     | NUMERIC(10,2) | Final invoice amount                            |

---

## ERD Diagram

> [View ERD on drawSql](https://drawsql.app/teams/mdyhakash/diagrams/football-ticket-booking-system)

![Football Ticket Booking System ERD](./ERD.png)

**Relationships:**

```
USERS ──────< BOOKINGS >────── MATCHES
(one)        (many)  (many)     (one)
```

- **One to Many** — One user can place many bookings
- **Many to One** — Many bookings belong to one match
- **Logical One to One** — Each booking row maps exactly one user to one match for one specific seat

---

## SQL Queries

| #   | Description                                             | Concepts Used                 |
| --- | ------------------------------------------------------- | ----------------------------- |
| Q1  | Filter Champions League matches with `Available` status | `WHERE`, multiple conditions  |
| Q2  | Search users by name pattern                            | `ILIKE`, `OR`                 |
| Q3  | Find bookings with missing payment status               | `IS NULL`, `COALESCE`         |
| Q4  | Booking details with user name and match fixture        | `INNER JOIN`                  |
| Q5  | All users including those with no bookings              | `LEFT JOIN`                   |
| Q6  | Bookings above the average total cost                   | Scalar subquery               |
| Q7  | Top 2 matches skipping the most expensive               | `ORDER BY`, `LIMIT`, `OFFSET` |

---

## Project Structure

```
├── README.md        — Project documentation
├── setup.sql        — CREATE TABLE statements + insert data
├── QUERY.sql        — All 7 SQL queries with expected output
└── erd.png          — ERD diagram image (preview)

```
---
## How to Run
 
1. Make sure you have PostgreSQL installed and running
2. Create a new database:

```sql
   CREATE DATABASE football_ticket_db;
```
3. Connect to it and run the setup file.
 
---
 
## Tech Stack
 
- **Database:** PostgreSQL
- **Language:** SQL
- **ERD Tool:** DrawSQL
---
