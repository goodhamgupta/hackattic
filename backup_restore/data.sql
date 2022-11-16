--
-- PostgreSQL database dump
--

-- Dumped from database version 10.19 (Debian 10.19-1.pgdg90+1)
-- Dumped by pg_dump version 10.19 (Debian 10.19-1.pgdg90+1)

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


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: criminal_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.criminal_records (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    felony character varying(30) NOT NULL,
    ssn character varying(11) NOT NULL,
    home_address character varying(100) NOT NULL,
    entry timestamp without time zone NOT NULL,
    city character varying(100) NOT NULL,
    status character varying(16) NOT NULL
);


ALTER TABLE public.criminal_records OWNER TO postgres;

--
-- Name: criminal_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.criminal_records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criminal_records_id_seq OWNER TO postgres;

--
-- Name: criminal_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.criminal_records_id_seq OWNED BY public.criminal_records.id;


--
-- Name: criminal_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criminal_records ALTER COLUMN id SET DEFAULT nextval('public.criminal_records_id_seq'::regclass);


--
-- Data for Name: criminal_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.criminal_records (id, name, felony, ssn, home_address, entry, city, status) FROM stdin;
1	Madison Ross	Check fraud	449-18-4175	74357 Amanda Fork	1970-11-16 00:00:00	Sandovalview, CT 49838	missing
2	Stephen Mueller	Tax evasion	333-78-3577	2554 Matthews Square	2001-02-26 00:00:00	Yvonneton, IA 63615-0365	terminated
3	Heather Greene	Tax evasion	573-08-5426	0917 Jenkins Meadow	2012-03-14 00:00:00	New Olivia, AK 15374	missing
4	David Evans	Animal cruelty	465-75-4509	486 Troy Knoll Suite 310	2003-09-26 00:00:00	Solisville, AS 95607-0742	missing
5	Tracy Mitchell	Animal cruelty	708-08-3951	5742 Henderson Island	2019-03-31 00:00:00	West Isaac, AS 96548-1895	alive
6	Melanie Prince	Tax evasion	161-52-3069	947 Summers Court	2010-11-27 00:00:00	Kevinville, CA 06097	missing
7	Dr. Jeremiah Taylor	Obstruction of justice	637-76-7717	1047 Robert Roads Suite 687	2020-03-23 00:00:00	Andersonside, ID 56662	missing
8	Jeremy Robinson	Larceny	454-52-6286	PSC 6479, Box 7452	1978-11-24 00:00:00	APO AA 02145	terminated
9	Shelly Bridges	Tax evasion	508-17-2847	8965 Andrew Tunnel	1989-11-25 00:00:00	Clarkchester, MD 98939	alive
10	Tammy Mitchell	Animal cruelty	144-26-4224	USS Carr	2009-05-07 00:00:00	FPO AA 79805	missing
11	Ashley Smith	Obstruction of justice	538-19-0220	965 Erica Station Suite 392	1974-08-03 00:00:00	Lake Daniel, DC 99196	alive
12	Jacqueline Smith	Larceny	857-18-0114	5890 Freeman Estates Apt. 443	2005-08-15 00:00:00	Loweland, CO 82592	missing
13	Christina Mosley	Obstruction of justice	005-35-9375	4501 Lisa Lake	1998-01-08 00:00:00	Millerville, KS 75654	missing
14	Mathew Sanchez	Obstruction of justice	591-97-6467	213 Katherine Loaf Apt. 702	1980-02-17 00:00:00	Cunninghamberg, DE 29723-2241	alive
15	Rachel Roberts	Manslaughter	328-42-4664	360 Edwards Bridge Suite 398	2016-06-13 00:00:00	Petersonstad, OK 97056	missing
16	Kirk Hernandez	Burglary	368-70-9321	4135 Garrett Union	2003-09-22 00:00:00	East Staceyborough, AK 40099-4192	missing
17	Kimberly Harris	Burglary	187-40-1553	902 Deborah Village	1982-03-24 00:00:00	Michaelmouth, IL 75812-6644	missing
18	Jeffrey Knapp	Check fraud	313-62-5880	8130 Herrera Crossing Suite 727	1973-07-22 00:00:00	Port Jessicastad, ID 75921-2233	alive
19	Tina Duarte	Manslaughter	618-28-5846	1381 Maldonado Forge Suite 096	1976-08-22 00:00:00	West Aaronland, DE 95379	terminated
20	Christopher Malone	Tax evasion	476-89-3088	00392 Juan Mountain Apt. 021	1974-08-08 00:00:00	Hodgechester, RI 32345-0535	missing
21	Lisa West	Check fraud	809-16-5310	78761 Barnes Stravenue Suite 913	1982-05-10 00:00:00	Sylviaside, AL 71980-8443	alive
22	Miranda Kennedy	Arson	755-21-7222	2481 Joshua Motorway Suite 404	2010-12-27 00:00:00	Josephville, MI 16875-5042	missing
23	Brian Mcclure	Obstruction of justice	210-33-0910	9384 Amanda Underpass	1974-07-20 00:00:00	Lake Benjaminside, WA 28505-6172	terminated
24	Renee Green	Manslaughter	350-11-4034	00158 Raymond Stravenue	2003-01-28 00:00:00	Amandaborough, VT 46205	alive
25	Paul Patel	Vehicular homicide	502-69-4704	430 Clarke Isle Suite 623	1972-06-01 00:00:00	New Joshua, NV 46062	alive
26	James Miller	Obstruction of justice	760-66-4971	917 Wood Cape	1979-12-19 00:00:00	Lake Robertbury, MP 98568-7284	missing
27	Dennis Le	Perjury	373-10-1326	6470 Morris Forest	1987-01-16 00:00:00	East Matthewland, SD 39760	missing
28	Nancy West	Perjury	486-66-7815	88960 Henderson Forges Suite 669	2019-01-25 00:00:00	East Brianaburgh, AL 31538-3880	alive
29	Laura Carroll	Check fraud	618-42-4158	Unit 5240 Box 5463	2021-05-26 00:00:00	DPO AE 16950-6146	missing
30	Thomas Thomas	Burglary	704-59-3973	1034 Troy Lane Apt. 314	1983-05-16 00:00:00	New Lisamouth, PW 92502	alive
31	Alexandra Allison	Burglary	173-22-9686	5768 Jones Key Suite 076	1976-08-05 00:00:00	South Carrieborough, SC 33761	terminated
32	Thomas Gibson	Arson	105-44-1436	417 Anderson Grove Suite 867	1980-03-15 00:00:00	West Nicole, OH 55436	alive
33	James Fowler	Perjury	222-71-2939	8400 Emily Extension	2003-09-27 00:00:00	Matthewberg, RI 24107-7301	alive
34	Stephanie Smith	Burglary	573-97-4749	2833 Aguilar Extension	1991-06-08 00:00:00	Cynthiaburgh, ME 76386-6286	terminated
35	Kevin Kennedy	Check fraud	882-12-8338	8286 Lauren Squares	1995-10-14 00:00:00	South Julia, WI 03285	terminated
36	William Burton	Larceny	646-40-4564	0536 Moran Skyway Apt. 888	1978-07-08 00:00:00	Zamorashire, ME 34799-7928	terminated
37	Theresa Davis	Animal cruelty	402-55-8793	08831 Johnson Falls	1980-03-06 00:00:00	West Cassandraborough, AR 76813-0070	terminated
38	William Jones	Check fraud	387-35-2192	850 Williams Meadows	1997-05-09 00:00:00	Nicholaschester, WV 67745-9321	terminated
39	Terri Pierce	Manslaughter	469-31-2442	2184 Bethany Stream Apt. 067	1971-01-05 00:00:00	Hesterville, MH 66703	terminated
40	Joseph Harris	Check fraud	011-89-9240	198 Andre Burg Suite 797	2002-09-18 00:00:00	West Robert, PW 41321-6788	missing
41	Alicia Compton	Perjury	708-70-3737	848 Powers Islands Suite 429	1988-11-10 00:00:00	Rasmussenmouth, MH 44878-5347	terminated
42	Matthew Webb	Animal cruelty	810-47-5340	281 Stephanie Ways	1991-01-28 00:00:00	Yubury, UT 30673	alive
43	Jacqueline Pollard	Larceny	539-30-7327	5672 Michelle Square	2006-09-05 00:00:00	East Alexandermouth, TN 35187-4334	terminated
44	Ms. Brenda Ayers	Perjury	319-29-3215	85016 Williams Summit Apt. 740	1988-10-07 00:00:00	Smithborough, CT 46523-0846	missing
45	Joseph Harrison	Arson	131-76-3343	762 Murphy Divide Apt. 220	2012-10-29 00:00:00	Seanbury, TX 63405-8163	alive
46	Sandra Vang	Larceny	661-72-5463	6848 Amber Way Apt. 858	2005-10-06 00:00:00	Josephborough, DC 68909-7639	missing
47	Kevin Romero	Perjury	899-14-6618	998 Joshua Squares	1984-09-25 00:00:00	New Alfred, OR 95183-8805	terminated
48	Priscilla Lee	Obstruction of justice	168-23-0444	050 Olson Road Suite 263	2020-06-30 00:00:00	Ortizberg, ID 93277	missing
49	Maria Perez	Tax evasion	204-02-0300	57711 Warren Parks	2005-03-27 00:00:00	West Patriciaville, VT 49442-2295	alive
50	Heather Lee	Arson	133-74-9152	9533 David Crescent Apt. 857	2004-08-24 00:00:00	Jameschester, TN 24117	terminated
51	Mary Castillo	Vehicular homicide	056-51-7225	6967 Roach Summit Suite 692	1984-03-06 00:00:00	North Erinshire, PA 71251	terminated
52	John Hernandez	Check fraud	594-10-0814	121 Tammy Ports Suite 816	1976-08-04 00:00:00	Bobbymouth, GA 51443	alive
53	Henry Conley	Burglary	401-34-0672	50880 Calhoun Loop	2003-12-09 00:00:00	Katieburgh, FL 76578-5625	terminated
54	Paul Jacobs	Arson	725-94-3482	2354 Hernandez Inlet	1990-07-01 00:00:00	Port Nicholasstad, MT 32613-3810	missing
55	Brian Patrick	Vehicular homicide	421-86-1914	106 Richard Mews	1994-06-02 00:00:00	Glassville, VA 16007-8999	missing
56	Elizabeth Chung	Check fraud	143-52-0864	7731 King Plaza	2014-01-02 00:00:00	Martinezbury, OH 29170	alive
57	Todd Hunt	Tax evasion	556-90-0194	68682 Reilly Mission	1972-12-02 00:00:00	Luceroland, IA 40265	missing
58	Andrew Green	Check fraud	535-75-5114	7889 Sandra Bypass	1981-02-09 00:00:00	Lake Lydia, DE 16265-2593	alive
59	Lisa Smith	Tax evasion	428-81-0392	72603 Edgar Mountains	1973-03-31 00:00:00	Ortiztown, MS 73669-8533	alive
60	Patrick Contreras MD	Larceny	859-27-4776	PSC 1713, Box 4699	2003-11-03 00:00:00	APO AP 93445	missing
61	Andrea Collins	Obstruction of justice	426-32-1150	6527 Valerie Streets Apt. 791	1989-12-01 00:00:00	Laurenville, NH 14630	missing
62	Holly Bryant	Perjury	114-75-2776	203 Nelson Roads Suite 626	1974-04-24 00:00:00	East Jesse, IA 76137	missing
63	Mark Nelson	Vehicular homicide	104-03-8848	474 Tucker Corner	2006-02-09 00:00:00	South Taylorchester, GU 68352	terminated
64	Tracy Matthews	Animal cruelty	575-16-7808	09519 Reyes Stream Apt. 689	2007-03-13 00:00:00	New Danielle, VT 92486-4482	missing
65	Valerie Howard	Arson	828-32-9142	6766 Taylor Estate Apt. 220	1970-03-21 00:00:00	Wardview, MD 20624	terminated
66	Jane Swanson	Check fraud	399-64-1922	387 Bennett Crossing Suite 535	1999-09-19 00:00:00	Barrland, VA 17337	terminated
67	Tony Hoover	Burglary	140-43-6557	3726 White Station Apt. 654	2003-09-30 00:00:00	Paulfort, OK 74989-7356	missing
68	Johnny Watkins	Arson	827-09-9920	705 Daniels Meadow	2004-11-04 00:00:00	South Michelle, ME 54815	missing
69	Jeffrey Patel	Larceny	898-26-2190	54739 James Spur Suite 166	1997-09-29 00:00:00	Martinezland, WV 67559-4752	missing
70	Erica Henderson	Animal cruelty	579-41-2403	729 Moran Springs Apt. 594	1992-02-05 00:00:00	Luischester, GU 05493-5832	missing
71	Greg Johnson	Larceny	450-23-7150	498 Campos Divide	2000-05-08 00:00:00	Port Williamfurt, WY 11711-9839	alive
72	Wendy Smith	Burglary	168-97-0099	64756 Parker Viaduct	2012-08-07 00:00:00	Marcusberg, ND 47252-7637	alive
73	Raymond Nguyen	Check fraud	430-49-6475	7776 Susan Stream Suite 830	1990-09-02 00:00:00	Destinyview, NH 55941-0177	missing
74	Stephen Griffith	Perjury	832-78-7200	655 Kimberly Extension Apt. 258	2002-03-01 00:00:00	Sharonberg, WV 34917-9422	missing
75	Isaac Garcia	Manslaughter	218-17-4362	02473 Jesse Streets Apt. 130	2014-08-19 00:00:00	Port Sandraland, IL 89004	alive
76	Robin Murphy	Perjury	101-08-8348	USS Bradford	1972-12-14 00:00:00	FPO AA 40588	terminated
77	Samantha Kelley	Animal cruelty	869-81-6007	366 Michael Prairie Suite 805	1995-10-29 00:00:00	Lewisshire, MI 78229-3005	missing
78	Brandon Williams	Burglary	771-47-7873	62349 Richard Bypass Apt. 244	1974-02-24 00:00:00	Roseside, IA 08928	terminated
79	Savannah Mendez	Arson	834-81-3978	43243 Jones Inlet Suite 690	1997-08-31 00:00:00	East Jacobfurt, WI 56763-9202	alive
80	Brittany Williams	Manslaughter	126-40-5197	56485 Campbell Via	2020-12-20 00:00:00	North Devinfurt, NM 54628-0951	alive
81	Patrick Fox	Check fraud	054-27-6790	37546 Jill Walk	2006-12-07 00:00:00	Port Vickieland, WA 32853	terminated
\.


--
-- Name: criminal_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.criminal_records_id_seq', 81, true);


--
-- Name: criminal_records criminal_records_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criminal_records
    ADD CONSTRAINT criminal_records_pk PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

