--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

-- Started on 2017-05-20 13:04:34 EEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE restaurant;
--
-- TOC entry 3178 (class 1262 OID 16505)
-- Name: restaurant; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE restaurant WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'ru_RU.utf8' LC_CTYPE = 'ru_RU.utf8';


ALTER DATABASE restaurant OWNER TO postgres;

\connect restaurant

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 13338)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 16506)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(255),
    role_id integer
);


ALTER TABLE categories OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16509)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO postgres;

--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 182
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- TOC entry 183 (class 1259 OID 16511)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE clients (
    id integer NOT NULL,
    address_delivery character varying(255),
    date_of_registration timestamp without time zone,
    email character varying(255),
    fio character varying(255),
    login character varying(255),
    password character varying(255),
    phone_clients character varying(255),
    role_id integer
);


ALTER TABLE clients OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16517)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clients_id_seq OWNER TO postgres;

--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 184
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clients_id_seq OWNED BY clients.id;


--
-- TOC entry 185 (class 1259 OID 16519)
-- Name: dishes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dishes (
    id integer NOT NULL,
    composition character varying(255),
    img character varying(255),
    name character varying(255),
    weight double precision,
    category_id integer,
    price bigint
);


ALTER TABLE dishes OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16525)
-- Name: dishes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dishes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dishes_id_seq OWNER TO postgres;

--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 186
-- Name: dishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dishes_id_seq OWNED BY dishes.id;


--
-- TOC entry 187 (class 1259 OID 16527)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16529)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE orders (
    id integer NOT NULL,
    date_order timestamp without time zone,
    paymentmethod_id integer,
    statusorders integer,
    order_for_client bigint,
    sum bigint,
    amount_dishes integer,
    numberbill integer,
    staff_id bigint,
    status_pay_order integer
);


ALTER TABLE orders OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16532)
-- Name: orders_dishes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE orders_dishes (
    orders_id integer NOT NULL,
    dishes_id integer NOT NULL
);


ALTER TABLE orders_dishes OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16535)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO postgres;

--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 190
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- TOC entry 191 (class 1259 OID 16537)
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE payment_methods (
    id integer NOT NULL,
    paymentname character varying(255)
);


ALTER TABLE payment_methods OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16540)
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_methods_id_seq OWNER TO postgres;

--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 192
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE payment_methods_id_seq OWNED BY payment_methods.id;


--
-- TOC entry 193 (class 1259 OID 16542)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE role (
    id integer NOT NULL,
    name_role character varying(255)
);


ALTER TABLE role OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16545)
-- Name: staffs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE staffs (
    id integer NOT NULL,
    date_arranged date,
    date_birth date,
    fio character varying(255),
    free_man boolean,
    "position" character varying(255)
);


ALTER TABLE staffs OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16551)
-- Name: staffs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE staffs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE staffs_id_seq OWNER TO postgres;

--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 195
-- Name: staffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE staffs_id_seq OWNED BY staffs.id;


--
-- TOC entry 196 (class 1259 OID 16553)
-- Name: status_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE status_orders (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE status_orders OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16556)
-- Name: status_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE status_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE status_orders_id_seq OWNER TO postgres;

--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 197
-- Name: status_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE status_orders_id_seq OWNED BY status_orders.id;


--
-- TOC entry 3011 (class 2604 OID 16558)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- TOC entry 3012 (class 2604 OID 16559)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);


--
-- TOC entry 3013 (class 2604 OID 16560)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dishes ALTER COLUMN id SET DEFAULT nextval('dishes_id_seq'::regclass);


--
-- TOC entry 3014 (class 2604 OID 16561)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- TOC entry 3015 (class 2604 OID 16562)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment_methods ALTER COLUMN id SET DEFAULT nextval('payment_methods_id_seq'::regclass);


--
-- TOC entry 3016 (class 2604 OID 16563)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY staffs ALTER COLUMN id SET DEFAULT nextval('staffs_id_seq'::regclass);


--
-- TOC entry 3017 (class 2604 OID 16564)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_orders ALTER COLUMN id SET DEFAULT nextval('status_orders_id_seq'::regclass);


