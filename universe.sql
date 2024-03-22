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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    galaxy_type character varying NOT NULL,
    distance_from_earth numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying NOT NULL,
    description character varying(120)
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


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
    name character varying NOT NULL,
    description text,
    planet_type character varying NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth numeric NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying NOT NULL,
    type_color character varying(120)
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL,
    galaxy_id integer,
    size integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'The nearest spiral galaxy to the Milky Way', 'Spiral', NULL);
INSERT INTO public.galaxy VALUES (2, 'Messier 87', 'A supergiant elliptical galaxy in the constellation Virgo', 'Elliptical', NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'A spiral galaxy approximately 3 million light-years from Earth', 'Spiral', NULL);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel Galaxy', 'A lenticular galaxy about 500 million light-years away', 'Irregular', NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'A spiral galaxy in the constellation Virgo', 'Spiral', NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'A spiral galaxy in the constellation Canes Venatici', 'Spiral', NULL);
INSERT INTO public.galaxy VALUES (7, 'Andromeda', 'The nearest spiral galaxy to the Milky Way', 'Spiral', NULL);
INSERT INTO public.galaxy VALUES (8, 'Messier 87', 'A supergiant elliptical galaxy in the constellation Virgo', 'Elliptical', NULL);
INSERT INTO public.galaxy VALUES (9, 'Triangulum', 'A small spiral galaxy in the constellation Triangulum', 'Spiral', NULL);
INSERT INTO public.galaxy VALUES (10, 'Centaurus A', 'A peculiar galaxy in the constellation Centaurus', 'Elliptical', NULL);
INSERT INTO public.galaxy VALUES (11, 'Whirlpool Galaxy', 'A classic spiral galaxy located in the constellation Canes Venatici', 'Spiral', NULL);
INSERT INTO public.galaxy VALUES (12, 'Sombrero Galaxy', 'An unbarred spiral galaxy in the constellation Virgo', 'Spiral', NULL);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', NULL);
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', NULL);
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (39, 'Moon1', 'Moon1 description', true, 1, 1);
INSERT INTO public.moon VALUES (40, 'Moon2', 'Moon2 description', true, 2, 2);
INSERT INTO public.moon VALUES (41, 'Moon3', 'Moon3 description', true, 3, 3);
INSERT INTO public.moon VALUES (42, 'Moon4', 'Moon4 description', true, 4, 4);
INSERT INTO public.moon VALUES (43, 'Moon5', 'Moon5 description', true, 5, 5);
INSERT INTO public.moon VALUES (44, 'Moon6', 'Moon6 description', true, 6, 6);
INSERT INTO public.moon VALUES (45, 'Moon7', 'Moon7 description', true, 7, 7);
INSERT INTO public.moon VALUES (46, 'Moon8', 'Moon8 description', true, 8, 8);
INSERT INTO public.moon VALUES (47, 'Moon9', 'Moon9 description', true, 9, 9);
INSERT INTO public.moon VALUES (48, 'Moon10', 'Moon10 description', true, 10, 10);
INSERT INTO public.moon VALUES (49, 'Moon11', 'Moon11 description', true, 11, 11);
INSERT INTO public.moon VALUES (50, 'Moon12', 'Moon12 description', true, 12, 12);
INSERT INTO public.moon VALUES (51, 'Moon13', 'Moon13 description', true, 13, 13);
INSERT INTO public.moon VALUES (52, 'Moon14', 'Moon14 description', true, 14, 14);
INSERT INTO public.moon VALUES (53, 'Moon15', 'Moon15 description', true, 15, 15);
INSERT INTO public.moon VALUES (54, 'Moon16', 'Moon16 description', true, 16, 16);
INSERT INTO public.moon VALUES (55, 'Moon17', 'Moon17 description', true, 17, 17);
INSERT INTO public.moon VALUES (56, 'Moon18', 'Moon18 description', true, 18, 18);
INSERT INTO public.moon VALUES (57, 'Moon19', 'Moon19 description', true, 19, 19);
INSERT INTO public.moon VALUES (58, 'Moon20', 'Moon20 description', true, 20, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest and innermost planet in the Solar System', 'Terrestrial', false, 77.3, 2);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet from the Sun, named after the Roman goddess of love and beauty', 'Terrestrial', false, 38.2, 2);
INSERT INTO public.planet VALUES (3, 'Mars', 'The fourth planet from the Sun and the second-smallest planet in the Solar System', 'Terrestrial', false, 54.6, 2);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'The largest planet in the Solar System', 'Gas Giant', false, 588.0, 3);
INSERT INTO public.planet VALUES (5, 'Saturn', 'The sixth planet from the Sun and the second-largest in the Solar System', 'Gas Giant', false, 1, 3);
INSERT INTO public.planet VALUES (6, 'Uranus', 'The seventh planet from the Sun', 'Ice Giant', false, 1, 4);
INSERT INTO public.planet VALUES (7, 'Neptune', 'The eighth and farthest known planet from the Sun in the Solar System', 'Ice Giant', false, 1, 4);
INSERT INTO public.planet VALUES (8, 'Pluto', 'A dwarf planet in the Kuiper belt', 'Dwarf Planet', false, 1, 5);
INSERT INTO public.planet VALUES (9, 'Eris', 'A dwarf planet in the scattered disc', 'Dwarf Planet', false, 1, 6);
INSERT INTO public.planet VALUES (10, 'Haumea', 'A dwarf planet located beyond Neptune''s orbit', 'Dwarf Planet', false, 1, 6);
INSERT INTO public.planet VALUES (11, 'Makemake', 'A dwarf planet and perhaps the second-brightest object in the Kuiper belt', 'Dwarf Planet', false, 1, 6);
INSERT INTO public.planet VALUES (12, 'Ceres', 'The largest object in the asteroid belt', 'Dwarf Planet', false, 1, 6);
INSERT INTO public.planet VALUES (13, 'Jupiter', 'The largest planet in the Solar System', 'Gas Giant', false, 365.7, 1);
INSERT INTO public.planet VALUES (14, 'Saturn', 'The sixth planet from the Sun and the second-largest in the Solar System', 'Gas Giant', false, 746.2, 1);
INSERT INTO public.planet VALUES (15, 'Mars', 'The fourth planet from the Sun and the second-smallest in the Solar System', 'Terrestrial', false, 227.9, 1);
INSERT INTO public.planet VALUES (16, 'Uranus', 'The seventh planet from the Sun', 'Ice Giant', false, 1591.6, 1);
INSERT INTO public.planet VALUES (17, 'Neptune', 'The eighth and farthest known Solar planet from the Sun', 'Ice Giant', false, 2798.6, 1);
INSERT INTO public.planet VALUES (18, 'Mercury', 'The smallest and innermost planet in the Solar System', 'Terrestrial', false, 77.3, 1);
INSERT INTO public.planet VALUES (19, 'Venus', 'The second planet from the Sun', 'Terrestrial', false, 261.1, 1);
INSERT INTO public.planet VALUES (20, 'Pluto', 'A dwarf planet in the Kuiper belt', 'Dwarf Planet', false, 3674.5, 1);
INSERT INTO public.planet VALUES (21, 'Kepler-186f', 'An Earth-sized exoplanet in the habitable zone of its host star', 'Terrestrial', true, 582, 2);
INSERT INTO public.planet VALUES (22, 'HD 189733b', 'A hot Jupiter exoplanet', 'Gas Giant', false, 63, 2);
INSERT INTO public.planet VALUES (23, 'TRAPPIST-1e', 'An exoplanet orbiting within the habitable zone of the ultra-cool dwarf star TRAPPIST-1', 'Terrestrial', true, 40, 2);
INSERT INTO public.planet VALUES (24, 'Gliese 581c', 'An extrasolar planet orbiting the red dwarf star Gliese 581', 'Terrestrial', true, 120, 2);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', NULL);
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', NULL);
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', NULL);
INSERT INTO public.planet_types VALUES (4, 'Dwarf Planet', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 'A red supergiant star in the constellation Orion', 8000, false, 1, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky', 200, true, 1, NULL);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'A red dwarf star closest to the Sun', 6000, true, 2, NULL);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'A star in the Alpha Centauri star system', 5000, true, 2, NULL);
INSERT INTO public.star VALUES (5, 'Vega', 'The brightest star in the constellation Lyra', 450, true, 3, NULL);
INSERT INTO public.star VALUES (6, 'Deneb', 'A blue-white supergiant star in the constellation Cygnus', 8000, false, 3, NULL);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 'A red supergiant star in the constellation Orion', 1000000, false, 1, NULL);
INSERT INTO public.star VALUES (8, 'Sirius', 'The brightest star in the night sky', 250, true, 1, NULL);
INSERT INTO public.star VALUES (9, 'Alpha Centauri B', 'A member of the triple star system Alpha Centauri', 6000, true, 2, NULL);
INSERT INTO public.star VALUES (10, 'Vega', 'The brightest star in the constellation Lyra', 455, true, 1, NULL);
INSERT INTO public.star VALUES (11, 'Polaris', 'The North Star, located in the constellation Ursa Minor', 46, true, 1, NULL);
INSERT INTO public.star VALUES (12, 'Antares', 'A red supergiant star in the constellation Scorpius', 12000, false, 1, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 58, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: planet unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_id UNIQUE (planet_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: galaxy_types unique_n; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT unique_n UNIQUE (name);


--
-- Name: planet_types unique_na; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT unique_na UNIQUE (name);


--
-- Name: moon unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

