--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

-- Started on 2024-12-22 14:44:11 UTC

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
-- TOC entry 3421 (class 0 OID 0)
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
-- TOC entry 3422 (class 0 OID 0)
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
-- TOC entry 3423 (class 0 OID 0)
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
-- TOC entry 3424 (class 0 OID 0)
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
    way_to_cook text NOT NULL,
    description text DEFAULT 'описание'::text NOT NULL
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
-- TOC entry 3425 (class 0 OID 0)
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
-- TOC entry 3426 (class 0 OID 0)
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
-- TOC entry 3241 (class 2604 OID 16424)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3404 (class 0 OID 16385)
-- Dependencies: 217
-- Data for Name: favorite; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.favorite (id, user_id, recipe_id) VALUES (1, 1, 2);
INSERT INTO public.favorite (id, user_id, recipe_id) VALUES (2, 2, 2);
INSERT INTO public.favorite (id, user_id, recipe_id) VALUES (4, 2, 10);


--
-- TOC entry 3406 (class 0 OID 16389)
-- Dependencies: 219
-- Data for Name: identifiers; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.identifiers (id, user_id, identifier) VALUES (1, 1, '05d53a23057a1aa7d634b1092ca3928e88ebde19ee50b85776fc49d8a5e59d48');
INSERT INTO public.identifiers (id, user_id, identifier) VALUES (2, 2, 'd6de11e4f2fc571c47d37cb0b86e5085117ac680f64cce18a8ed7d88ac3991b1');
INSERT INTO public.identifiers (id, user_id, identifier) VALUES (3, 3, '9cc3f155195176659d244ae9bad92ca8152b52cfea1dc7ce72b61eb43691143f');
INSERT INTO public.identifiers (id, user_id, identifier) VALUES (4, 4, '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e');
INSERT INTO public.identifiers (id, user_id, identifier) VALUES (5, 5, '3cc849279ba298b587a34cabaeffc5ecb3a044bbf97c516fab7ede9d1af77cfa');
INSERT INTO public.identifiers (id, user_id, identifier) VALUES (6, 6, 'a0ec06301bf1814970a70f89d1d373afdff9a36d1ba6675fc02f8a975f4efaeb');
INSERT INTO public.identifiers (id, user_id, identifier) VALUES (7, 7, '5fd924625f6ab16a19cc9807c7c506ae1813490e4ba675f843d5a10e0baacdb8');


--
-- TOC entry 3408 (class 0 OID 16395)
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
-- TOC entry 3409 (class 0 OID 16400)
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
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (17, 4, 12, '1/2', 'кг');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (18, 5, 12, '250', 'грамм');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (19, 6, 12, '1', 'чайная ложка');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (20, 2, 13, '8', 'шт');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (21, 3, 13, '100', 'грамм');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (22, 2, 14, '8', 'шт');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (23, 3, 14, '100', 'грамм');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (24, 2, 15, '8', 'шт');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (25, 3, 15, '100', 'грамм');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (26, 2, 16, '8', 'шт');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (27, 3, 16, '100', 'грамм');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (28, 2, 17, '8', 'шт');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (29, 3, 17, '100', 'грамм');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (30, 2, 18, '8', 'шт');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (31, 3, 18, '100', 'грамм');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (32, 2, 19, '8', 'шт');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (33, 3, 19, '100', 'грамм');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (34, 2, 20, '8', 'шт');
INSERT INTO public.ingredients_for_recipes (id, ingredient_id, recipe_id, quantity, unit) VALUES (35, 3, 20, '100', 'грамм');