--
-- TOC entry 3157 (class 0 OID 16506)
-- Dependencies: 181
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categories VALUES (6, 'Холодные закуски', 0);
INSERT INTO categories VALUES (7, 'Салаты', 0);
INSERT INTO categories VALUES (8, 'Мангал меню', 0);
INSERT INTO categories VALUES (11, 'Горячие закуски', 0);
INSERT INTO categories VALUES (12, 'Суши', 0);
INSERT INTO categories VALUES (16, 'Add menu', 1);


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 182
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_id_seq', 16, true);


--
-- TOC entry 3159 (class 0 OID 16511)
-- Dependencies: 183
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO clients VALUES (2, NULL, '2017-03-07 10:55:05.752', 'jhjjhhhhhhhhh', 'Балаба Дмитрий', 's', 's', '6666666666', 0);
INSERT INTO clients VALUES (3, NULL, '2017-03-28 09:12:43.394', 'vvv@v.com', 'Test', 'v', 'v', '+96854654', 0);
INSERT INTO clients VALUES (24, NULL, '2017-05-03 10:57:48.304', 'c', 'уцевыавыацу', 'c', 'c', '232', 0);
INSERT INTO clients VALUES (25, NULL, '2017-05-03 10:59:02.744', 'd', 'авыацуцуцуа', 'd', 'd', '2323', 0);
INSERT INTO clients VALUES (1, NULL, '2017-03-07 10:51:43.375', 'aaa@sdasdsa.com', 'Администратор', 'admin', 'admin', '12313', 1);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 184
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clients_id_seq', 25, true);


