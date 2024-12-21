--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

-- Started on 2024-12-21 15:57:43 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 217 (class 1259 OID 16385)
-- Name: favorite; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.favorite (
    id integer NOT NULL,
    user_id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.favorite OWNER TO root;

--
-- TOC entry 218 (class 1259 OID 16388)
-- Name: favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.favorite_id_seq OWNER TO root;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 218
-- Name: favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.favorite_id_seq OWNED BY public.favorite.id;


--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: identifiers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.identifiers (
    id integer NOT NULL,
    user_id integer NOT NULL,
    identifier text NOT NULL
);


ALTER TABLE public.identifiers OWNER TO root;

--
-- TOC entry 220 (class 1259 OID 16394)
-- Name: identifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.identifiers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.identifiers_id_seq OWNER TO root;

--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 220
-- Name: identifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.identifiers_id_seq OWNED BY public.identifiers.id;


--
-- TOC entry 221 (class 1259 OID 16395)
-- Name: ingredients; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.ingredients (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.ingredients OWNER TO root;

--
-- TOC entry 222 (class 1259 OID 16400)
-- Name: ingredients_for_recipes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.ingredients_for_recipes (
    id integer NOT NULL,
    ingredient_id integer,
    recipe_id integer,
    quantity text NOT NULL,
    unit text NOT NULL
);


ALTER TABLE public.ingredients_for_recipes OWNER TO root;

--
-- TOC entry 223 (class 1259 OID 16405)
-- Name: ingredients_for_recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.ingredients_for_recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ingredients_for_recipes_id_seq OWNER TO root;

--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 223
-- Name: ingredients_for_recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.ingredients_for_recipes_id_seq OWNED BY public.ingredients_for_recipes.id;


--
-- TOC entry 224 (class 1259 OID 16406)
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ingredients_id_seq OWNER TO root;

--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 224
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;


--
-- TOC entry 225 (class 1259 OID 16407)
-- Name: recipes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.recipes (
    id integer NOT NULL,
    name text NOT NULL,
    way_to_cook text NOT NULL
);


ALTER TABLE public.recipes OWNER TO root;

--
-- TOC entry 226 (class 1259 OID 16412)
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recipes_id_seq OWNER TO root;

--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 226
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;


--
-- TOC entry 227 (class 1259 OID 16413)
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    passwd text NOT NULL,
    is_admin boolean NOT NULL
);


ALTER TABLE public.users OWNER TO root;

--
-- TOC entry 228 (class 1259 OID 16418)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO root;

--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 228
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3235 (class 2604 OID 16419)
-- Name: favorite id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.favorite ALTER COLUMN id SET DEFAULT nextval('public.favorite_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 16420)
-- Name: identifiers id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identifiers ALTER COLUMN id SET DEFAULT nextval('public.identifiers_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 16421)
-- Name: ingredients id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 16422)
-- Name: ingredients_for_recipes id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ingredients_for_recipes ALTER COLUMN id SET DEFAULT nextval('public.ingredients_for_recipes_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 16423)
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 16424)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3403 (class 0 OID 16385)
-- Dependencies: 217
-- Data for Name: favorite; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.favorite (id, user_id, recipe_id) VALUES (1, 1, 2);
INSERT INTO public.favorite (id, user_id, recipe_id) VALUES (2, 2, 2);
INSERT INTO public.favorite (id, user_id, recipe_id) VALUES (4, 2, 10);


--
-- TOC entry 3405 (class 0 OID 16389)
-- Dependencies: 219
-- Data for Name: identifiers; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.identifiers (id, user_id, identifier) VALUES (1, 1, '05d53a23057a1aa7d634b1092ca3928e88ebde19ee50b85776fc49d8a5e59d48');
INSERT INTO public.identifiers (id, user_id, identifier) VALUES (2, 2, 'd6de11e4f2fc571c47d37cb0b86e5085117ac680f64cce18a8ed7d88ac3991b1');
INSERT INTO public.identifiers (id, user_id, identifier) VALUES (3, 3, '9cc3f155195176659d244ae9bad92ca8152b52cfea1dc7ce72b61eb43691143f');


--
-- TOC entry 3407 (class 0 OID 16395)
-- Dependencies: 221
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.ingredients (id, name) VALUES (2, 'лук');
INSERT INTO public.ingredients (id, name) VALUES (3, 'перец чёрный');
INSERT INTO public.ingredients (id, name) VALUES (4, 'макароны');
INSERT INTO public.ingredients (id, name) VALUES (5, 'говяжий фарш');
INSERT INTO public.ingredients (id, name) VALUES (6, 'соль');
INSERT INTO public.ingredients (id, name) VALUES (7, 'картофель');
INSERT INTO public.ingredients (id, name) VALUES (8, 'томаты');
INSERT INTO public.ingredients (id, name) VALUES (9, 'капуста');
INSERT INTO public.ingredients (id, name) VALUES (10, 'свекла');
INSERT INTO public.ingredients (id, name) VALUES (11, 'морковь');
INSERT INTO public.ingredients (id, name) VALUES (12, 'свинина');


--
-- TOC entry 3408 (class 0 OID 16400)
-- Dependencies: 222
-- Data for Name: ingredients_for_recipes; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (1, 2, 2, '8', 'шт');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (2, 3, 2, '100', 'грамм');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (6, 7, 10, '6', 'шт');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (7, 8, 10, '2', 'шт');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (8, 6, 10, '1', 'чайная ложка');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (9, 9, 10, '300', 'грамм');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (10, 10, 10, '1', 'шт');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (11, 11, 10, '1', 'шт');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (12, 2, 10, '1', 'шт');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (13, 12, 10, '400', 'грамм');


--
-- TOC entry 3411 (class 0 OID 16407)
-- Dependencies: 225
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.recipes (id, name, way_to_cook) VALUES (2, 'Луковый угар', 'зажаривать лук в течении 15 минут на медленном огне, добавить перец, перемешать.');
INSERT INTO public.recipes (id, name, way_to_cook) VALUES (10, 'Борщ', 'Зажарить зажарку, сварить мясо, добавить зажарку, добавить капусту, специи и оставить настаиваться');


--
-- TOC entry 3413 (class 0 OID 16413)
-- Dependencies: 227
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.users (id, name, passwd, is_admin) VALUES (1, 'root', 'goool', true);
INSERT INTO public.users (id, name, passwd, is_admin) VALUES (2, 'bob_parser', '12345678', false);
INSERT INTO public.users (id, name, passwd, is_admin) VALUES (3, 'eggman', '1234', true);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 218
-- Name: favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.favorite_id_seq', 4, true);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 220
-- Name: identifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.identifiers_id_seq', 3, true);


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 223
-- Name: ingredients_for_recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.ingredients_for_recipes_id_seq', 16, true);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 224
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 12, true);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 226
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.recipes_id_seq', 11, true);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 228
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 3242 (class 2606 OID 16426)
-- Name: favorite favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_pkey PRIMARY KEY (id);


--
-- TOC entry 3244 (class 2606 OID 16428)
-- Name: identifiers identifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identifiers
    ADD CONSTRAINT identifiers_pkey PRIMARY KEY (id);


--
-- TOC entry 3248 (class 2606 OID 16430)
-- Name: ingredients_for_recipes ingredients_for_recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ingredients_for_recipes
    ADD CONSTRAINT ingredients_for_recipes_pkey PRIMARY KEY (id);


--
-- TOC entry 3246 (class 2606 OID 16432)
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- TOC entry 3250 (class 2606 OID 16434)
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- TOC entry 3252 (class 2606 OID 16436)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 16437)
-- Name: ingredients_for_recipes ingredients_connect; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ingredients_for_recipes
    ADD CONSTRAINT ingredients_connect FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id);


--
-- TOC entry 3253 (class 2606 OID 16442)
-- Name: favorite recipe_connect; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT recipe_connect FOREIGN KEY (recipe_id) REFERENCES public.recipes(id);


--
-- TOC entry 3257 (class 2606 OID 16447)
-- Name: ingredients_for_recipes recipes_connect; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ingredients_for_recipes
    ADD CONSTRAINT recipes_connect FOREIGN KEY (recipe_id) REFERENCES public.recipes(id);


--
-- TOC entry 3254 (class 2606 OID 16457)
-- Name: favorite user_connect; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT user_connect FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3255 (class 2606 OID 16462)
-- Name: identifiers users_connect; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identifiers
    ADD CONSTRAINT users_connect FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2024-12-21 15:57:43 UTC

--
-- PostgreSQL database dump complete
--