--
-- TOC entry 3412 (class 0 OID 16407)
-- Dependencies: 225
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.recipes (id, name, way_to_cook, description) VALUES (2, 'Луковый угар', 'зажаривать лук в течении 15 минут на медленном огне, добавить перец, перемешать.', 'описание');
INSERT INTO public.recipes (id, name, way_to_cook, description) VALUES (10, 'Борщ', 'Зажарить зажарку, сварить мясо, добавить зажарку, добавить капусту, специи и оставить настаиваться', 'описание');
INSERT INTO public.recipes (id, name, way_to_cook, description) VALUES (12, 'Макароны по флотски', 'Зажарить фарш на подсолнечном масле. Отварить макароны в подсолённой воде, слить воду. Добавить макароны к фаршу, перемешать, выключить огонь.Приправы по вкусу', 'описание');
INSERT INTO public.recipes (id, name, way_to_cook, description) VALUES (13, 'Луковый угар', 'зажаривать лук в течении 15 минут на медленном огне, добавить перец, перемешать.', 'описание');
INSERT INTO public.recipes (id, name, way_to_cook, description) VALUES (14, 'Луковый угар', 'зажаривать лук в течении 15 минут на медленном огне, добавить перец, перемешать.', 'описание');
INSERT INTO public.recipes (id, name, way_to_cook, description) VALUES (15, 'Луковый угар', 'зажаривать лук в течении 15 минут на медленном огне, добавить перец, перемешать.', 'описание');
INSERT INTO public.recipes (id, name, way_to_cook, description) VALUES (16, 'Луковый угар', 'зажаривать лук в течении 15 минут на медленном огне, добавить перец, перемешать.', 'описание');
INSERT INTO public.recipes (id, name, way_to_cook, description) VALUES (17, 'Луковый угар', 'зажаривать лук в течении 15 минут на медленном огне, добавить перец, перемешать.', 'описание');
INSERT INTO public.recipes (id, name, way_to_cook, description) VALUES (18, 'Луковый угар', 'зажаривать лук в течении 15 минут на медленном огне, добавить перец, перемешать.', 'описание');
INSERT INTO public.recipes (id, name, way_to_cook, description) VALUES (19, 'Луковый угар', 'зажаривать лук в течении 15 минут на медленном огне, добавить перец, перемешать.', 'описание');
INSERT INTO public.recipes (id, name, way_to_cook, description) VALUES (20, 'Луковый угар', 'зажаривать лук в течении 15 минут на медленном огне, добавить перец, перемешать.', 'описание');


--
-- TOC entry 3414 (class 0 OID 16413)
-- Dependencies: 227
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.users (id, name, passwd, is_admin) VALUES (1, 'root', 'goool', true);
INSERT INTO public.users (id, name, passwd, is_admin) VALUES (2, 'bob_parser', '12345678', false);
INSERT INTO public.users (id, name, passwd, is_admin) VALUES (3, 'eggman', '1234', true);
INSERT INTO public.users (id, name, passwd, is_admin) VALUES (4, '123', '123', false);
INSERT INTO public.users (id, name, passwd, is_admin) VALUES (5, 'qwe', 'qwe', false);
INSERT INTO public.users (id, name, passwd, is_admin) VALUES (6, 'zxc', 'zxc', false);
INSERT INTO public.users (id, name, passwd, is_admin) VALUES (7, 'asd', 'asd', false);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 218
-- Name: favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.favorite_id_seq', 4, true);


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 220
-- Name: identifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.identifiers_id_seq', 7, true);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 223
-- Name: ingredients_for_recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.ingredients_for_recipes_id_seq', 35, true);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 224
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 12, true);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 226
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.recipes_id_seq', 20, true);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 228
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- TOC entry 3243 (class 2606 OID 16426)
-- Name: favorite favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_pkey PRIMARY KEY (id);


--
-- TOC entry 3245 (class 2606 OID 16428)
-- Name: identifiers identifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identifiers
    ADD CONSTRAINT identifiers_pkey PRIMARY KEY (id);


--
-- TOC entry 3249 (class 2606 OID 16430)
-- Name: ingredients_for_recipes ingredients_for_recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ingredients_for_recipes
    ADD CONSTRAINT ingredients_for_recipes_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 16432)
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- TOC entry 3251 (class 2606 OID 16434)
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 16436)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 16437)
-- Name: ingredients_for_recipes ingredients_connect; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ingredients_for_recipes
    ADD CONSTRAINT ingredients_connect FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id);


--
-- TOC entry 3254 (class 2606 OID 16442)
-- Name: favorite recipe_connect; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT recipe_connect FOREIGN KEY (recipe_id) REFERENCES public.recipes(id);


--
-- TOC entry 3258 (class 2606 OID 16447)
-- Name: ingredients_for_recipes recipes_connect; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ingredients_for_recipes
    ADD CONSTRAINT recipes_connect FOREIGN KEY (recipe_id) REFERENCES public.recipes(id);


--
-- TOC entry 3255 (class 2606 OID 16452)
-- Name: favorite user_connect; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT user_connect FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3256 (class 2606 OID 16457)
-- Name: identifiers users_connect; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identifiers
    ADD CONSTRAINT users_connect FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2024-12-22 14:44:11 UTC

--
-- PostgreSQL database dump complete
--

