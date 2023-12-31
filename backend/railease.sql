PGDMP     #                    {            postgres    15.4    15.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    5    postgres    DATABASE     {   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3354                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false                       0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16439    class    TABLE     }   CREATE TABLE public.class (
    code character varying(4) NOT NULL,
    name character varying(20),
    noofseats integer
);
    DROP TABLE public.class;
       public         heap    postgres    false            �            1259    16419    station    TABLE     p   CREATE TABLE public.station (
    stn character varying(4) NOT NULL,
    name character varying(20) NOT NULL
);
    DROP TABLE public.station;
       public         heap    postgres    false            �            1259    16424    stops    TABLE     �   CREATE TABLE public.stops (
    tno integer NOT NULL,
    stn character varying(4) NOT NULL,
    arrival time without time zone,
    departure time without time zone,
    elapsed interval
);
    DROP TABLE public.stops;
       public         heap    postgres    false            �            1259    24627    ticket    TABLE     O   CREATE TABLE public.ticket (
    pnr integer NOT NULL,
    passengers jsonb
);
    DROP TABLE public.ticket;
       public         heap    postgres    false            �            1259    16398    train    TABLE     �   CREATE TABLE public.train (
    trainno integer NOT NULL,
    tname character varying(30) NOT NULL,
    source character varying(30) NOT NULL,
    dest character varying(30) NOT NULL,
    run character varying(7)
);
    DROP TABLE public.train;
       public         heap    postgres    false            �            1259    24634    users    TABLE     �   CREATE TABLE public.users (
    userid character varying(20) NOT NULL,
    name character varying(40),
    dob character varying(15),
    mob integer,
    email character varying(20),
    password character varying(40)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �           2606    16443    class class_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (code);
 :   ALTER TABLE ONLY public.class DROP CONSTRAINT class_pkey;
       public            postgres    false    218            ~           2606    16428    stops pk_stop 
   CONSTRAINT     Q   ALTER TABLE ONLY public.stops
    ADD CONSTRAINT pk_stop PRIMARY KEY (tno, stn);
 7   ALTER TABLE ONLY public.stops DROP CONSTRAINT pk_stop;
       public            postgres    false    217    217            |           2606    16423    station station_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_pkey PRIMARY KEY (stn);
 >   ALTER TABLE ONLY public.station DROP CONSTRAINT station_pkey;
       public            postgres    false    216            �           2606    24633    ticket ticket_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (pnr);
 <   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_pkey;
       public            postgres    false    219            z           2606    16402    train train_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.train
    ADD CONSTRAINT train_pkey PRIMARY KEY (trainno);
 :   ALTER TABLE ONLY public.train DROP CONSTRAINT train_pkey;
       public            postgres    false    215            �           2606    24638    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220            �           2606    16434    stops fk_stn    FK CONSTRAINT     j   ALTER TABLE ONLY public.stops
    ADD CONSTRAINT fk_stn FOREIGN KEY (stn) REFERENCES public.station(stn);
 6   ALTER TABLE ONLY public.stops DROP CONSTRAINT fk_stn;
       public          postgres    false    216    217    3196            �           2606    16429    stops fk_tno    FK CONSTRAINT     l   ALTER TABLE ONLY public.stops
    ADD CONSTRAINT fk_tno FOREIGN KEY (tno) REFERENCES public.train(trainno);
 6   ALTER TABLE ONLY public.stops DROP CONSTRAINT fk_tno;
       public          postgres    false    217    3194    215           