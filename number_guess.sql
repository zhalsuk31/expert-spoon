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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 999
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (46, 'Alejandro', 2, 2);
INSERT INTO public.users VALUES (57, 'user_1717706312181', 2, 270);
INSERT INTO public.users VALUES (69, 'user_1717707822375', 2, 82);
INSERT INTO public.users VALUES (49, 'user_1717705728334', 2, 30);
INSERT INTO public.users VALUES (56, 'user_1717706312182', 5, 1);
INSERT INTO public.users VALUES (48, 'user_1717705728335', 5, 1);
INSERT INTO public.users VALUES (68, 'user_1717707822376', 5, 395);
INSERT INTO public.users VALUES (79, 'user_1717708048532', 2, 22);
INSERT INTO public.users VALUES (51, 'user_1717705801179', 2, 800);
INSERT INTO public.users VALUES (59, 'user_1717706480258', 2, 55);
INSERT INTO public.users VALUES (78, 'user_1717708048533', 5, 354);
INSERT INTO public.users VALUES (50, 'user_1717705801180', 5, 1);
INSERT INTO public.users VALUES (58, 'user_1717706480259', 5, 1);
INSERT INTO public.users VALUES (71, 'user_1717707847583', 2, 699);
INSERT INTO public.users VALUES (53, 'user_1717705986821', 2, 751);
INSERT INTO public.users VALUES (52, 'user_1717705986822', 5, 1);
INSERT INTO public.users VALUES (70, 'user_1717707847584', 5, 48);
INSERT INTO public.users VALUES (61, 'user_1717706533901', 2, 16);
INSERT INTO public.users VALUES (60, 'user_1717706533902', 5, 1);
INSERT INTO public.users VALUES (55, 'user_1717706232681', 2, 47);
INSERT INTO public.users VALUES (63, 'user_1717706662365', 0, 999);
INSERT INTO public.users VALUES (81, 'user_1717708055780', 2, 516);
INSERT INTO public.users VALUES (62, 'user_1717706662366', 1, 1);
INSERT INTO public.users VALUES (54, 'user_1717706232682', 5, 1);
INSERT INTO public.users VALUES (47, 'Alexey', 6, 1);
INSERT INTO public.users VALUES (73, 'user_1717707886764', 2, 18);
INSERT INTO public.users VALUES (80, 'user_1717708055781', 5, 227);
INSERT INTO public.users VALUES (65, 'user_1717707732073', 2, 140);
INSERT INTO public.users VALUES (72, 'user_1717707886765', 5, 251);
INSERT INTO public.users VALUES (64, 'user_1717707732074', 5, 95);
INSERT INTO public.users VALUES (67, 'user_1717707775768', 2, 310);
INSERT INTO public.users VALUES (75, 'user_1717707969005', 2, 571);
INSERT INTO public.users VALUES (66, 'user_1717707775769', 5, 51);
INSERT INTO public.users VALUES (83, 'user_1717708379949', 2, 56);
INSERT INTO public.users VALUES (74, 'user_1717707969006', 5, 259);
INSERT INTO public.users VALUES (82, 'user_1717708379950', 5, 425);
INSERT INTO public.users VALUES (77, 'user_1717708007139', 2, 557);
INSERT INTO public.users VALUES (76, 'user_1717708007140', 5, 54);
INSERT INTO public.users VALUES (85, 'user_1717708384329', 2, 221);
INSERT INTO public.users VALUES (84, 'user_1717708384330', 5, 136);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 85, true);


--
-- Name: users unique_user_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_user_name UNIQUE (user_name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