--
-- TOC entry 3161 (class 0 OID 16519)
-- Dependencies: 185
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO dishes VALUES (2, 'Сыр копченный
Соус - 50 г.
Листья салата
Грецкий орех
', '/static/img/top/cold/43e31c_dc611817b7584606983b1dc5b22e5609.jpg_srz_500_500_75_22_0.5_1.png', 'Сыр под пивко', 150, 6, 250);
INSERT INTO dishes VALUES (3, 'Болгарский перец
Колбаса по домашнему
Огурцы
Соус - 50 г.', '/static/img/top/cold/66e50a3995190362e1e8ec5a9f7e4aaf.jpg', 'Закусь по домашнему', 200, 6, 100);
INSERT INTO dishes VALUES (4, 'Бастурма
Ветчина
Сало
Соус - 50 г.
....................................................', '/static/img/top/cold/d9cbdebe164b1af6c7de80e486f1b2a9.jpg', 'Мясная нарезка', 200, 6, 50);
INSERT INTO dishes VALUES (5, 'Ветчина 
Салат
Оливки
Соус - 50 г.
....................................................\', '/static/img/top/cold/eb6e0e_f1a6b8e9a9c543819cd44e19d1f33976.jpg_srz_500_500_75_22_0.5_1.png', 'Рулетики офигени', 250, 6, 150);
INSERT INTO dishes VALUES (1, 'Уши - 250 г.
Соль, перец
Соус - 50 г.
....
..........................................', '/static/img/top/cold/7f1d18d71e7559e46137e4fc64426daf.jpg', 'Копченые уши', 250, 6, 150);
INSERT INTO dishes VALUES (6, 'Грибы 250 г.', '/static/img/top/hot /d0f9e8800aca0ef7214612f18bd2c95c.jpg', 'Сочные грибочки', 250, 11, 233);
INSERT INTO dishes VALUES (23, 'Что-то там....', '/static/img/top/sushi/179a1e_75fd60bd8a67411e8bd2c7a96f539bca-mv2.jpg_srz_500_500_75_22_0.5_1.2_75_png_srz', 'Суши с угрем', 250, 12, 135);
INSERT INTO dishes VALUES (22, 'Что-то добавили !!', '/static/img/top/salat/salat-normal-200-sss-468x468.jpg', 'Салат Май Шеф', 150, 7, 130);
INSERT INTO dishes VALUES (16, 'Селедка, морковь, свекла, кортофель...', '/static/img/top/salat/IMG_7638ss-468x468.jpg', 'Селедь под шубой', 150, 7, 100);
INSERT INTO dishes VALUES (24, 'Что-то там....', '/static/img/top/sushi/179a1e_7700a8f461a04a1b8b3ea32a98fc777b-mv2.jpg_srz_500_500_75_22_0.5_1.2_75_png_srz', 'Филадельфия', 250, 12, 125);
INSERT INTO dishes VALUES (17, 'Помидоры, огурцы, перец болгарский, лук', '/static/img/top/salat/greek-salad-1-1-468x468.jpg', 'Греческий салат', 150, 7, 120);
INSERT INTO dishes VALUES (21, 'Мясо из говядины, фасоль...', '/static/img/top/salat/IMG_3242yyyyyay-468x468.jpg', 'Салат из говядины', 150, 7, 125);
INSERT INTO dishes VALUES (7, 'Рыба 150 г.
Перец 50 г.', '/static/img/top/hot /file-ledyanoy-ryby-s-ovoshami-500x500.jpg', 'Рыба с овощами', 200, 11, 185);
INSERT INTO dishes VALUES (15, 'Куриное филе, помидоры,чеснок', '/static/img/top/salat/cezar.PNG', 'Цезарь', 150, 7, 120);
INSERT INTO dishes VALUES (8, 'Рыба 500 г.', '/static/img/top/hot /Goryachie_blyuda_iz_ryby___forel__raduzhnaya.jpg', 'Рыба на гриле', 500, 11, 465);
INSERT INTO dishes VALUES (9, 'Что-то добавляли', '/static/img/top/hot /grusha-v-teste-s-koritsey-500x500.jpg', 'Вкусное блюдо', 250, 11, 230);
INSERT INTO dishes VALUES (19, 'Крабовые палочки, капуста, кукуруза, огурец', '/static/img/top/salat/IMG_7636ss-468x468.jpg', 'Бриз', 150, 7, 100);
INSERT INTO dishes VALUES (26, 'Что-то там....', '/static/img/top/sushi/img_1892-500x500.jpg', 'Калифорния', 250, 12, 235);
INSERT INTO dishes VALUES (27, 'Что-то там....', '/static/img/top/sushi/Kanada-500x500.png', 'Канада', 250, 12, 145);
INSERT INTO dishes VALUES (28, 'Что-то там....', '/static/img/top/sushi/Вега200 39грн-500x500.jpg', 'Вегетарианский', 250, 12, 235);
INSERT INTO dishes VALUES (10, 'Говядина 200 г.', '/static/img/top/mangal/124.jpg', 'Говядина сочная', 200, 8, 325);
INSERT INTO dishes VALUES (25, 'Что-то там....', '/static/img/top/sushi/-ролл мизу-500x500.jpg', 'Филадельфия с  лососем', 250, 12, 253);
INSERT INTO dishes VALUES (11, 'Говядина 450 г.', '/static/img/top/mangal/1094504.jpg', 'Nice-beef', 450, 8, 500);
INSERT INTO dishes VALUES (20, 'Язык говяжий', '/static/img/top/salat/IMG_7629ss-468x468.jpg', 'Салат из языка', 150, 7, 110);
INSERT INTO dishes VALUES (12, 'Свинина 500 г.', '/static/img/top/mangal/53903224_1263719909_17.jpg', 'Поросятко', 500, 8, 633);
INSERT INTO dishes VALUES (13, 'Баклажаны, перец,  грибы, помидоры', '/static/img/top/mangal/ovoshchi-na-mangale.png', 'Овощи на гриле', 350, 8, 185);
INSERT INTO dishes VALUES (14, 'Перепелка', '/static/img/top/mangal/Perepela na Mangale-500x500.jpg', 'Перепела на гриле', 450, 8, 300);


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 186
-- Name: dishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dishes_id_seq', 1, true);


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 187
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 67, true);


--
-- TOC entry 3164 (class 0 OID 16529)
-- Dependencies: 188
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO orders VALUES (42, '2017-04-05 10:37:53.503', 1, NULL, 2, 150, 2, NULL, NULL, NULL);
INSERT INTO orders VALUES (43, '2017-04-05 10:45:28.66', 1, NULL, 3, 200, 2, NULL, NULL, NULL);
INSERT INTO orders VALUES (44, '2017-04-05 10:48:54.683', 1, NULL, 3, 50, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (45, '2017-04-05 11:26:24.573', 1, NULL, 3, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (54, '2017-04-05 14:02:05.049', 3, NULL, 3, 150, 2, NULL, NULL, NULL);
INSERT INTO orders VALUES (61, '2017-04-05 15:15:47.401', 3, NULL, 3, 50, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (62, '2017-04-05 15:17:26.849', 3, NULL, 3, 100, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (55, '2017-04-05 14:03:57.76', 3, 3, 3, 50, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (63, '2017-04-05 15:57:08.939', 1, NULL, 2, 450, 3, NULL, NULL, NULL);
INSERT INTO orders VALUES (64, '2017-04-05 15:57:49.52', 1, NULL, 2, 350, 2, NULL, NULL, NULL);
INSERT INTO orders VALUES (65, '2017-04-05 15:58:12.368', 3, NULL, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (66, '2017-04-05 16:01:02.322', NULL, NULL, 2, 400, 3, NULL, NULL, NULL);
INSERT INTO orders VALUES (67, '2017-04-05 16:01:11.838', NULL, NULL, 2, 50, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (68, '2017-04-05 16:10:28.945', NULL, NULL, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (69, '2017-04-05 16:12:39.463', NULL, NULL, 2, 100, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (70, '2017-04-05 16:46:41.129', NULL, NULL, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (73, '2017-04-22 20:55:25.597', NULL, NULL, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (74, '2017-04-22 20:55:43.474', NULL, NULL, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (75, '2017-04-22 20:58:39.284', NULL, NULL, 2, 350, 2, NULL, NULL, NULL);
INSERT INTO orders VALUES (80, '2017-04-22 21:27:58.572', NULL, NULL, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (36, '2017-04-05 09:29:26.03', 1, NULL, 2, 150, 2, NULL, NULL, NULL);
INSERT INTO orders VALUES (37, '2017-04-05 09:29:38.336', 1, NULL, 2, 250, 2, NULL, NULL, NULL);
INSERT INTO orders VALUES (38, '2017-04-05 09:29:49.017', 1, NULL, 2, 700, 5, NULL, NULL, NULL);
INSERT INTO orders VALUES (41, '2017-04-05 09:30:29.046', 1, NULL, 3, 700, 5, NULL, NULL, NULL);
INSERT INTO orders VALUES (39, '2017-04-05 09:30:03.893', 1, 2, 3, 300, 2, NULL, NULL, NULL);
INSERT INTO orders VALUES (35, '2017-04-05 09:29:17.322', 1, 1, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (40, '2017-04-05 09:30:12.888', 1, 2, 3, 300, 3, NULL, NULL, NULL);
INSERT INTO orders VALUES (71, '2017-04-22 19:40:18.955', NULL, 1, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (72, '2017-04-22 20:02:55.984', NULL, 3, 2, 350, 2, NULL, NULL, NULL);
INSERT INTO orders VALUES (76, '2017-04-22 21:01:12.156', NULL, 2, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (77, '2017-04-22 21:06:32.998', NULL, 3, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (78, '2017-04-22 21:07:55.064', NULL, 1, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (79, '2017-04-22 21:18:04.167', NULL, 3, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (81, '2017-04-23 08:01:26.15', NULL, 2, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (82, '2017-04-23 08:03:02.733', NULL, 3, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (83, '2017-04-23 08:11:35.631', NULL, 1, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (84, '2017-04-23 08:16:30.524', NULL, 3, 2, 400, 3, NULL, NULL, NULL);
INSERT INTO orders VALUES (85, '2017-04-23 08:19:49.891', NULL, 3, 2, 150, 2, NULL, NULL, NULL);
INSERT INTO orders VALUES (86, '2017-04-23 08:34:05.036', 2, 2, 2, 350, 2, NULL, NULL, NULL);
INSERT INTO orders VALUES (87, '2017-04-23 08:38:59.132', 1, 3, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (88, '2017-04-23 08:39:47.241', 2, 2, 2, 100, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (89, '2017-04-23 09:08:00.693', 2, 1, 2, 250, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (90, '2017-04-23 10:11:57.39', 2, 2, 2, 100, 1, NULL, NULL, NULL);
INSERT INTO orders VALUES (91, '2017-05-03 11:16:27.147', 1, NULL, 25, 400, 3, NULL, NULL, NULL);
INSERT INTO orders VALUES (92, '2017-05-20 11:49:48.551', 1, NULL, 2, 500, 1, NULL, NULL, NULL);


--
-- TOC entry 3165 (class 0 OID 16532)
-- Dependencies: 189
-- Data for Name: orders_dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO orders_dishes VALUES (36, 4);
INSERT INTO orders_dishes VALUES (36, 3);
INSERT INTO orders_dishes VALUES (37, 3);
INSERT INTO orders_dishes VALUES (37, 1);
INSERT INTO orders_dishes VALUES (38, 2);
INSERT INTO orders_dishes VALUES (38, 3);
INSERT INTO orders_dishes VALUES (38, 4);
INSERT INTO orders_dishes VALUES (38, 5);
INSERT INTO orders_dishes VALUES (38, 1);
INSERT INTO orders_dishes VALUES (39, 2);
INSERT INTO orders_dishes VALUES (39, 4);
INSERT INTO orders_dishes VALUES (40, 3);
INSERT INTO orders_dishes VALUES (40, 4);
INSERT INTO orders_dishes VALUES (40, 1);
INSERT INTO orders_dishes VALUES (41, 5);
INSERT INTO orders_dishes VALUES (41, 3);
INSERT INTO orders_dishes VALUES (41, 4);
INSERT INTO orders_dishes VALUES (41, 2);
INSERT INTO orders_dishes VALUES (41, 1);
INSERT INTO orders_dishes VALUES (42, 3);
INSERT INTO orders_dishes VALUES (42, 4);
INSERT INTO orders_dishes VALUES (43, 1);
INSERT INTO orders_dishes VALUES (43, 4);
INSERT INTO orders_dishes VALUES (44, 4);
INSERT INTO orders_dishes VALUES (45, 2);
INSERT INTO orders_dishes VALUES (54, 3);
INSERT INTO orders_dishes VALUES (54, 4);
INSERT INTO orders_dishes VALUES (55, 4);
INSERT INTO orders_dishes VALUES (61, 4);
INSERT INTO orders_dishes VALUES (62, 3);
INSERT INTO orders_dishes VALUES (63, 4);
INSERT INTO orders_dishes VALUES (63, 2);
INSERT INTO orders_dishes VALUES (63, 1);
INSERT INTO orders_dishes VALUES (64, 2);
INSERT INTO orders_dishes VALUES (64, 3);
INSERT INTO orders_dishes VALUES (65, 2);
INSERT INTO orders_dishes VALUES (66, 2);
INSERT INTO orders_dishes VALUES (66, 3);
INSERT INTO orders_dishes VALUES (66, 4);
INSERT INTO orders_dishes VALUES (67, 4);
INSERT INTO orders_dishes VALUES (68, 2);
INSERT INTO orders_dishes VALUES (69, 3);
INSERT INTO orders_dishes VALUES (70, 2);
INSERT INTO orders_dishes VALUES (71, 2);
INSERT INTO orders_dishes VALUES (35, 2);
INSERT INTO orders_dishes VALUES (72, 2);
INSERT INTO orders_dishes VALUES (72, 3);
INSERT INTO orders_dishes VALUES (73, 2);
INSERT INTO orders_dishes VALUES (74, 2);
INSERT INTO orders_dishes VALUES (75, 2);
INSERT INTO orders_dishes VALUES (75, 3);
INSERT INTO orders_dishes VALUES (76, 2);
INSERT INTO orders_dishes VALUES (77, 2);
INSERT INTO orders_dishes VALUES (78, 2);
INSERT INTO orders_dishes VALUES (79, 2);
INSERT INTO orders_dishes VALUES (80, 2);
INSERT INTO orders_dishes VALUES (81, 2);
INSERT INTO orders_dishes VALUES (82, 2);
INSERT INTO orders_dishes VALUES (83, 2);
INSERT INTO orders_dishes VALUES (84, 2);
INSERT INTO orders_dishes VALUES (84, 4);
INSERT INTO orders_dishes VALUES (84, 3);
INSERT INTO orders_dishes VALUES (85, 4);
INSERT INTO orders_dishes VALUES (85, 3);
INSERT INTO orders_dishes VALUES (86, 2);
INSERT INTO orders_dishes VALUES (86, 3);
INSERT INTO orders_dishes VALUES (87, 2);
INSERT INTO orders_dishes VALUES (88, 3);
INSERT INTO orders_dishes VALUES (89, 2);
INSERT INTO orders_dishes VALUES (90, 3);
INSERT INTO orders_dishes VALUES (91, 2);
INSERT INTO orders_dishes VALUES (91, 3);
INSERT INTO orders_dishes VALUES (91, 4);
INSERT INTO orders_dishes VALUES (92, 11);


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 190
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orders_id_seq', 92, true);


--
-- TOC entry 3167 (class 0 OID 16537)
-- Dependencies: 191
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO payment_methods VALUES (1, 'Налом');
INSERT INTO payment_methods VALUES (2, 'Наложеный платеж');
INSERT INTO payment_methods VALUES (3, 'Безнал');


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 192
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('payment_methods_id_seq', 1, false);


--
-- TOC entry 3169 (class 0 OID 16542)
-- Dependencies: 193
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO role VALUES (0, 'CLIENT');
INSERT INTO role VALUES (1, 'ADMINISTRATOR');


--
-- TOC entry 3170 (class 0 OID 16545)
-- Dependencies: 194
-- Data for Name: staffs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 195
-- Name: staffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('staffs_id_seq', 1, false);


--
-- TOC entry 3172 (class 0 OID 16553)
-- Dependencies: 196
-- Data for Name: status_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO status_orders VALUES (2, 'Отправлен на кухню');
INSERT INTO status_orders VALUES (3, 'Доставлен');
INSERT INTO status_orders VALUES (1, 'Ждет оплаты');


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 197
-- Name: status_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('status_orders_id_seq', 1, false);


--
-- TOC entry 3019 (class 2606 OID 16566)
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3021 (class 2606 OID 16568)
-- Name: clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3023 (class 2606 OID 16570)
-- Name: dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- TOC entry 3025 (class 2606 OID 16572)
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3027 (class 2606 OID 16574)
-- Name: payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- TOC entry 3029 (class 2606 OID 16576)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 3031 (class 2606 OID 16578)
-- Name: staffs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY staffs
    ADD CONSTRAINT staffs_pkey PRIMARY KEY (id);


--
-- TOC entry 3033 (class 2606 OID 16580)
-- Name: status_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_orders
    ADD CONSTRAINT status_orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3034 (class 2606 OID 16581)
-- Name: fk2x769vhv02cxnpedqlpcvbna4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT fk2x769vhv02cxnpedqlpcvbna4 FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 3037 (class 2606 OID 16586)
-- Name: fk58161nfwl47r951t3muwlqthd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk58161nfwl47r951t3muwlqthd FOREIGN KEY (order_for_client) REFERENCES clients(id);


--
-- TOC entry 3038 (class 2606 OID 16591)
-- Name: fk7anrq3h3wb9vj69i0dehpxgqq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk7anrq3h3wb9vj69i0dehpxgqq FOREIGN KEY (statusorders) REFERENCES status_orders(id);


--
-- TOC entry 3039 (class 2606 OID 16596)
-- Name: fk7vt11rektq6d400j5r1ajw8st; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk7vt11rektq6d400j5r1ajw8st FOREIGN KEY (staff_id) REFERENCES staffs(id);


--
-- TOC entry 3041 (class 2606 OID 16601)
-- Name: fkeitv7xq9k18h3eoefplnlmyfd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders_dishes
    ADD CONSTRAINT fkeitv7xq9k18h3eoefplnlmyfd FOREIGN KEY (orders_id) REFERENCES orders(id);


--
-- TOC entry 3036 (class 2606 OID 16606)
-- Name: fkgbu6erefir17660qutbbjnma7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dishes
    ADD CONSTRAINT fkgbu6erefir17660qutbbjnma7 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- TOC entry 3040 (class 2606 OID 16611)
-- Name: fknuec6hjxrx72xeese1whwcb5w; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fknuec6hjxrx72xeese1whwcb5w FOREIGN KEY (paymentmethod_id) REFERENCES payment_methods(id);


--
-- TOC entry 3035 (class 2606 OID 16616)
-- Name: fkp60ktsalf7vf6ynwdlypkmcec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT fkp60ktsalf7vf6ynwdlypkmcec FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 3042 (class 2606 OID 16621)
-- Name: fkswlgp9qxu3ct1mkpivtsisdxl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders_dishes
    ADD CONSTRAINT fkswlgp9qxu3ct1mkpivtsisdxl FOREIGN KEY (dishes_id) REFERENCES dishes(id);


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-05-20 13:04:35 EEST

--
-- PostgreSQL database dump complete
--

