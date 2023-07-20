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
\ connect universe
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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer
);
ALTER TABLE public.comet OWNER TO freecodecamp;
--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;
--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;
--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_ly integer,
    galaxy_type character varying(10) NOT NULL,
    has_planet boolean,
    discovered character varying(30),
    age_years_in_billions numeric(4, 2)
);
ALTER TABLE public.galaxy OWNER TO freecodecamp;
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;
--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_planet_km integer,
    revolution_period_earth_days numeric,
    planet_id integer
);
ALTER TABLE public.moon OWNER TO freecodecamp;
--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;
--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;
--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_type character varying(20),
    has_life boolean,
    galaxy_id integer,
    star_id integer
);
ALTER TABLE public.planet OWNER TO freecodecamp;
--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;
--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;
--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth character varying(30),
    galaxy_id integer
);
ALTER TABLE public.star OWNER TO freecodecamp;
--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;
--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;
--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
ALTER COLUMN comet_id
SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);
--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
ALTER COLUMN galaxy_id
SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);
--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
ALTER COLUMN moon_id
SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);
--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
ALTER COLUMN planet_id
SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);
--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
ALTER COLUMN star_id
SET DEFAULT nextval('public.star_star_id_seq'::regclass);
--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet
VALUES (1, 'C/2022 E3', 1);
INSERT INTO public.comet
VALUES (2, 'Neowise', 1);
INSERT INTO public.comet
VALUES (3, 'Halleys Comet', 1);
--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy
VALUES (
        1,
        'Milky Way',
        105700,
        'spiral',
        true,
        '14 billion years ago',
        13.61
    );
INSERT INTO public.galaxy
VALUES (
        2,
        'Andromeda',
        220000,
        'spiral',
        true,
        '964 CE',
        10.01
    );
INSERT INTO public.galaxy
VALUES (
        3,
        'Sombrero Galaxy',
        50000,
        'spiral',
        true,
        '1781',
        13.25
    );
INSERT INTO public.galaxy
VALUES (
        4,
        'Pinwheel Galaxy',
        170000,
        'spiral',
        false,
        '1781',
        10.00
    );
INSERT INTO public.galaxy
VALUES (
        5,
        'Hoags Object',
        121000,
        'ring',
        false,
        '1950',
        12.75
    );
INSERT INTO public.galaxy
VALUES (
        6,
        'Cigar Galaxy',
        37000,
        'starburst',
        false,
        '1774',
        13.30
    );
--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon
VALUES (1, 'Moon', 384400, 27.322, 10);
INSERT INTO public.moon
VALUES (2, 'Phobos', 9377, 0.31883, 11);
INSERT INTO public.moon
VALUES (3, 'Deimos', 23460, 1.26229, 11);
INSERT INTO public.moon
VALUES (4, 'Io', 421700, 1.769, 12);
INSERT INTO public.moon
VALUES (5, 'Europa', 671000, 3.551, 12);
INSERT INTO public.moon
VALUES (6, 'Ganymede', 1070400, 7.155, 12);
INSERT INTO public.moon
VALUES (7, 'Callisto', 1882700, 16.709, 12);
INSERT INTO public.moon
VALUES (8, 'Titan', 1221850, 15.945, 13);
INSERT INTO public.moon
VALUES (9, 'Rhea', 527040, 4.523, 13);
INSERT INTO public.moon
VALUES (10, 'Lapetus', 3561000, 79.33, 13);
INSERT INTO public.moon
VALUES (11, 'Miranda', 129500, 1.413, 14);
INSERT INTO public.moon
VALUES (12, 'Ariel', 191000, 2.528, 14);
INSERT INTO public.moon
VALUES (13, 'Titania', 436000, 8.706, 14);
INSERT INTO public.moon
VALUES (14, 'Oberon', 583000, 13.463, 14);
INSERT INTO public.moon
VALUES (15, 'Triton', 354750, 5.877, 15);
INSERT INTO public.moon
VALUES (16, 'Kepler-16b I', 36800, 228, 16);
INSERT INTO public.moon
VALUES (17, 'Kepler-16b II', 20000, 16, 16);
INSERT INTO public.moon
VALUES (18, 'HD 106906 b I', 48000, 38, 17);
INSERT INTO public.moon
VALUES (19, 'HD 106906 b II', 24000, 21, 17);
INSERT INTO public.moon
VALUES (20, 'CoRoT-7b I', 16000, 2.4, 18);
--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet
VALUES (8, 'Mercury', 'terrestrial', false, 1, 3);
INSERT INTO public.planet
VALUES (9, 'Venus', 'terrestrial', false, 1, 3);
INSERT INTO public.planet
VALUES (10, 'Earth', 'terrestrial', true, 1, 3);
INSERT INTO public.planet
VALUES (11, 'Mars', 'terrestrial', false, 1, 3);
INSERT INTO public.planet
VALUES (12, 'Jupiter', 'Gas Giant', false, 1, 3);
INSERT INTO public.planet
VALUES (13, 'Saturn', 'Gas Giant', false, 1, 3);
INSERT INTO public.planet
VALUES (14, 'Uranus', 'Ice Giant', false, 1, 3);
INSERT INTO public.planet
VALUES (15, 'Neptune', 'Ice Giant', false, 1, 3);
INSERT INTO public.planet
VALUES (16, 'Kepler-16b', 'Gas Giant', NULL, 1, 9);
INSERT INTO public.planet
VALUES (17, 'HD 106906 b', 'Gas Giant', NULL, 1, 9);
INSERT INTO public.planet
VALUES (18, 'CoRot-7b', 'Gas Giant', NULL, 1, 9);
INSERT INTO public.planet
VALUES (19, 'HIP 51589 c', 'Gas Giant', NULL, 2, 10);
INSERT INTO public.planet
VALUES (20, '2M1207 b', 'Brown dwarf', NULL, 2, 10);
INSERT INTO public.planet
VALUES (
        21,
        'MOA-2007-BLG-192 lb',
        'Super-Earth',
        NULL,
        2,
        10
    );
