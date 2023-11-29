--
-- PostgreSQL database dump
--

-- Dumped from database version 11.16 (Debian 11.16-0+deb10u1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-11-29 15:11:33

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

DROP DATABASE "2023_BFS_2_G1";
--
-- TOC entry 3082 (class 1262 OID 290889)
-- Name: 2023_BFS_2_G1; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "2023_BFS_2_G1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


\connect "2023_BFS_2_G1"

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 222 (class 1259 OID 294916)
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    ca_id integer NOT NULL,
    ca_name character varying(50),
    ca_isexpenses boolean DEFAULT false,
    ca_isincomes boolean DEFAULT false
);


--
-- TOC entry 221 (class 1259 OID 294914)
-- Name: categories_ca_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_ca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 221
-- Name: categories_ca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_ca_id_seq OWNED BY public.categories.ca_id;


--
-- TOC entry 224 (class 1259 OID 295626)
-- Name: goals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.goals (
    go_id integer NOT NULL,
    user_ character varying(50) NOT NULL,
    go_name character varying(50) NOT NULL,
    ca_id integer NOT NULL,
    go_amount numeric(10,2) NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 295624)
-- Name: goals_go_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.goals_go_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 223
-- Name: goals_go_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.goals_go_id_seq OWNED BY public.goals.go_id;


--
-- TOC entry 216 (class 1259 OID 294208)
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.groups (
    gr_id integer NOT NULL,
    gr_name character varying(50) NOT NULL,
    gr_creation_date date NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 294206)
-- Name: groups_gr_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.groups_gr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 215
-- Name: groups_gr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.groups_gr_id_seq OWNED BY public.groups.gr_id;


--
-- TOC entry 218 (class 1259 OID 294221)
-- Name: member_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.member_group (
    mg_id integer NOT NULL,
    gr_id integer NOT NULL,
    user_ character varying(50) NOT NULL,
    mg_is_admin boolean DEFAULT false NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 294219)
-- Name: member_group_mg_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.member_group_mg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 217
-- Name: member_group_mg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.member_group_mg_id_seq OWNED BY public.member_group.mg_id;


--
-- TOC entry 220 (class 1259 OID 294908)
-- Name: movements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movements (
    mov_id integer NOT NULL,
    mov_concept character varying(50) NOT NULL,
    mov_amount numeric(10,2) NOT NULL,
    mov_date date NOT NULL,
    ca_id integer NOT NULL,
    user_ character varying(50),
    gr_id integer
);


--
-- TOC entry 219 (class 1259 OID 294906)
-- Name: movements_mov_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movements_mov_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 219
-- Name: movements_mov_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movements_mov_id_seq OWNED BY public.movements.mov_id;


--
-- TOC entry 210 (class 1259 OID 291387)
-- Name: ti18n; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ti18n (
    id_i18n integer NOT NULL,
    class_name character varying(150),
    i18n_description character varying(250)
);


--
-- TOC entry 209 (class 1259 OID 291385)
-- Name: ti18n_id_i18n_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ti18n_id_i18n_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 209
-- Name: ti18n_id_i18n_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ti18n_id_i18n_seq OWNED BY public.ti18n.id_i18n;


--
-- TOC entry 212 (class 1259 OID 291396)
-- Name: ti18n_value; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ti18n_value (
    id_i18n_value integer NOT NULL,
    id_i18n integer NOT NULL,
    "KEY" character varying(250),
    es_es text,
    en_us text,
    gl_es text
);


--
-- TOC entry 211 (class 1259 OID 291394)
-- Name: ti18n_value_id_i18n_value_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ti18n_value_id_i18n_value_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 211
-- Name: ti18n_value_id_i18n_value_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ti18n_value_id_i18n_value_seq OWNED BY public.ti18n_value.id_i18n_value;


--
-- TOC entry 204 (class 1259 OID 291352)
-- Name: trequest_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trequest_statistics (
    id_request_statistics integer NOT NULL,
    service_name character varying(255),
    method_name character varying(50),
    user_name character varying(50),
    execution_date date,
    execution_time integer,
    method_params character varying(5000),
    service_exception character varying(5000)
);


--
-- TOC entry 203 (class 1259 OID 291350)
-- Name: trequest_statistics_id_request_statistics_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trequest_statistics_id_request_statistics_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 203
-- Name: trequest_statistics_id_request_statistics_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trequest_statistics_id_request_statistics_seq OWNED BY public.trequest_statistics.id_request_statistics;


--
-- TOC entry 198 (class 1259 OID 291309)
-- Name: trole; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trole (
    id_rolename integer NOT NULL,
    rolename character varying(255),
    xmlclientpermission text
);


--
-- TOC entry 197 (class 1259 OID 291307)
-- Name: trole_id_rolename_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trole_id_rolename_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 197
-- Name: trole_id_rolename_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trole_id_rolename_seq OWNED BY public.trole.id_rolename;


--
-- TOC entry 214 (class 1259 OID 291503)
-- Name: trole_server_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trole_server_permission (
    id_role_server_permission integer NOT NULL,
    id_rolename integer,
    id_server_permission integer
);


--
-- TOC entry 213 (class 1259 OID 291501)
-- Name: trole_server_permission_id_role_server_permission_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trole_server_permission_id_role_server_permission_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 213
-- Name: trole_server_permission_id_role_server_permission_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trole_server_permission_id_role_server_permission_seq OWNED BY public.trole_server_permission.id_role_server_permission;


--
-- TOC entry 202 (class 1259 OID 291340)
-- Name: tserver_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tserver_permission (
    id_server_permission integer NOT NULL,
    permission_name text
);


--
-- TOC entry 201 (class 1259 OID 291338)
-- Name: tserver_permission_id_server_permission_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tserver_permission_id_server_permission_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 201
-- Name: tserver_permission_id_server_permission_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tserver_permission_id_server_permission_seq OWNED BY public.tserver_permission.id_server_permission;


--
-- TOC entry 206 (class 1259 OID 291363)
-- Name: tsetting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tsetting (
    id_setting integer NOT NULL,
    setting_key text,
    setting_value text,
    setting_comment text
);


--
-- TOC entry 205 (class 1259 OID 291361)
-- Name: tsetting_id_setting_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tsetting_id_setting_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 205
-- Name: tsetting_id_setting_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tsetting_id_setting_seq OWNED BY public.tsetting.id_setting;


--
-- TOC entry 196 (class 1259 OID 291297)
-- Name: tuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser (
    user_ character varying(50) NOT NULL,
    password character varying(255),
    name character varying(50),
    surname character varying(50),
    email character varying(50),
    nif character varying(50),
    userblocked timestamp without time zone,
    lastpasswordupdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    firstlogin boolean DEFAULT true
);


--
-- TOC entry 208 (class 1259 OID 291375)
-- Name: tuser_preference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_preference (
    id_user_preference integer NOT NULL,
    preference_name character varying(150),
    user_login character varying(150),
    preference_value text
);


