--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types text,
    description text,
    age_in_millions_of_years numeric,
    distance_from_earth numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    is_spherical boolean,
    distance_from_earth integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    planet_type character varying(30),
    is_spherical boolean,
    galaxy_id integer,
    distance_from_earth integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    galaxy_id integer NOT NULL,
    distance_from_earth integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: would_visit; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.would_visit (
    galaxy_id integer NOT NULL,
    would_visit boolean NOT NULL,
    name character varying(50),
    would_visit_id integer NOT NULL,
    visitor_id integer NOT NULL
);


ALTER TABLE public.would_visit OWNER TO freecodecamp;

--
-- Name: would_visit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.would_visit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.would_visit_id_seq OWNER TO freecodecamp;

--
-- Name: would_visit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.would_visit_id_seq OWNED BY public.would_visit.would_visit_id;


--
-- Name: would_visit_visitor_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.would_visit_visitor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.would_visit_visitor_id_seq OWNER TO freecodecamp;

--
-- Name: would_visit_visitor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.would_visit_visitor_id_seq OWNED BY public.would_visit.visitor_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: would_visit would_visit_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.would_visit ALTER COLUMN would_visit_id SET DEFAULT nextval('public.would_visit_id_seq'::regclass);


--
-- Name: would_visit visitor_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.would_visit ALTER COLUMN visitor_id SET DEFAULT nextval('public.would_visit_visitor_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'barred spiral', 'red', 12345, 9292929292);
INSERT INTO public.galaxy VALUES (2, 'Antennae', 'starburst', 'red and pink', 5, 83838383);
INSERT INTO public.galaxy VALUES (3, 'Butterfly', 'unbarred spiral', 'like a butterfly', 3030, 15151515);
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 'spiral', 'like a spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Pretend Milky Way', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Wherever Gallifray is', NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Titan', 4, false, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, NULL);
INSERT INTO public.moon VALUES (3, 'Daimos', 4, false, NULL);
INSERT INTO public.moon VALUES (4, 'Earths Moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Venuses Moon', 4, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Venuses other Moon', 4, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'earths fake other Moon', 4, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Galifrays fake  Moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Galifrays other fake  Moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Galifrays alt-other fake  Moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Plutos pretend  Moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Plutos pretendish  Moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Mars pretendish  Moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Mars fakish  Moon', 2, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Mars moons Moon', 2, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Dune Pretend Moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Dune Pretend Moon 2', 3, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Dune Pretend Moon 3', 3, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'yet another imaginary moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'some other imaginary moon', 3, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, NULL, true, 4, 0);
INSERT INTO public.planet VALUES (2, 'Dune', true, NULL, true, NULL, 90000000);
INSERT INTO public.planet VALUES (3, 'GALIFRAY', true, NULL, true, NULL, 7000000);
INSERT INTO public.planet VALUES (5, 'Mercury', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Venus', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Mars', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Jupiter', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Saturn', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Saturn 2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Fake Pluto', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Fake Earth', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Fake Dune', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 'yellow, hot', NULL, 4, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Andromedae', NULL, NULL, 1, NULL);
INSERT INTO public.star VALUES (3, 'name unknown', 'white dwarf', NULL, 1, NULL);
INSERT INTO public.star VALUES (4, 'some red star', 'i dunno, red', NULL, 2, NULL);
INSERT INTO public.star VALUES (5, 'sone white dwarf', 'unknown', NULL, 3, NULL);
INSERT INTO public.star VALUES (6, 'sone other yello star', 'unknown', NULL, 4, NULL);


--
-- Data for Name: would_visit; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.would_visit VALUES (1, true, NULL, 1, 1);
INSERT INTO public.would_visit VALUES (4, true, NULL, 2, 2);
INSERT INTO public.would_visit VALUES (2, false, NULL, 3, 3);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 3, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: would_visit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.would_visit_id_seq', 3, true);


--
-- Name: would_visit_visitor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.would_visit_visitor_id_seq', 3, true);


--
-- Name: moon constraint_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT constraint_name UNIQUE (moon_id);


--
-- Name: galaxy galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_key UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: would_visit would_visit_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.would_visit
    ADD CONSTRAINT would_visit_pkey PRIMARY KEY (would_visit_id);


--
-- Name: would_visit would_visit_visitor_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.would_visit
    ADD CONSTRAINT would_visit_visitor_id_key UNIQUE (visitor_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: would_visit would_visit_galaxy_nid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.would_visit
    ADD CONSTRAINT would_visit_galaxy_nid_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


