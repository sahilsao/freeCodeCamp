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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number_of_tries integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 7);
INSERT INTO public.games VALUES (2, 1, 2);
INSERT INTO public.games VALUES (3, 17, 4);
INSERT INTO public.games VALUES (4, 1, 3);
INSERT INTO public.games VALUES (5, 1, 2);
INSERT INTO public.games VALUES (6, 18, 508);
INSERT INTO public.games VALUES (7, 18, 960);
INSERT INTO public.games VALUES (8, 19, 473);
INSERT INTO public.games VALUES (9, 19, 92);
INSERT INTO public.games VALUES (10, 18, 393);
INSERT INTO public.games VALUES (11, 18, 534);
INSERT INTO public.games VALUES (12, 18, 927);
INSERT INTO public.games VALUES (13, 20, 429);
INSERT INTO public.games VALUES (14, 20, 915);
INSERT INTO public.games VALUES (15, 21, 637);
INSERT INTO public.games VALUES (16, 21, 802);
INSERT INTO public.games VALUES (17, 20, 39);
INSERT INTO public.games VALUES (18, 20, 171);
INSERT INTO public.games VALUES (19, 20, 388);
INSERT INTO public.games VALUES (20, 22, 3);
INSERT INTO public.games VALUES (21, 22, 2);
INSERT INTO public.games VALUES (22, 23, 420);
INSERT INTO public.games VALUES (23, 23, 522);
INSERT INTO public.games VALUES (24, 24, 712);
INSERT INTO public.games VALUES (25, 24, 423);
INSERT INTO public.games VALUES (26, 23, 679);
INSERT INTO public.games VALUES (27, 23, 628);
INSERT INTO public.games VALUES (28, 23, 416);
INSERT INTO public.games VALUES (29, 25, 68);
INSERT INTO public.games VALUES (30, 25, 216);
INSERT INTO public.games VALUES (31, 26, 124);
INSERT INTO public.games VALUES (32, 26, 894);
INSERT INTO public.games VALUES (33, 25, 345);
INSERT INTO public.games VALUES (34, 25, 420);
INSERT INTO public.games VALUES (35, 25, 589);
INSERT INTO public.games VALUES (36, 27, 1);
INSERT INTO public.games VALUES (37, 28, 23);
INSERT INTO public.games VALUES (38, 28, 459);
INSERT INTO public.games VALUES (39, 29, 938);
INSERT INTO public.games VALUES (40, 29, 979);
INSERT INTO public.games VALUES (41, 28, 80);
INSERT INTO public.games VALUES (42, 28, 670);
INSERT INTO public.games VALUES (43, 28, 458);
INSERT INTO public.games VALUES (44, 30, 124);
INSERT INTO public.games VALUES (45, 30, 700);
INSERT INTO public.games VALUES (46, 31, 188);
INSERT INTO public.games VALUES (47, 31, 886);
INSERT INTO public.games VALUES (48, 30, 82);
INSERT INTO public.games VALUES (49, 30, 965);
INSERT INTO public.games VALUES (50, 30, 567);
INSERT INTO public.games VALUES (51, 32, 632);
INSERT INTO public.games VALUES (52, 32, 901);
INSERT INTO public.games VALUES (53, 33, 681);
INSERT INTO public.games VALUES (54, 33, 959);
INSERT INTO public.games VALUES (55, 32, 86);
INSERT INTO public.games VALUES (56, 32, 876);
INSERT INTO public.games VALUES (57, 32, 257);
INSERT INTO public.games VALUES (58, 34, 580);
INSERT INTO public.games VALUES (59, 34, 492);
INSERT INTO public.games VALUES (60, 35, 202);
INSERT INTO public.games VALUES (61, 35, 755);
INSERT INTO public.games VALUES (62, 34, 351);
INSERT INTO public.games VALUES (63, 34, 362);
INSERT INTO public.games VALUES (64, 34, 187);
INSERT INTO public.games VALUES (65, 36, 934);
INSERT INTO public.games VALUES (66, 36, 232);
INSERT INTO public.games VALUES (67, 37, 763);
INSERT INTO public.games VALUES (68, 37, 416);
INSERT INTO public.games VALUES (69, 36, 304);
INSERT INTO public.games VALUES (70, 36, 841);
INSERT INTO public.games VALUES (71, 36, 434);
INSERT INTO public.games VALUES (72, 38, 783);
INSERT INTO public.games VALUES (73, 38, 544);
INSERT INTO public.games VALUES (74, 39, 747);
INSERT INTO public.games VALUES (75, 39, 831);
INSERT INTO public.games VALUES (76, 38, 524);
INSERT INTO public.games VALUES (77, 38, 446);
INSERT INTO public.games VALUES (78, 38, 794);
INSERT INTO public.games VALUES (79, 40, 913);
INSERT INTO public.games VALUES (80, 40, 6);
INSERT INTO public.games VALUES (81, 41, 870);
INSERT INTO public.games VALUES (82, 41, 390);
INSERT INTO public.games VALUES (83, 40, 667);
INSERT INTO public.games VALUES (84, 40, 436);
INSERT INTO public.games VALUES (85, 40, 958);
INSERT INTO public.games VALUES (86, 42, 351);
INSERT INTO public.games VALUES (87, 42, 776);
INSERT INTO public.games VALUES (88, 43, 401);
INSERT INTO public.games VALUES (89, 43, 275);
INSERT INTO public.games VALUES (90, 42, 877);
INSERT INTO public.games VALUES (91, 42, 905);
INSERT INTO public.games VALUES (92, 42, 882);
INSERT INTO public.games VALUES (93, 44, 694);
INSERT INTO public.games VALUES (94, 44, 553);
INSERT INTO public.games VALUES (95, 45, 789);
INSERT INTO public.games VALUES (96, 45, 982);
INSERT INTO public.games VALUES (97, 44, 969);
INSERT INTO public.games VALUES (98, 44, 473);
INSERT INTO public.games VALUES (99, 44, 712);
INSERT INTO public.games VALUES (100, 46, 380);
INSERT INTO public.games VALUES (101, 46, 34);
INSERT INTO public.games VALUES (102, 47, 874);
INSERT INTO public.games VALUES (103, 47, 714);
INSERT INTO public.games VALUES (104, 46, 713);
INSERT INTO public.games VALUES (105, 46, 379);
INSERT INTO public.games VALUES (106, 46, 420);
INSERT INTO public.games VALUES (107, 48, 106);
INSERT INTO public.games VALUES (108, 48, 597);
INSERT INTO public.games VALUES (109, 49, 758);
INSERT INTO public.games VALUES (110, 49, 888);
INSERT INTO public.games VALUES (111, 48, 728);
INSERT INTO public.games VALUES (112, 48, 274);
INSERT INTO public.games VALUES (113, 48, 20);
INSERT INTO public.games VALUES (114, 50, 291);
INSERT INTO public.games VALUES (115, 50, 799);
INSERT INTO public.games VALUES (116, 51, 170);
INSERT INTO public.games VALUES (117, 51, 352);
INSERT INTO public.games VALUES (118, 50, 994);
INSERT INTO public.games VALUES (119, 50, 389);
INSERT INTO public.games VALUES (120, 50, 582);
INSERT INTO public.games VALUES (121, 52, 531);
INSERT INTO public.games VALUES (122, 52, 325);
INSERT INTO public.games VALUES (123, 53, 301);
INSERT INTO public.games VALUES (124, 53, 192);
INSERT INTO public.games VALUES (125, 52, 729);
INSERT INTO public.games VALUES (126, 52, 924);
INSERT INTO public.games VALUES (127, 52, 218);
INSERT INTO public.games VALUES (128, 54, 201);
INSERT INTO public.games VALUES (129, 54, 579);
INSERT INTO public.games VALUES (130, 55, 542);
INSERT INTO public.games VALUES (131, 55, 224);
INSERT INTO public.games VALUES (132, 54, 184);
INSERT INTO public.games VALUES (133, 54, 97);
INSERT INTO public.games VALUES (134, 54, 363);
INSERT INTO public.games VALUES (135, 56, 53);
INSERT INTO public.games VALUES (136, 56, 615);
INSERT INTO public.games VALUES (137, 57, 39);
INSERT INTO public.games VALUES (138, 57, 825);
INSERT INTO public.games VALUES (139, 56, 312);
INSERT INTO public.games VALUES (140, 56, 431);
INSERT INTO public.games VALUES (141, 56, 202);
INSERT INTO public.games VALUES (142, 58, 150);
INSERT INTO public.games VALUES (143, 58, 857);
INSERT INTO public.games VALUES (144, 59, 919);
INSERT INTO public.games VALUES (145, 59, 526);
INSERT INTO public.games VALUES (146, 58, 403);
INSERT INTO public.games VALUES (147, 58, 943);
INSERT INTO public.games VALUES (148, 58, 102);
INSERT INTO public.games VALUES (149, 60, 618);
INSERT INTO public.games VALUES (150, 60, 745);
INSERT INTO public.games VALUES (151, 61, 638);
INSERT INTO public.games VALUES (152, 61, 777);
INSERT INTO public.games VALUES (153, 60, 763);
INSERT INTO public.games VALUES (154, 60, 608);
INSERT INTO public.games VALUES (155, 60, 326);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Khum');
INSERT INTO public.users VALUES (2, 'user_1670669247185');
INSERT INTO public.users VALUES (3, 'user_1670669247184');
INSERT INTO public.users VALUES (4, 'Lannie');
INSERT INTO public.users VALUES (5, 'Wise');
INSERT INTO public.users VALUES (6, 'user_1670670059667');
INSERT INTO public.users VALUES (7, 'user_1670670059666');
INSERT INTO public.users VALUES (8, 'Ongie');
INSERT INTO public.users VALUES (9, 'Matric');
INSERT INTO public.users VALUES (10, 'user_1670672124574');
INSERT INTO public.users VALUES (11, 'user_1670672124573');
INSERT INTO public.users VALUES (12, 'user_1670672174892');
INSERT INTO public.users VALUES (13, 'user_1670672174891');
INSERT INTO public.users VALUES (14, 'user_1670672236492');
INSERT INTO public.users VALUES (15, 'user_1670672236491');
INSERT INTO public.users VALUES (16, 'Nunu');
INSERT INTO public.users VALUES (17, 'Sibongokuhle');
INSERT INTO public.users VALUES (18, 'user_1670674391105');
INSERT INTO public.users VALUES (19, 'user_1670674391104');
INSERT INTO public.users VALUES (20, 'user_1670674487621');
INSERT INTO public.users VALUES (21, 'user_1670674487620');
INSERT INTO public.users VALUES (22, 'Lan');
INSERT INTO public.users VALUES (23, 'user_1670674581744');
INSERT INTO public.users VALUES (24, 'user_1670674581743');
INSERT INTO public.users VALUES (25, 'user_1670674602795');
INSERT INTO public.users VALUES (26, 'user_1670674602794');
INSERT INTO public.users VALUES (27, 'kay');
INSERT INTO public.users VALUES (28, 'user_1670674673558');
INSERT INTO public.users VALUES (29, 'user_1670674673557');
INSERT INTO public.users VALUES (30, 'user_1670674725027');
INSERT INTO public.users VALUES (31, 'user_1670674725026');
INSERT INTO public.users VALUES (32, 'user_1670674875613');
INSERT INTO public.users VALUES (33, 'user_1670674875612');
INSERT INTO public.users VALUES (34, 'user_1670674908296');
INSERT INTO public.users VALUES (35, 'user_1670674908295');
INSERT INTO public.users VALUES (36, 'user_1670674962799');
INSERT INTO public.users VALUES (37, 'user_1670674962798');
INSERT INTO public.users VALUES (38, 'user_1670674982227');
INSERT INTO public.users VALUES (39, 'user_1670674982226');
INSERT INTO public.users VALUES (40, 'user_1670675007274');
INSERT INTO public.users VALUES (41, 'user_1670675007273');
INSERT INTO public.users VALUES (42, 'user_1670675023097');
INSERT INTO public.users VALUES (43, 'user_1670675023096');
INSERT INTO public.users VALUES (44, 'user_1670675031065');
INSERT INTO public.users VALUES (45, 'user_1670675031064');
INSERT INTO public.users VALUES (46, 'user_1670675053200');
INSERT INTO public.users VALUES (47, 'user_1670675053199');
INSERT INTO public.users VALUES (48, 'user_1670675102785');
INSERT INTO public.users VALUES (49, 'user_1670675102784');
INSERT INTO public.users VALUES (50, 'user_1670675144635');
INSERT INTO public.users VALUES (51, 'user_1670675144634');
INSERT INTO public.users VALUES (52, 'user_1670675168495');
INSERT INTO public.users VALUES (53, 'user_1670675168494');
INSERT INTO public.users VALUES (54, 'user_1670675307955');
INSERT INTO public.users VALUES (55, 'user_1670675307954');
INSERT INTO public.users VALUES (56, 'user_1670675337752');
INSERT INTO public.users VALUES (57, 'user_1670675337751');
INSERT INTO public.users VALUES (58, 'user_1670675341155');
INSERT INTO public.users VALUES (59, 'user_1670675341154');
INSERT INTO public.users VALUES (60, 'user_1670675362337');
INSERT INTO public.users VALUES (61, 'user_1670675362336');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 155, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 61, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--