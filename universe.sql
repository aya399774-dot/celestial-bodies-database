-- PostgreSQL database dump
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;
\c universe;

CREATE TABLE galaxy_type (
    galaxy_type_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    age_in_millions_of_years INT NOT NULL,
    distance_from_earth NUMERIC,
    has_life BOOLEAN
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    galaxy_id INT REFERENCES galaxy(galaxy_id) NOT NULL,
    mass_in_solar_masses NUMERIC,
    is_spherical BOOLEAN NOT NULL
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    star_id INT REFERENCES star(star_id) NOT NULL,
    radius_km INT,
    distance_from_star NUMERIC,
    has_atmosphere BOOLEAN
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    planet_id INT REFERENCES planet(planet_id) NOT NULL,
    orbital_period_days NUMERIC,
    is_large BOOLEAN NOT NULL
);

INSERT INTO galaxy_type (name, description) VALUES
('Spiral', 'A rotating disk-like system'),
('Elliptical', 'An ellipsoid shape of light'),
('Irregular', 'Does not have a distinct regular shape');

INSERT INTO galaxy (name, age_in_millions_of_years, distance_from_earth, has_life) VALUES
('Milky Way', 13600, 0, TRUE),
('Andromeda', 10000, 2.5, FALSE),
('Triangulum', 12000, 3.0, FALSE),
('Sombrero', 13000, 29.0, FALSE),
('Whirlpool', 400, 23.0, FALSE),
('Messier 87', 13000, 53.0, FALSE);

INSERT INTO star (name, galaxy_id, mass_in_solar_masses, is_spherical) VALUES
('Sun', 1, 1.0, TRUE),
('Alpha Centauri A', 1, 1.1, TRUE),
('Sirius', 1, 2.0, TRUE),
('Betelgeuse', 1, 16.5, TRUE),
('Alpheratz', 2, 3.6, TRUE),
('Mirach', 2, 2.5, TRUE);

INSERT INTO planet (name, star_id, radius_km, distance_from_star, has_atmosphere) VALUES
('Mercury', 1, 2440, 0.39, FALSE),
('Venus', 1, 6051, 0.72, TRUE),
('Earth', 1, 6371, 1.0, TRUE),
('Mars', 1, 3389, 1.52, TRUE),
('Jupiter', 1, 69911, 5.2, TRUE),
('Saturn', 1, 58232, 9.58, TRUE),
('Uranus', 1, 25362, 19.2, TRUE),
('Neptune', 1, 24622, 30.05, TRUE),
('Proxima b', 2, 7000, 0.05, TRUE),
('Sirius b-planet1', 3, 4000, 1.2, FALSE),
('Alpheratz b', 5, 8000, 1.5, FALSE),
('Mirach b', 6, 9000, 2.1, FALSE);

INSERT INTO moon (name, planet_id, orbital_period_days, is_large) VALUES
('Moon', 3, 27.3, TRUE),
('Phobos', 4, 0.3, FALSE),
('Deimos', 4, 1.26, FALSE),
('Io', 5, 1.77, TRUE),
('Europa', 5, 3.55, TRUE),
('Ganymede', 5, 7.15, TRUE),
('Callisto', 5, 16.69, TRUE),
('Titan', 6, 15.95, TRUE),
('Enceladus', 6, 1.37, FALSE),
('Mimas', 6, 0.94, FALSE),
('Rhea', 6, 4.5, FALSE),
('Dione', 6, 2.7, FALSE),
('Tethys', 6, 1.88, FALSE),
('Iapetus', 6, 79.33, FALSE),
('Titania', 7, 8.7, FALSE),
('Oberon', 7, 13.5, FALSE),
('Umbriel', 7, 4.1, FALSE),
('Ariel', 7, 2.5, FALSE),
('Triton', 8, 5.88, TRUE),
('Nereid', 8, 360.14, FALSE);