INSERT INTO public.planet
VALUES (
        22,
        'PA-99-N2',
        'Jupiter-mass-plaet',
        NULL,
        2,
        10
    );
INSERT INTO public.planet
VALUES (
        23,
        'OGLE-2005-BLG-390 lb',
        'Super-Earth',
        NULL,
        2,
        10
    );
INSERT INTO public.planet
VALUES (24, 'PSOJ318.5-22', 'Gas Giant', NULL, 2, 10);
--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star
VALUES (
        2,
        'Polaris',
        'Yellow Dwarf star, very close to northpole of the sky, constellation Ursa Minor',
        '433 light-years',
        1
    );
INSERT INTO public.star
VALUES (
        3,
        'Sun',
        'yellow dwarf star, center of solar system',
        '93 million miles',
        1
    );
INSERT INTO public.star
VALUES (
        4,
        'Alpheratz',
        'binary star system',
        '97 light-years',
        2
    );
INSERT INTO public.star
VALUES (
        5,
        'Mirach',
        'red giant star, variable star(brightness changes over time)',
        '200 light-years',
        2
    );
INSERT INTO public.star
VALUES (
        6,
        'Almach',
        'tripple star system',
        '350 light-years',
        2
    );
INSERT INTO public.star
VALUES (
        7,
        'SAO 20572',
        'white dwarf star, constellation Ursa Major',
        '400 light-years',
        3
    );
INSERT INTO public.star
VALUES (
        8,
        'Pi1 Ursae Majoris',
        'binary star system, main star(blue-white, companion(red dwarf)',
        '280 light-years',
        4
    );
INSERT INTO public.star
VALUES (
        1,
        'Sirius',
        'binary star system, constellation Canis Major',
        '8.6 light-years',
        1
    );
INSERT INTO public.star
VALUES (9, 'unknown', NULL, NULL, 1);
INSERT INTO public.star
VALUES (10, 'unknown II', NULL, NULL, 2);
--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);
--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);
--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);
--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);
--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
ADD CONSTRAINT comet_name_key UNIQUE (name);
--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);
--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
ADD CONSTRAINT galaxy_name_key UNIQUE (name);
--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);
--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
ADD CONSTRAINT moon_name_key UNIQUE (name);
--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);
--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
ADD CONSTRAINT planet_name_key UNIQUE (name);
--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);
--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
ADD CONSTRAINT star_name_key UNIQUE (name);
--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);
--
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);
--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);
--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);
--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);
--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);
--
-- PostgreSQL database dump complete
--