--
-- TOC entry 207 (class 1259 OID 291373)
-- Name: tuser_preference_id_user_preference_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tuser_preference_id_user_preference_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 207
-- Name: tuser_preference_id_user_preference_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tuser_preference_id_user_preference_seq OWNED BY public.tuser_preference.id_user_preference;


--
-- TOC entry 200 (class 1259 OID 291321)
-- Name: tuser_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_role (
    id_user_role integer NOT NULL,
    id_rolename integer,
    user_ character varying(50)
);


--
-- TOC entry 199 (class 1259 OID 291319)
-- Name: tuser_role_id_user_role_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tuser_role_id_user_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 199
-- Name: tuser_role_id_user_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tuser_role_id_user_role_seq OWNED BY public.tuser_role.id_user_role;


--
-- TOC entry 2880 (class 2604 OID 294919)
-- Name: categories ca_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN ca_id SET DEFAULT nextval('public.categories_ca_id_seq'::regclass);


--
-- TOC entry 2883 (class 2604 OID 295629)
-- Name: goals go_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goals ALTER COLUMN go_id SET DEFAULT nextval('public.goals_go_id_seq'::regclass);


--
-- TOC entry 2876 (class 2604 OID 294211)
-- Name: groups gr_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups ALTER COLUMN gr_id SET DEFAULT nextval('public.groups_gr_id_seq'::regclass);


--
-- TOC entry 2877 (class 2604 OID 294224)
-- Name: member_group mg_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_group ALTER COLUMN mg_id SET DEFAULT nextval('public.member_group_mg_id_seq'::regclass);


--
-- TOC entry 2879 (class 2604 OID 294911)
-- Name: movements mov_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movements ALTER COLUMN mov_id SET DEFAULT nextval('public.movements_mov_id_seq'::regclass);


--
-- TOC entry 2873 (class 2604 OID 291390)
-- Name: ti18n id_i18n; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n ALTER COLUMN id_i18n SET DEFAULT nextval('public.ti18n_id_i18n_seq'::regclass);


--
-- TOC entry 2874 (class 2604 OID 291399)
-- Name: ti18n_value id_i18n_value; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n_value ALTER COLUMN id_i18n_value SET DEFAULT nextval('public.ti18n_value_id_i18n_value_seq'::regclass);


--
-- TOC entry 2870 (class 2604 OID 291355)
-- Name: trequest_statistics id_request_statistics; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequest_statistics ALTER COLUMN id_request_statistics SET DEFAULT nextval('public.trequest_statistics_id_request_statistics_seq'::regclass);


--
-- TOC entry 2867 (class 2604 OID 291312)
-- Name: trole id_rolename; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole ALTER COLUMN id_rolename SET DEFAULT nextval('public.trole_id_rolename_seq'::regclass);


--
-- TOC entry 2875 (class 2604 OID 291506)
-- Name: trole_server_permission id_role_server_permission; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission ALTER COLUMN id_role_server_permission SET DEFAULT nextval('public.trole_server_permission_id_role_server_permission_seq'::regclass);


--
-- TOC entry 2869 (class 2604 OID 291343)
-- Name: tserver_permission id_server_permission; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tserver_permission ALTER COLUMN id_server_permission SET DEFAULT nextval('public.tserver_permission_id_server_permission_seq'::regclass);


--
-- TOC entry 2871 (class 2604 OID 291366)
-- Name: tsetting id_setting; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tsetting ALTER COLUMN id_setting SET DEFAULT nextval('public.tsetting_id_setting_seq'::regclass);


--
-- TOC entry 2872 (class 2604 OID 291378)
-- Name: tuser_preference id_user_preference; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_preference ALTER COLUMN id_user_preference SET DEFAULT nextval('public.tuser_preference_id_user_preference_seq'::regclass);


--
-- TOC entry 2868 (class 2604 OID 291324)
-- Name: tuser_role id_user_role; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role ALTER COLUMN id_user_role SET DEFAULT nextval('public.tuser_role_id_user_role_seq'::regclass);


--
-- TOC entry 3074 (class 0 OID 294916)
-- Dependencies: 222
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categories VALUES (1, 'Suscripciones', true, false);
INSERT INTO public.categories VALUES (2, 'Gasolina', true, false);
INSERT INTO public.categories VALUES (3, 'Supermercado', true, false);
INSERT INTO public.categories VALUES (4, 'Alquiler', true, false);
INSERT INTO public.categories VALUES (5, 'Seguros', true, false);
INSERT INTO public.categories VALUES (6, 'Hipotecas', true, false);
INSERT INTO public.categories VALUES (7, 'Peluquería', true, false);
INSERT INTO public.categories VALUES (8, 'Entretenimiento', true, false);
INSERT INTO public.categories VALUES (9, 'Cafeterías y restaurantes', true, false);
INSERT INTO public.categories VALUES (10, 'ONG', true, false);
INSERT INTO public.categories VALUES (11, 'Comisiones banco', true, false);
INSERT INTO public.categories VALUES (12, 'Teléfono, TV e internet', true, false);
INSERT INTO public.categories VALUES (13, 'Belleza y perfumería', true, false);
INSERT INTO public.categories VALUES (14, 'Deporte y gimnasio', true, false);
INSERT INTO public.categories VALUES (15, 'Taxi y Carsharing. Transporte', true, false);
INSERT INTO public.categories VALUES (16, 'Regalos y juguetes', true, false);
INSERT INTO public.categories VALUES (17, 'Hotel y alojamiento', true, false);
INSERT INTO public.categories VALUES (18, 'Nómina', false, true);
INSERT INTO public.categories VALUES (19, 'Otros ingresos', false, true);


--
-- TOC entry 3076 (class 0 OID 295626)
-- Dependencies: 224
-- Data for Name: goals; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.goals VALUES (58, 'alba', 'Gasto gasolina', 2, 50.00);
INSERT INTO public.goals VALUES (59, 'alba', 'Ahorrar en médico', 5, 500.00);
INSERT INTO public.goals VALUES (51, 'laura', 'Compra súper', 3, 300.00);
INSERT INTO public.goals VALUES (62, 'laura', 'Maquillaje', 13, 30.00);
INSERT INTO public.goals VALUES (34, 'demo', 'TV', 8, 21.00);
INSERT INTO public.goals VALUES (36, 'demo', 'ONG', 10, 12.00);
INSERT INTO public.goals VALUES (32, 'demo', 'Disney', 1, 15.00);
INSERT INTO public.goals VALUES (48, 'laura', 'ONG', 10, 12.00);
INSERT INTO public.goals VALUES (63, 'laura', 'no tocar', 8, 100.00);
INSERT INTO public.goals VALUES (73, 'rebeca', 'Ocio', 8, 150.00);
INSERT INTO public.goals VALUES (53, 'pablo', 'Alimentación', 3, 250.00);
INSERT INTO public.goals VALUES (74, 'pablo', 'Presupuesto ocio', 8, 120.00);
INSERT INTO public.goals VALUES (56, 'pablo', 'Suscripciones', 1, 20.00);


