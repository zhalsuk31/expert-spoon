--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dust; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dust (
    dust_id integer NOT NULL,
    name character varying(30),
    description text,
    commentary text NOT NULL
);


ALTER TABLE public.dust OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    size numeric,
    distance numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    neighbours text,
    small boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(100) NOT NULL,
    distance_from_earth integer NOT NULL,
    size integer NOT NULL,
    volume numeric,
    comentary text NOT NULL,
    is_in_solar_system boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    color text,
    age numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: dust; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dust VALUES (1, 'Silver dust', '', 'looks like silver');
INSERT INTO public.dust VALUES (2, 'Golden dust', '', 'Looks like gold');
INSERT INTO public.dust VALUES (3, 'Regular dust', '', 'Comment');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Antennae', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Backward', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Fourth', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'five', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'six', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'First', true, NULL, NULL, 2);
INSERT INTO public.moon VALUES (2, 'Second', false, NULL, NULL, 2);
INSERT INTO public.moon VALUES (3, 'Third', false, NULL, NULL, 2);
INSERT INTO public.moon VALUES (4, 'Fourth', true, NULL, NULL, 2);
INSERT INTO public.moon VALUES (5, 'Fifth', false, NULL, NULL, 2);
INSERT INTO public.moon VALUES (6, 'Sixths', true, NULL, NULL, 2);
INSERT INTO public.moon VALUES (7, 'Seventh', true, NULL, NULL, 2);
INSERT INTO public.moon VALUES (8, 'Eighths', false, NULL, NULL, 2);
INSERT INTO public.moon VALUES (9, 'Ninths', false, NULL, NULL, 2);
INSERT INTO public.moon VALUES (10, 'Tenths', false, NULL, NULL, 2);
INSERT INTO public.moon VALUES (11, 'Elevenths', false, NULL, NULL, 2);
INSERT INTO public.moon VALUES (12, 'Twelve', false, NULL, NULL, 2);
INSERT INTO public.moon VALUES (13, 'Thirteen', true, NULL, NULL, 2);
INSERT INTO public.moon VALUES (14, 'Fourteen', false, NULL, NULL, 2);
INSERT INTO public.moon VALUES (15, 'Fivteen', true, NULL, NULL, 2);
INSERT INTO public.moon VALUES (16, 'Sixteen', false, NULL, NULL, 2);
INSERT INTO public.moon VALUES (17, 'Seventeen', true, NULL, NULL, 2);
INSERT INTO public.moon VALUES (18, 'Eighteen', true, NULL, NULL, 2);
INSERT INTO public.moon VALUES (19, 'Nineteen', false, NULL, NULL, 2);
INSERT INTO public.moon VALUES (20, 'The final one', false, NULL, NULL, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our planet', 0, 1, 1, 'We all know it', true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Next planet', 1, 1, 2, 'Next to us', true, 1);
INSERT INTO public.planet VALUES (3, 'Jupyter', 'After Mars', 2, 2, 3, 'The planet after Mars', true, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'After Jypiter', 2, 3, 4, 'After Saturn', true, 1);
INSERT INTO public.planet VALUES (5, 'Uran', 'big planet', 6, 5, 4, 'One to last in solar system', true, 1);
INSERT INTO public.planet VALUES (6, 'Neptun', 'Sailor Neptun', 9, 1, 3, 'Sometimes not considered a planet', true, 1);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Firstplanet', -3, 1, 3, 'Very first', true, 1);
INSERT INTO public.planet VALUES (8, 'Venus', 'I am your fire', -2, 3, 5, 'Very hot indeed', true, 1);
INSERT INTO public.planet VALUES (9, 'Imaginary 1', 'I inveted it myself', 50, 23, 45, 'If this makes sense...', false, 1);
INSERT INTO public.planet VALUES (10, 'Imaginary 2', 'Another one', 45, 23, 43, 'How many can I invent', false, 1);
INSERT INTO public.planet VALUES (11, 'Imaginary 3', 'This is painful', 234, 34, 43, 'Invent again', false, 1);
INSERT INTO public.planet VALUES (12, 'Imaginary 4', 'Finally', 555, 23, 43, 'what can i say', false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Polar', '', '', 5, 3);
INSERT INTO public.star VALUES (2, 'Big', '', '', 6, 3);
INSERT INTO public.star VALUES (3, 'Guiding', '', '', 7, 3);
INSERT INTO public.star VALUES (4, 'Four', '', '', 5, 3);
INSERT INTO public.star VALUES (5, 'Five', '', '', 6, 3);
INSERT INTO public.star VALUES (6, 'Six', '', '', 7, 3);


--
-- Name: dust dust_dust_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dust
    ADD CONSTRAINT dust_dust_id_key UNIQUE (dust_id);


--
-- Name: dust dust_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dust
    ADD CONSTRAINT dust_pkey PRIMARY KEY (dust_id);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

