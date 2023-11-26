--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-11-20 19:15:27

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
-- TOC entry 214 (class 1259 OID 40996)
-- Name: session; Type: TABLE; Schema: public; Owner: skb
--

CREATE TABLE public.session (
    session_id character varying(255) NOT NULL,
    completed_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    status character varying(255),
    user_id character varying(255) NOT NULL,
    workout_id bigint
);


ALTER TABLE public.session OWNER TO skb;

--
-- TOC entry 216 (class 1259 OID 41004)
-- Name: step_record; Type: TABLE; Schema: public; Owner: skb
--

CREATE TABLE public.step_record (
    record_id bigint NOT NULL,
    completed_at timestamp(6) without time zone NOT NULL,
    duration numeric(38,2) NOT NULL,
    step_id bigint NOT NULL,
    session_id character varying(255) NOT NULL
);


ALTER TABLE public.step_record OWNER TO skb;

--
-- TOC entry 215 (class 1259 OID 41003)
-- Name: step_record_record_id_seq; Type: SEQUENCE; Schema: public; Owner: skb
--

CREATE SEQUENCE public.step_record_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.step_record_record_id_seq OWNER TO skb;

--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 215
-- Name: step_record_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skb
--

ALTER SEQUENCE public.step_record_record_id_seq OWNED BY public.step_record.record_id;


--
-- TOC entry 218 (class 1259 OID 41011)
-- Name: workout; Type: TABLE; Schema: public; Owner: skb
--

CREATE TABLE public.workout (
    workout_id bigint NOT NULL,
    category character varying(255) NOT NULL,
    description text,
    difficulty character varying(255) NOT NULL,
    last_modified timestamp(6) without time zone,
    registered_on timestamp(6) without time zone,
    title character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.workout OWNER TO skb;

--
-- TOC entry 219 (class 1259 OID 41019)
-- Name: workout_step; Type: TABLE; Schema: public; Owner: skb
--

CREATE TABLE public.workout_step (
    step_id bigint NOT NULL,
    details text,
    estimated_time integer NOT NULL,
    step_name character varying(255) NOT NULL,
    step_position integer NOT NULL,
    workout_type character varying(255) NOT NULL,
    workout_id bigint NOT NULL
);


ALTER TABLE public.workout_step OWNER TO skb;

--
-- TOC entry 217 (class 1259 OID 41010)
-- Name: workout_workout_id_seq; Type: SEQUENCE; Schema: public; Owner: skb
--

CREATE SEQUENCE public.workout_workout_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workout_workout_id_seq OWNER TO skb;

--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 217
-- Name: workout_workout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skb
--

ALTER SEQUENCE public.workout_workout_id_seq OWNED BY public.workout.workout_id;


--
-- TOC entry 3186 (class 2604 OID 41007)
-- Name: step_record record_id; Type: DEFAULT; Schema: public; Owner: skb
--

ALTER TABLE ONLY public.step_record ALTER COLUMN record_id SET DEFAULT nextval('public.step_record_record_id_seq'::regclass);


--
-- TOC entry 3187 (class 2604 OID 41014)
-- Name: workout workout_id; Type: DEFAULT; Schema: public; Owner: skb
--

ALTER TABLE ONLY public.workout ALTER COLUMN workout_id SET DEFAULT nextval('public.workout_workout_id_seq'::regclass);


--
-- TOC entry 3189 (class 2606 OID 41002)
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: skb
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (session_id);


--
-- TOC entry 3191 (class 2606 OID 41009)
-- Name: step_record step_record_pkey; Type: CONSTRAINT; Schema: public; Owner: skb
--

ALTER TABLE ONLY public.step_record
    ADD CONSTRAINT step_record_pkey PRIMARY KEY (record_id);


--
-- TOC entry 3193 (class 2606 OID 41018)
-- Name: workout workout_pkey; Type: CONSTRAINT; Schema: public; Owner: skb
--

ALTER TABLE ONLY public.workout
    ADD CONSTRAINT workout_pkey PRIMARY KEY (workout_id);


--
-- TOC entry 3195 (class 2606 OID 41025)
-- Name: workout_step workout_step_pkey; Type: CONSTRAINT; Schema: public; Owner: skb
--

ALTER TABLE ONLY public.workout_step
    ADD CONSTRAINT workout_step_pkey PRIMARY KEY (step_id, workout_id);


--
-- TOC entry 3196 (class 2606 OID 41026)
-- Name: step_record fk5ia8vcbom2kbnxjwwb2y90cq5; Type: FK CONSTRAINT; Schema: public; Owner: skb
--

ALTER TABLE ONLY public.step_record
    ADD CONSTRAINT fk5ia8vcbom2kbnxjwwb2y90cq5 FOREIGN KEY (session_id) REFERENCES public.session(session_id);


--
-- TOC entry 3197 (class 2606 OID 41031)
-- Name: workout_step fkk1ih8quahf6l9qc2rjcbjtds5; Type: FK CONSTRAINT; Schema: public; Owner: skb
--

ALTER TABLE ONLY public.workout_step
    ADD CONSTRAINT fkk1ih8quahf6l9qc2rjcbjtds5 FOREIGN KEY (workout_id) REFERENCES public.workout(workout_id);


-- Completed on 2023-11-20 19:15:27

--
-- PostgreSQL database dump complete
--

