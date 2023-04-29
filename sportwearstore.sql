-- kill other connections
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'sportwearstore' AND pid <> pg_backend_pid();
-- (re)create the database
DROP DATABASE IF EXISTS sportwearstore;
CREATE DATABASE sportwearstore;
-- connect via psql
\c sportwearstore

-- database configuration
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;

-- Sumary:
--	1) Identify relationships
        -- There are nine (5) entities: employees, order, shopper, user account, items
                                           
--	2) Classify relationships by type (one-to-one, one-to-many, many-to-many)
        -- Between themm, there are seven (7) relationship:

--        Relationship          Type            Description

--       shopper - items        many to one     Each item is purchased by a single buyer, the buyer can purchase many items.
--       shopper - orders       many to one     Each order can be required by a shopper, but each shopper can required many orders
--       employees - orders     many to one     Each employee can make many orders but the order can be maked by only one employee
--       shopper - account      one to one      Each shopper has one user account, and an user account can belong to only one shopper

--	3) Write CREATE TABLE statements, ignoring foreign key columns initially
--	4) Add foreign key columns to CREATE TABLE statements depending on relationship type
--		 Note: Many-to-many requires an extra "bridge table" with 2 foreign keys.
--	5) Execute CREATE TABLE statements
--	6) Write and execute ALTER TABLE statements to enforce foreign key constraints

---
--- CREATE tables
---
CREATE TABLE IF NOT EXISTS employees(
    id SERIAL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    poscition TEXT NOT NULL,
    
);