--
-- TOC entry 3068 (class 0 OID 294208)
-- Dependencies: 216
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.groups VALUES (2, 'Comida', '2023-01-15');
INSERT INTO public.groups VALUES (4, 'Entretenimiento', '2023-03-20');
INSERT INTO public.groups VALUES (5, 'Salud', '2023-04-10');
INSERT INTO public.groups VALUES (6, 'Educación', '2023-05-02');
INSERT INTO public.groups VALUES (7, 'Hogar', '2023-06-18');
INSERT INTO public.groups VALUES (8, 'Viajes', '2023-07-14');
INSERT INTO public.groups VALUES (9, 'Ropa', '2023-08-30');
INSERT INTO public.groups VALUES (10, 'Tecnología', '2023-09-08');
INSERT INTO public.groups VALUES (37, 'compañeros de piso', '2023-11-27');
INSERT INTO public.groups VALUES (22, 'PixelPioneers', '2023-10-27');
INSERT INTO public.groups VALUES (38, 'Amigos', '2023-11-28');
INSERT INTO public.groups VALUES (11, 'Cumple tio Julian', '2023-10-25');
INSERT INTO public.groups VALUES (25, 'Cumple Andrea', '2023-11-07');
INSERT INTO public.groups VALUES (24, 'Gastos Piso', '2023-11-07');
INSERT INTO public.groups VALUES (26, 'Tutores', '2023-11-08');
INSERT INTO public.groups VALUES (28, 'Piso', '2023-11-21');
INSERT INTO public.groups VALUES (31, 'café trabajo', '2023-11-22');


--
-- TOC entry 3070 (class 0 OID 294221)
-- Dependencies: 218
-- Data for Name: member_group; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.member_group VALUES (94, 22, 'carla', false);
INSERT INTO public.member_group VALUES (95, 25, 'alba', false);
INSERT INTO public.member_group VALUES (141, 37, 'rebeca', true);
INSERT INTO public.member_group VALUES (142, 37, 'luis', false);
INSERT INTO public.member_group VALUES (100, 28, 'maria', true);
INSERT INTO public.member_group VALUES (101, 28, 'alba', false);
INSERT INTO public.member_group VALUES (102, 28, 'alvaro', false);
INSERT INTO public.member_group VALUES (103, 28, 'carla', false);
INSERT INTO public.member_group VALUES (143, 37, 'fernando', false);
INSERT INTO public.member_group VALUES (144, 37, 'maruchi', false);
INSERT INTO public.member_group VALUES (145, 38, 'pablo', true);
INSERT INTO public.member_group VALUES (146, 38, 'carla', false);
INSERT INTO public.member_group VALUES (112, 31, 'rebeca', true);
INSERT INTO public.member_group VALUES (147, 38, 'maria', false);
INSERT INTO public.member_group VALUES (148, 38, 'pedro', false);
INSERT INTO public.member_group VALUES (21, 10, 'prueba', false);
INSERT INTO public.member_group VALUES (116, 31, 'carla', false);
INSERT INTO public.member_group VALUES (117, 31, 'pedro', false);
INSERT INTO public.member_group VALUES (120, 31, 'carlos', false);
INSERT INTO public.member_group VALUES (48, 22, 'pablo', true);
INSERT INTO public.member_group VALUES (49, 22, 'alba', false);
INSERT INTO public.member_group VALUES (50, 22, 'alejandra', false);
INSERT INTO public.member_group VALUES (76, 24, 'laura', true);
INSERT INTO public.member_group VALUES (77, 24, 'carlos', false);
INSERT INTO public.member_group VALUES (78, 24, 'marta', false);
INSERT INTO public.member_group VALUES (79, 24, 'carla', false);
INSERT INTO public.member_group VALUES (80, 25, 'carla', true);
INSERT INTO public.member_group VALUES (81, 25, 'laura', false);
INSERT INTO public.member_group VALUES (82, 25, 'marta', false);
INSERT INTO public.member_group VALUES (87, 26, 'laura', true);


--
-- TOC entry 3072 (class 0 OID 294908)
-- Dependencies: 220
-- Data for Name: movements; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.movements VALUES (47, 'chocolate', -5.00, '2023-11-02', 9, 'alejandra', 22);
INSERT INTO public.movements VALUES (261, 'Galletas, chocolate', -15.00, '2023-11-22', 3, 'rebeca', NULL);
INSERT INTO public.movements VALUES (112, 'Café', -20.00, '2023-11-07', 3, 'alba', NULL);
INSERT INTO public.movements VALUES (12, 'Casa rural', -300.00, '2023-10-21', 17, 'demo', NULL);
INSERT INTO public.movements VALUES (42, 'prueba3', -25.00, '2023-11-02', 1, 'demo', NULL);
INSERT INTO public.movements VALUES (220, 'medico', -50.00, '2023-10-17', 5, 'alba', NULL);
INSERT INTO public.movements VALUES (293, 'Cafés trabajo', -9.50, '2023-11-24', 9, 'pedro', 31);
INSERT INTO public.movements VALUES (221, 'kilometraje', 200.00, '2023-12-01', 18, 'alba', NULL);
INSERT INTO public.movements VALUES (90, 'dsad', 2001.00, '2023-10-31', 18, 'demo', NULL);
INSERT INTO public.movements VALUES (143, 'compra semanal', -250.00, '2023-10-10', 3, 'laura', NULL);
INSERT INTO public.movements VALUES (54, 'Manzanas', -5.00, '2023-11-03', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (114, 'Cafes', -15.20, '2023-10-17', 9, 'demo', NULL);
INSERT INTO public.movements VALUES (88, 'regalo', 21.00, '2023-11-22', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (129, 'panes', -21.00, '2023-11-08', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (19, 'Café', -10.00, '2023-10-27', 9, 'demo', NULL);
INSERT INTO public.movements VALUES (89, 'primitiva', 3.00, '2023-11-09', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (118, 'IngresoHome', 21.00, '2023-11-08', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (115, 'gastoHome', -20.00, '2023-11-08', 1, 'demo', NULL);
INSERT INTO public.movements VALUES (55, 'Café', -10.00, '2023-11-03', 9, 'alejandra', 22);
INSERT INTO public.movements VALUES (56, 'Otro café', -5.00, '2023-11-03', 9, 'alejandra', NULL);
INSERT INTO public.movements VALUES (223, 'Peluquería', -50.00, '2023-10-11', 13, 'alba', NULL);
INSERT INTO public.movements VALUES (82, 'Platos', -0.57, '2023-11-07', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (113, 'Netfilx', -10.00, '2023-10-19', 1, 'demo', NULL);
INSERT INTO public.movements VALUES (296, 'concierto de Rodrigo', -50.00, '2023-11-27', 8, 'rebeca', NULL);
INSERT INTO public.movements VALUES (230, 'Nomina', 1500.00, '2023-11-17', 18, 'laura', NULL);
INSERT INTO public.movements VALUES (35, 'ruta en edimburgo', -22.00, '2023-10-20', 2, 'demo', NULL);
INSERT INTO public.movements VALUES (1, 'Hipoteca piso mes noviembre', -300.00, '2023-10-28', 4, 'demo', NULL);
INSERT INTO public.movements VALUES (41, 'prueba2', -22.00, '2023-11-02', 1, 'demo', NULL);
INSERT INTO public.movements VALUES (32, 'chocolate', -3.00, '2023-10-31', 13, 'demo', NULL);
INSERT INTO public.movements VALUES (34, 'viaje Santiago', -2.50, '2023-10-31', 15, 'demo', NULL);
INSERT INTO public.movements VALUES (297, 'Supermercadp', -28.12, '2023-11-25', 3, 'pablo', NULL);
INSERT INTO public.movements VALUES (116, 'panDeHoy', -20.00, '2023-11-08', 9, 'demo', NULL);
INSERT INTO public.movements VALUES (247, 'corte pelo', -50.00, '2023-11-08', 7, 'rebeca', NULL);
INSERT INTO public.movements VALUES (298, 'Restaurante Chino', -12.00, '2023-11-23', 9, 'pablo', NULL);
INSERT INTO public.movements VALUES (249, 'seguro coche', -440.00, '2022-10-31', 5, 'rebeca', NULL);
INSERT INTO public.movements VALUES (302, 'Cena Bambú', -75.00, '2023-11-24', 9, 'carla', 38);
INSERT INTO public.movements VALUES (303, 'Cervezas', -24.00, '2023-11-25', 8, 'pedro', 38);
INSERT INTO public.movements VALUES (307, 'Vinted', 15.00, '2023-10-25', 19, 'pablo', NULL);
INSERT INTO public.movements VALUES (232, 'seguro hogar', -120.00, '2023-11-21', 5, 'maria', NULL);
INSERT INTO public.movements VALUES (86, 'refrescos', -25.00, '2023-11-16', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (130, 'pan', -20.00, '2023-11-08', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (235, 'Seguro de alquiler', -115.20, '2023-11-21', 5, 'maria', 28);
INSERT INTO public.movements VALUES (238, 'Lobo de Wall Street', -25.00, '2023-11-22', 8, 'mari', NULL);
INSERT INTO public.movements VALUES (250, 'alquiler mes octubre', -720.00, '2023-10-30', 4, 'rebeca', NULL);
INSERT INTO public.movements VALUES (242, 'Nómina noviembre', 1400.00, '2023-11-30', 18, 'rebeca', NULL);
INSERT INTO public.movements VALUES (244, 'compra alimentación', -120.00, '2023-11-22', 3, 'rebeca', NULL);
INSERT INTO public.movements VALUES (150, 'pipas', -2.50, '2023-11-10', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (60, 'paga extra', 1500.00, '2023-11-03', 18, 'demo', NULL);
INSERT INTO public.movements VALUES (85, 'patata', -30.00, '2023-11-10', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (245, 'Compra alimentación', -136.25, '2023-10-11', 3, 'rebeca', NULL);
INSERT INTO public.movements VALUES (74, 'Luz', -50.00, '2023-11-06', 2, 'demo', NULL);
INSERT INTO public.movements VALUES (63, 'hotel', -160.00, '2023-11-06', 17, 'demo', NULL);
INSERT INTO public.movements VALUES (253, 'skape room', -25.00, '2023-10-11', 8, 'rebeca', NULL);
INSERT INTO public.movements VALUES (255, 'Barbie', -15.00, '2023-11-22', 8, 'mariMar', NULL);
INSERT INTO public.movements VALUES (77, 'tomate', -1.50, '2023-11-10', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (78, 'pimiento', -2.50, '2023-11-09', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (79, 'pendientes', -50.00, '2023-11-09', 16, 'demo', NULL);
INSERT INTO public.movements VALUES (80, 'chatGPT', -24.50, '2023-11-10', 1, 'demo', NULL);
INSERT INTO public.movements VALUES (40, 'prueba', -26.00, '2023-11-23', 1, 'demo', NULL);
INSERT INTO public.movements VALUES (258, 'entrada cine', -15.00, '2023-11-22', 8, 'rebeca', NULL);
INSERT INTO public.movements VALUES (84, 'IngresoDesdeHome', 10.00, '2023-11-07', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (87, 'gasolina viaje', -26.00, '2023-11-25', 2, 'demo', NULL);
INSERT INTO public.movements VALUES (51, 'kilometraje', 50.00, '2023-11-09', 18, 'demo', NULL);
INSERT INTO public.movements VALUES (49, 'Pasta de dientes', -2.55, '2023-11-14', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (33, 'lotería', 1000.00, '2023-10-20', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (94, 'nomina atrasos', 50.00, '2023-11-17', 18, 'demo', NULL);
INSERT INTO public.movements VALUES (96, 'before', -40.00, '2023-11-07', 1, 'demo', NULL);
INSERT INTO public.movements VALUES (97, 'teest', 50.00, '2023-11-07', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (9, 'Acciones de Endesa', 1200.00, '2023-10-12', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (50, 'patatillas', -6.00, '2023-11-30', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (59, 'piscina', -1500.00, '2023-11-03', 4, 'demo', NULL);
INSERT INTO public.movements VALUES (52, 'Chocolate', -57.00, '2023-11-03', 4, 'demo', NULL);
INSERT INTO public.movements VALUES (73, 'Alquiler casas', -200.00, '2023-11-06', 4, 'demo', NULL);
INSERT INTO public.movements VALUES (270, 'comida mes', -150.00, '2023-11-22', 3, 'rebeca', NULL);
INSERT INTO public.movements VALUES (123, 'venta de periodico', 20.00, '2023-11-08', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (98, 'desdeHome', -12.00, '2023-11-07', 1, 'demo', NULL);
INSERT INTO public.movements VALUES (277, 'Bollería', -10.00, '2023-11-22', 9, 'carla', 31);
INSERT INTO public.movements VALUES (275, 'comida mes', -150.00, '2023-11-22', 3, 'rebeca', NULL);
INSERT INTO public.movements VALUES (103, 'Alquiler Noviembre', -350.00, '2023-11-07', 4, 'carlos', NULL);
INSERT INTO public.movements VALUES (102, 'Internet Noviembre', -29.95, '2023-11-07', 12, 'carlos', 24);
INSERT INTO public.movements VALUES (104, 'Luz Noviembre', -74.68, '2023-11-07', 4, 'marta', 24);
INSERT INTO public.movements VALUES (106, 'Regalo Andrea', -50.00, '2023-11-06', 16, 'carla', 25);
INSERT INTO public.movements VALUES (107, 'Bebida cumple Andrea', -30.00, '2023-11-07', 3, 'carla', 25);
INSERT INTO public.movements VALUES (108, 'nomina atrasos', 200.00, '2023-11-09', 18, 'demo', NULL);
INSERT INTO public.movements VALUES (124, 'carta pokemon', 5.00, '2023-11-08', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (131, 'panDeAyer', -20.00, '2023-11-08', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (132, 'pan', -20.00, '2023-11-08', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (133, 'Can', -20.00, '2023-11-08', 1, 'demo', NULL);
INSERT INTO public.movements VALUES (134, 'pan', -20.00, '2023-11-08', 1, 'demo', NULL);
INSERT INTO public.movements VALUES (135, 'pan', -20.00, '2023-11-08', 1, 'demo', NULL);
INSERT INTO public.movements VALUES (136, 'pan', -20.00, '2023-11-08', 1, 'demo', NULL);
INSERT INTO public.movements VALUES (137, 'pan', -80.00, '2023-11-08', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (138, 'pan', -20.00, '2023-11-08', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (139, 'pan', -20.00, '2023-11-08', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (140, 'pan', -20.00, '2023-11-08', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (141, 'reventa de pan', 40.00, '2023-11-08', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (144, 'tinte y planchado', -30.00, '2023-10-24', 13, 'laura', NULL);
INSERT INTO public.movements VALUES (11, 'Dietas', 30.00, '2023-10-13', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (36, 'pago kilometraje', 30.00, '2023-10-25', 18, 'demo', NULL);
INSERT INTO public.movements VALUES (18, 'Estanteria', 26.00, '2023-10-19', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (43, 'bizum Pablo', 25.00, '2023-11-23', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (62, 'kilometraje', 70.00, '2023-11-06', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (8, 'Regalo cumpleaños', 121.00, '2023-10-25', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (58, 'cobro rifas', 200.00, '2023-11-03', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (81, 'kilometraje', 201.00, '2023-11-10', 18, 'demo', NULL);
INSERT INTO public.movements VALUES (151, 'Nómina', 500.00, '2023-11-10', 18, 'demo', NULL);
INSERT INTO public.movements VALUES (29, 'prima', 201.00, '2023-10-13', 18, 'demo', NULL);
INSERT INTO public.movements VALUES (158, 'demo', -500.00, '2023-11-13', 2, 'demo', NULL);
INSERT INTO public.movements VALUES (161, 'demo', -5.00, '2023-11-13', 1, 'demo', NULL);
INSERT INTO public.movements VALUES (222, 'Lotería', 120.00, '2023-11-16', 19, 'alba', NULL);
INSERT INTO public.movements VALUES (224, 'uber', -50.00, '2023-11-16', 15, 'laura', NULL);
INSERT INTO public.movements VALUES (227, 'Bizum', 200.00, '2023-11-17', 19, 'laura', NULL);
INSERT INTO public.movements VALUES (228, 'Bizum2', 100.00, '2023-11-16', 19, 'laura', NULL);
INSERT INTO public.movements VALUES (294, 'mouse de yogur con frutos', -17.35, '2023-11-25', 3, 'maruchi', 37);
INSERT INTO public.movements VALUES (299, 'Merienda', -15.25, '2023-11-25', 9, 'pablo', NULL);
INSERT INTO public.movements VALUES (239, 'sueldo de noviembre', 1800.00, '2023-11-22', 18, 'mari', NULL);
INSERT INTO public.movements VALUES (301, 'Entradas nochevieja', -150.00, '2023-11-21', 8, 'pablo', 38);
INSERT INTO public.movements VALUES (243, 'Nómina octubre', 1400.00, '2023-10-31', 18, 'rebeca', NULL);
INSERT INTO public.movements VALUES (256, 'sueldo de noviembre', 1800.00, '2023-11-20', 18, 'mariMar', NULL);
INSERT INTO public.movements VALUES (304, 'Supermercado', -53.00, '2023-10-18', 3, 'pablo', NULL);
INSERT INTO public.movements VALUES (306, 'Supermercado', -48.00, '2023-10-06', 3, 'pablo', NULL);
INSERT INTO public.movements VALUES (259, 'Teatro', -45.00, '2023-10-03', 8, 'rebeca', NULL);
INSERT INTO public.movements VALUES (264, 'sueldo de noviembre', 1800.00, '2023-11-01', 18, 'MariSol', NULL);
INSERT INTO public.movements VALUES (267, 'Soy Leyenda', -15.00, '2023-11-22', 8, 'Valki', NULL);
INSERT INTO public.movements VALUES (268, 'Bolsa de chocolatinas', -30.00, '2023-11-22', 3, 'Valki', NULL);
INSERT INTO public.movements VALUES (162, 'demo', -5.00, '2023-11-13', 1, 'demo', NULL);
INSERT INTO public.movements VALUES (165, 'test', 5000.00, '2023-11-13', 18, 'demo', NULL);
INSERT INTO public.movements VALUES (166, 'test', -100.00, '2023-11-13', 2, 'demo', NULL);
INSERT INTO public.movements VALUES (167, 'test', 100.00, '2023-11-13', 19, 'demo', NULL);
INSERT INTO public.movements VALUES (168, 'entretenimiento', -5.00, '2023-11-13', 8, 'demo', NULL);
INSERT INTO public.movements VALUES (248, 'productos de limpieza', -80.00, '2023-11-22', 3, 'pedro', NULL);
INSERT INTO public.movements VALUES (246, 'alquiler de noviembre', -600.00, '2023-11-22', 4, 'pedro', NULL);
INSERT INTO public.movements VALUES (295, 'sueldo de noviembre', 1800.00, '2023-11-27', 18, 'maruchi', NULL);
INSERT INTO public.movements VALUES (172, 'disney', -20.00, '2023-11-13', 1, 'laura', NULL);
INSERT INTO public.movements VALUES (173, 'juego', -12.00, '2023-11-13', 8, 'demo', NULL);
INSERT INTO public.movements VALUES (174, 'pan', -10.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (175, 'GTA VI', -80.00, '2023-11-13', 8, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (176, 'pan', -2.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (177, 'pan', -12.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (178, 'pan', -12.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (179, 'pan', -12.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (180, 'pan', -12.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (181, 'pan', -12.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (182, 'pan', -12.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (183, 'pan', -12.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (184, 'pan', -12.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (185, 'pan', -12.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (186, 'Pan de pipas', -23.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (187, 'Chocolate', -4.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (188, 'pan', -12.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (189, 'pan', -12.00, '2023-11-13', 3, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (190, 'pan', -12.00, '2023-11-14', 3, 'demo', NULL);
INSERT INTO public.movements VALUES (191, 'ong', -200.00, '2023-11-14', 10, 'rossiLocaGaming', NULL);
INSERT INTO public.movements VALUES (219, 'Nomina', 995.00, '2023-11-16', 18, 'alba', NULL);
INSERT INTO public.movements VALUES (163, 'fghkj', -25.00, '2023-11-13', 2, 'demo', NULL);
INSERT INTO public.movements VALUES (225, 'pan', -12.00, '2023-11-17', 3, 'laura', NULL);
INSERT INTO public.movements VALUES (229, 'Bizum', 100.00, '2023-11-17', 19, 'laura', NULL);
INSERT INTO public.movements VALUES (292, 'alquiler mes noviembre', -720.00, '2023-11-24', 4, 'rebeca', 37);
INSERT INTO public.movements VALUES (300, 'Wallapop', 392.00, '2023-11-24', 19, 'pablo', NULL);
INSERT INTO public.movements VALUES (234, 'Nómina noviembre', 1200.00, '2023-11-21', 18, 'maria', NULL);
INSERT INTO public.movements VALUES (237, 'Productos de limpieza', -30.00, '2023-11-21', 3, 'carla', 28);
INSERT INTO public.movements VALUES (240, 'champu vegano', -5.00, '2023-11-22', 3, 'mari', NULL);
INSERT INTO public.movements VALUES (241, 'manicura', -35.00, '2023-11-22', 13, 'mari', NULL);
INSERT INTO public.movements VALUES (202, 'pan', -12.00, '2023-11-14', 3, 'laura', NULL);
INSERT INTO public.movements VALUES (203, 'pan', -12.00, '2023-11-14', 3, 'laura', NULL);
INSERT INTO public.movements VALUES (204, 'pan', -12.00, '2023-11-14', 3, 'laura', NULL);
INSERT INTO public.movements VALUES (205, 'pan', -12.00, '2023-11-14', 3, 'laura', NULL);
INSERT INTO public.movements VALUES (206, 'pan', -12.00, '2023-11-14', 3, 'laura', NULL);
INSERT INTO public.movements VALUES (207, 'pan', -12.00, '2023-11-14', 3, 'laura', NULL);
INSERT INTO public.movements VALUES (208, 'pan', -12.00, '2023-11-14', 3, 'laura', NULL);
INSERT INTO public.movements VALUES (209, 'pan', -12.00, '2023-11-14', 3, 'laura', NULL);
INSERT INTO public.movements VALUES (210, 'pan', -12.00, '2023-11-14', 3, 'laura', NULL);
INSERT INTO public.movements VALUES (257, 'manicura', -20.00, '2023-11-21', 13, 'mariMar', NULL);
INSERT INTO public.movements VALUES (214, 'diesel', -5.00, '2023-11-14', 2, 'laura', NULL);
INSERT INTO public.movements VALUES (260, 'Festival Rock', -120.00, '2023-10-12', 8, 'rebeca', NULL);
INSERT INTO public.movements VALUES (305, 'Cine', -9.00, '2023-10-20', 8, 'pablo', NULL);
INSERT INTO public.movements VALUES (269, 'sueldo de noviembre', 1800.00, '2023-11-22', 18, 'Valki', NULL);
INSERT INTO public.movements VALUES (254, 'teatro', -26.00, '2023-10-11', 8, 'rebeca', NULL);


--
-- TOC entry 3062 (class 0 OID 291387)
-- Dependencies: 210
-- Data for Name: ti18n; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ti18n VALUES (0, 'i18n.bundle', 'Resource bundle in database');


--
-- TOC entry 3064 (class 0 OID 291396)
-- Dependencies: 212
-- Data for Name: ti18n_value; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3056 (class 0 OID 291352)
-- Dependencies: 204
-- Data for Name: trequest_statistics; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3050 (class 0 OID 291309)
-- Dependencies: 198
-- Data for Name: trole; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trole VALUES (0, 'admin', '<?xml version="1.0" encoding="UTF-8"?><security></security>');


--
-- TOC entry 3066 (class 0 OID 291503)
-- Dependencies: 214
-- Data for Name: trole_server_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trole_server_permission VALUES (0, 0, 0);


--
-- TOC entry 3054 (class 0 OID 291340)
-- Dependencies: 202
-- Data for Name: tserver_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tserver_permission VALUES (0, 'com.ontimize.jee.common.services.user.IUserInformationService/getUserInformation');


--
-- TOC entry 3058 (class 0 OID 291363)
-- Dependencies: 206
-- Data for Name: tsetting; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tsetting VALUES (0, 'mail_host', 'smtp.gmail.com', 'Host del servidor');
INSERT INTO public.tsetting VALUES (1, 'mail_port', '587', 'Puerto del servidor de email');
INSERT INTO public.tsetting VALUES (2, 'mail_protocol', 'smtp', 'Protocolo de env\u005cu00edo de mails');
INSERT INTO public.tsetting VALUES (3, 'mail_user', 'mi.mail@example.com', 'Usuario para el env\u005cu00edo de mails');
INSERT INTO public.tsetting VALUES (4, 'mail_password', 'mis_credenciales', 'Password del servidor de mail');
INSERT INTO public.tsetting VALUES (5, 'mail_encoding', 'UTF-8', 'Codificaci\u005cu00f3n de mails');
INSERT INTO public.tsetting VALUES (6, 'mail_properties', 'mail.smtp.auth:true;mail.smtp.starttls.enable:true;', 'Propiedades de mails');
INSERT INTO public.tsetting VALUES (7, 'report_folder', 'C:/applications/ontimize-boot-app/reports', 'Carpeta de las plantillas de report');


--
-- TOC entry 3048 (class 0 OID 291297)
-- Dependencies: 196
-- Data for Name: tuser; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser VALUES ('demo', 'demouser', 'demo', 'demo', NULL, '44460713B', NULL, NULL, NULL);
INSERT INTO public.tuser VALUES ('prueba', 'pruebauser', NULL, NULL, NULL, NULL, NULL, '2023-10-06 14:05:27.797657', true);
INSERT INTO public.tuser VALUES ('maria', 'micontra', 'María', 'Fernández', 'maria@example.com', NULL, NULL, '2023-11-21 08:47:43.029913', true);
INSERT INTO public.tuser VALUES ('Rolo', '12345678', 'rossi', 'perez', 'rossi@example.com', NULL, NULL, '2023-11-21 21:17:26.45582', true);
INSERT INTO public.tuser VALUES ('rolo', '123456789', 'rossi', 'perez', 'rossi@example.com', NULL, NULL, '2023-11-21 21:20:19.68616', true);
INSERT INTO public.tuser VALUES ('rolos', '123456789', 'rossi', 'perez', 'rossi@example.com', NULL, NULL, '2023-11-21 21:22:18.93009', true);
INSERT INTO public.tuser VALUES ('ross', '123456789', 'rossi', 'perez', 'rossi@example.com', NULL, NULL, '2023-11-21 21:24:16.60917', true);
INSERT INTO public.tuser VALUES ('mari', '123456789', 'Maria', 'Buenos Aires', 'maria@example.com', NULL, NULL, '2023-11-22 09:14:38.156939', true);
INSERT INTO public.tuser VALUES ('luis', 'luis12345', 'Luis', 'Fernández', 'luis@example.com', NULL, NULL, '2023-11-22 09:36:05.772762', true);
INSERT INTO public.tuser VALUES ('fernando', 'fernando123', 'Fernando', 'López', 'fernando@example.com', NULL, NULL, '2023-11-22 12:30:51.957058', true);
INSERT INTO public.tuser VALUES ('Valki', '123456789', 'Maria', 'Buenos Aires', 'maria@example.com', NULL, NULL, '2023-11-22 13:31:33.488152', true);
INSERT INTO public.tuser VALUES ('mary', '123456789', 'Maria', 'Gomez', 'maria@gmail.com', NULL, NULL, '2023-11-22 20:31:18.776448', true);
INSERT INTO public.tuser VALUES ('maruchi', '123456789', 'Maria', 'Gomez', 'maria@gmail.com', NULL, NULL, '2023-11-22 20:36:26.516449', true);
INSERT INTO public.tuser VALUES ('pablo', 'pablo', NULL, NULL, NULL, NULL, NULL, '2023-10-27 11:30:16.119581', true);
INSERT INTO public.tuser VALUES ('alejandra', 'alejandra', NULL, NULL, NULL, NULL, NULL, '2023-10-27 11:30:16.155406', true);
INSERT INTO public.tuser VALUES ('rossi', 'rossi', NULL, NULL, NULL, NULL, NULL, '2023-10-27 11:30:16.184218', true);
INSERT INTO public.tuser VALUES ('alba', 'alba', NULL, NULL, NULL, NULL, NULL, '2023-10-27 11:30:16.255629', true);
INSERT INTO public.tuser VALUES ('alvaro', 'alvaro', NULL, NULL, NULL, NULL, NULL, '2023-11-07 11:26:39.70739', true);
INSERT INTO public.tuser VALUES ('laura', 'laura', NULL, NULL, NULL, NULL, NULL, '2023-11-07 13:36:11.613135', true);
INSERT INTO public.tuser VALUES ('carlos', 'carlos', NULL, NULL, NULL, NULL, NULL, '2023-11-07 13:37:53.086879', true);
INSERT INTO public.tuser VALUES ('marta', 'marta', NULL, NULL, NULL, NULL, NULL, '2023-11-07 13:37:53.114854', true);
INSERT INTO public.tuser VALUES ('cris', '123456789', 'Cris', 'Tina', 'cris@mail.com', NULL, NULL, '2023-11-28 17:51:16.046941', true);
INSERT INTO public.tuser VALUES ('carla', 'carla', NULL, NULL, NULL, NULL, NULL, '2023-11-07 13:44:33.726842', true);
INSERT INTO public.tuser VALUES ('Anarquía', 'LAMIA', 'Anarquía', NULL, NULL, NULL, NULL, '2023-11-11 23:09:13.827552', true);
INSERT INTO public.tuser VALUES ('pedro', 'pedro', 'Pedro', NULL, NULL, NULL, NULL, '2023-11-12 00:19:32.838891', true);
INSERT INTO public.tuser VALUES ('rossiLocaGaming', 'kBH"E=-Qx%AvTf3', 'rossi', 'perez', 'rossi@example.com', NULL, NULL, '2023-11-13 22:44:02.085377', true);
INSERT INTO public.tuser VALUES ('mariMar', '123456789', 'Maria', 'Buenos Aires', 'maria@example.com', NULL, NULL, '2023-11-22 11:43:00.418478', true);
INSERT INTO public.tuser VALUES ('MariSol', '123456789', 'Maria', 'Buenos Aires', 'maria@gmail.com', NULL, NULL, '2023-11-22 12:50:55.35458', true);
INSERT INTO public.tuser VALUES ('rebeca', '123456789', 'Rebeca', 'Gómez', 'rebeca@example.com', NULL, NULL, '2023-11-22 09:31:44.703717', true);


--
-- TOC entry 3060 (class 0 OID 291375)
-- Dependencies: 208
-- Data for Name: tuser_preference; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser_preference VALUES (0, 'user_preference', 'demo', 'Iw0KI1R1ZSBNYXkgMTYgMTI6NTc6MDYgQ0VTVCAyMDE3DQpkZW1vX2FwcF9zdGF0dXNfYmFyX3Zpc2libGU9eWVzDQpkZW1vX2FkanVzdF90cmVlX3NwYWNlPXRydWUNCmRlbW9fYXBwX3dpbmRvd19zdGF0ZT0wDQpkZW1vX3RhYmxlX2NvbmZfc29ydF9maWx0ZXJfZm9ybUN1c3RvbWVyLnhtbF9DdXN0b21lclNlcnZpY2UuY3VzdG9tZXJfVEVTVD1udWxsO251bGw7U1VSTkFNRVw9OThcOjF8SURcPTc1XDoyfE5BTUVcPTk5XDozfENVU1RPTUVSVFlQRUlEXD0wXDo0fENVU1RPTUVSSURcPTEyNVw6NXxBRERSRVNTXD0xMjNcOjZ8UEhPTkVcPTEyMVw6N3xTVEFSVERBVEVcPTEzNlw6OHxMT05HSVRVREVcPTExNlw6OXxMQVRJVFVERVw9MTEzXDoxMHxFTUFJTFw9MTcwXDoxMnw7QkFTRTY0ck8wQUJYTnlBQk5xWVhaaExuVjBhV3d1U0dGemFIUmhZbXhsRTdzUEpTRks1TGdEQUFKR0FBcHNiMkZrUm1GamRHOXlTUUFKZEdoeVpYTm9iMnhrZUhBL1FBQUFBQUFBQ0hjSUFBQUFDd0FBQUFCNA0KZGVtb190YWJsZV9jb25mX3NvcnRfZmlsdGVyX2NvbmZpZ3VyYXRpb25zX2Zvcm1DdXN0b21lci54bWxfQ3VzdG9tZXJTZXJ2aWNlLmN1c3RvbWVyPVRFU1QNCmRlbW9fdGFibGVfY29udHJvbF9wYW5lbF9mb3JtQWNjb3VudHMtZGV0YWlsLnhtbF9Nb3ZlbWVudFNlcnZpY2UubW92ZW1lbnQ9Z3JvdXB0YWJsZWtleTtkZWZhdWx0Y2hhcnRidXR0b247ZXhjZWxleHBvcnRidXR0b247c3Vtcm93YnV0dG9uO2NhbGN1bGVkY29sc2J1dHRvbjtwcmludGluZ2J1dHRvbjtmaWx0ZXJzYXZlYnV0dG9uO3Zpc2libGVjb2xzYnV0dG9uO2h0bWxleHBvcnRidXR0b247Y29weWJ1dHRvbjtncm91cHRhYmxla2V5O2luc2VydGJ1dHRvbjtyZWZyZXNoYnV0dG9uDQpkZW1vX2Zvcm1CcmFuY2hlcy1kZXRhaWwueG1sPTg4MDs1MDU7LTExNTA7MzY5DQpkZW1vX2RldGFpbF9kaWFsb2dfc2l6ZV9wb3NpdGlvbl9mb3JtQ3VzdG9tZXIueG1sX0N1c3RvbWVyU2VydmljZS5jdXN0b21lcj03NDk7MzUwOy0xOTA1OzM5MQ0KZGVtb19hcHBfdG9vbGJhcl9sb2NhdGlvbj1Ob3J0aA0KZGVtb19hcHBfd2luZG93X3Bvc2l0aW9uPS0xNTgwOzExDQpkZW1vX2FwcF93aW5kb3dfc2l6ZT0xNTg0OzEwNDQNCmRlbW9fZm9ybUVtcGxveWVlcy1kZXRhaWwueG1sPTExMTY7NzM5OzYxMDsxOTUNCmRlbW9fZm9ybUFjY291bnRzLWRldGFpbC54bWw9OTE1OzUwMDstMTE1MDszNjkNCg==');


--
-- TOC entry 3052 (class 0 OID 291321)
-- Dependencies: 200
-- Data for Name: tuser_role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser_role VALUES (0, 0, 'demo');


--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 221
-- Name: categories_ca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_ca_id_seq', 19, true);


--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 223
-- Name: goals_go_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.goals_go_id_seq', 74, true);


--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 215
-- Name: groups_gr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.groups_gr_id_seq', 38, true);


--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 217
-- Name: member_group_mg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.member_group_mg_id_seq', 148, true);


--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 219
-- Name: movements_mov_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movements_mov_id_seq', 307, true);


--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 209
-- Name: ti18n_id_i18n_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ti18n_id_i18n_seq', 1, false);


--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 211
-- Name: ti18n_value_id_i18n_value_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ti18n_value_id_i18n_value_seq', 34, false);


--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 203
-- Name: trequest_statistics_id_request_statistics_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trequest_statistics_id_request_statistics_seq', 1, false);


--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 197
-- Name: trole_id_rolename_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trole_id_rolename_seq', 1, false);


--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 213
-- Name: trole_server_permission_id_role_server_permission_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trole_server_permission_id_role_server_permission_seq', 1, false);


--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 201
-- Name: tserver_permission_id_server_permission_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tserver_permission_id_server_permission_seq', 1, false);


--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 205
-- Name: tsetting_id_setting_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tsetting_id_setting_seq', 8, false);


--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 207
-- Name: tuser_preference_id_user_preference_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tuser_preference_id_user_preference_seq', 1, false);


--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 199
-- Name: tuser_role_id_user_role_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tuser_role_id_user_role_seq', 1, false);


--
-- TOC entry 2913 (class 2606 OID 294923)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (ca_id);


--
-- TOC entry 2915 (class 2606 OID 295631)
-- Name: goals goals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_pkey PRIMARY KEY (go_id);


--
-- TOC entry 2905 (class 2606 OID 294213)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (gr_id);


--
-- TOC entry 2907 (class 2606 OID 294226)
-- Name: member_group member_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_group
    ADD CONSTRAINT member_group_pkey PRIMARY KEY (mg_id);


--
-- TOC entry 2911 (class 2606 OID 294913)
-- Name: movements movements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movements
    ADD CONSTRAINT movements_pkey PRIMARY KEY (mov_id);


--
-- TOC entry 2899 (class 2606 OID 291392)
-- Name: ti18n ti18n_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n
    ADD CONSTRAINT ti18n_pkey PRIMARY KEY (id_i18n);


--
-- TOC entry 2901 (class 2606 OID 291404)
-- Name: ti18n_value ti18n_value_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n_value
    ADD CONSTRAINT ti18n_value_pkey PRIMARY KEY (id_i18n_value);


--
-- TOC entry 2893 (class 2606 OID 291360)
-- Name: trequest_statistics trequest_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequest_statistics
    ADD CONSTRAINT trequest_statistics_pkey PRIMARY KEY (id_request_statistics);


--
-- TOC entry 2887 (class 2606 OID 291317)
-- Name: trole trole_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole
    ADD CONSTRAINT trole_pkey PRIMARY KEY (id_rolename);


--
-- TOC entry 2903 (class 2606 OID 291508)
-- Name: trole_server_permission trole_server_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT trole_server_permission_pkey PRIMARY KEY (id_role_server_permission);


--
-- TOC entry 2891 (class 2606 OID 291348)
-- Name: tserver_permission tserver_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tserver_permission
    ADD CONSTRAINT tserver_permission_pkey PRIMARY KEY (id_server_permission);


--
-- TOC entry 2895 (class 2606 OID 291371)
-- Name: tsetting tsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tsetting
    ADD CONSTRAINT tsetting_pkey PRIMARY KEY (id_setting);


--
-- TOC entry 2885 (class 2606 OID 291306)
-- Name: tuser tuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser
    ADD CONSTRAINT tuser_pkey PRIMARY KEY (user_);


--
-- TOC entry 2897 (class 2606 OID 291383)
-- Name: tuser_preference tuser_preference_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_preference
    ADD CONSTRAINT tuser_preference_pkey PRIMARY KEY (id_user_preference);


--
-- TOC entry 2889 (class 2606 OID 291326)
-- Name: tuser_role tuser_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT tuser_role_pkey PRIMARY KEY (id_user_role);


--
-- TOC entry 2909 (class 2606 OID 294961)
-- Name: member_group unique_users; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_group
    ADD CONSTRAINT unique_users UNIQUE (gr_id, user_);


--
-- TOC entry 2923 (class 2606 OID 295003)
-- Name: movements fk_movements_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movements
    ADD CONSTRAINT fk_movements_group_id FOREIGN KEY (gr_id) REFERENCES public.groups(gr_id);


--
-- TOC entry 2917 (class 2606 OID 291332)
-- Name: tuser_role fk_trole; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT fk_trole FOREIGN KEY (id_rolename) REFERENCES public.trole(id_rolename);


--
-- TOC entry 2918 (class 2606 OID 291509)
-- Name: trole_server_permission fk_trole_server_permission; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT fk_trole_server_permission FOREIGN KEY (id_rolename) REFERENCES public.trole(id_rolename);


--
-- TOC entry 2919 (class 2606 OID 291514)
-- Name: trole_server_permission fk_tserver_permission; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT fk_tserver_permission FOREIGN KEY (id_server_permission) REFERENCES public.tserver_permission(id_server_permission);


--
-- TOC entry 2916 (class 2606 OID 291327)
-- Name: tuser_role fk_tuser; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT fk_tuser FOREIGN KEY (user_) REFERENCES public.tuser(user_);


--
-- TOC entry 2922 (class 2606 OID 295648)
-- Name: movements fk_tuser_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movements
    ADD CONSTRAINT fk_tuser_user FOREIGN KEY (user_) REFERENCES public.tuser(user_);


--
-- TOC entry 2926 (class 2606 OID 295637)
-- Name: goals goals_go_ca_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_go_ca_id_fkey FOREIGN KEY (ca_id) REFERENCES public.categories(ca_id);


--
-- TOC entry 2925 (class 2606 OID 295632)
-- Name: goals goals_user__fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_user__fkey FOREIGN KEY (user_) REFERENCES public.tuser(user_);


--
-- TOC entry 2920 (class 2606 OID 294227)
-- Name: member_group member_group_gr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_group
    ADD CONSTRAINT member_group_gr_id_fkey FOREIGN KEY (gr_id) REFERENCES public.groups(gr_id);


--
-- TOC entry 2921 (class 2606 OID 294232)
-- Name: member_group member_group_user__fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_group
    ADD CONSTRAINT member_group_user__fkey FOREIGN KEY (user_) REFERENCES public.tuser(user_);


--
-- TOC entry 2924 (class 2606 OID 295165)
-- Name: movements movements_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movements
    ADD CONSTRAINT movements_fk FOREIGN KEY (ca_id) REFERENCES public.categories(ca_id);


-- Completed on 2023-11-29 15:11:37

--
-- PostgreSQL database dump complete
--

