PGDMP     2    "        
        }            baseproyectoinnovasoft    15.10    15.10 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16912    baseproyectoinnovasoft    DATABASE     �   CREATE DATABASE baseproyectoinnovasoft WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
 &   DROP DATABASE baseproyectoinnovasoft;
                postgres    false            �            1259    16958    accesos    TABLE     v   CREATE TABLE public.accesos (
    id integer NOT NULL,
    id_rol integer NOT NULL,
    id_opcion integer NOT NULL
);
    DROP TABLE public.accesos;
       public         heap    postgres    false            �            1259    16957    accesos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accesos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.accesos_id_seq;
       public          postgres    false    223            �           0    0    accesos_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.accesos_id_seq OWNED BY public.accesos.id;
          public          postgres    false    222            �            1259    17071    alertavencimiento    TABLE     �   CREATE TABLE public.alertavencimiento (
    id integer NOT NULL,
    id_producto integer NOT NULL,
    fecha_alerta timestamp without time zone NOT NULL,
    estado_alerta character varying(50) NOT NULL
);
 %   DROP TABLE public.alertavencimiento;
       public         heap    postgres    false            �            1259    17070    alertavencimiento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.alertavencimiento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.alertavencimiento_id_seq;
       public          postgres    false    239            �           0    0    alertavencimiento_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.alertavencimiento_id_seq OWNED BY public.alertavencimiento.id;
          public          postgres    false    238            �            1259    16984    areas    TABLE     �   CREATE TABLE public.areas (
    id integer NOT NULL,
    nombre_area character varying(255) NOT NULL,
    id_centro_formacion integer NOT NULL
);
    DROP TABLE public.areas;
       public         heap    postgres    false            �            1259    17013    areas_centros_formacion    TABLE     �   CREATE TABLE public.areas_centros_formacion (
    id integer NOT NULL,
    id_area integer NOT NULL,
    id_centro_formacion integer NOT NULL
);
 +   DROP TABLE public.areas_centros_formacion;
       public         heap    postgres    false            �            1259    17012    areas_centros_formacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.areas_centros_formacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.areas_centros_formacion_id_seq;
       public          postgres    false    231            �           0    0    areas_centros_formacion_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.areas_centros_formacion_id_seq OWNED BY public.areas_centros_formacion.id;
          public          postgres    false    230            �            1259    16983    areas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.areas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.areas_id_seq;
       public          postgres    false    227            �           0    0    areas_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;
          public          postgres    false    226            �            1259    17044    bodega    TABLE     �   CREATE TABLE public.bodega (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    ubicacion character varying(255)
);
    DROP TABLE public.bodega;
       public         heap    postgres    false            �            1259    17043    bodega_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bodega_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.bodega_id_seq;
       public          postgres    false    235            �           0    0    bodega_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.bodega_id_seq OWNED BY public.bodega.id;
          public          postgres    false    234            �            1259    16975    centroformacion    TABLE     �   CREATE TABLE public.centroformacion (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    ubicacion character varying(255),
    telefono character varying(20)
);
 #   DROP TABLE public.centroformacion;
       public         heap    postgres    false            �            1259    16974    centroformacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.centroformacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.centroformacion_id_seq;
       public          postgres    false    225            �           0    0    centroformacion_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.centroformacion_id_seq OWNED BY public.centroformacion.id;
          public          postgres    false    224            �            1259    17136    detallesentrega    TABLE       CREATE TABLE public.detallesentrega (
    id integer NOT NULL,
    id_entrega integer NOT NULL,
    id_producto integer NOT NULL,
    id_instructor_receptor integer,
    id_ficha_formacion integer,
    visto_bueno_aprendiz boolean DEFAULT false NOT NULL
);
 #   DROP TABLE public.detallesentrega;
       public         heap    postgres    false            �            1259    17135    detallesentrega_id_seq    SEQUENCE     �   CREATE SEQUENCE public.detallesentrega_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.detallesentrega_id_seq;
       public          postgres    false    247            �           0    0    detallesentrega_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.detallesentrega_id_seq OWNED BY public.detallesentrega.id;
          public          postgres    false    246            �            1259    17096    detallesolicitud    TABLE     �   CREATE TABLE public.detallesolicitud (
    id integer NOT NULL,
    id_solicitud integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad_solicitada integer NOT NULL,
    observaciones text
);
 $   DROP TABLE public.detallesolicitud;
       public         heap    postgres    false            �            1259    17095    detallesolicitud_id_seq    SEQUENCE     �   CREATE SEQUENCE public.detallesolicitud_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.detallesolicitud_id_seq;
       public          postgres    false    243            �           0    0    detallesolicitud_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.detallesolicitud_id_seq OWNED BY public.detallesolicitud.id;
          public          postgres    false    242            �            1259    17115    entregamaterial    TABLE     �   CREATE TABLE public.entregamaterial (
    id integer NOT NULL,
    id_solicitud integer NOT NULL,
    id_usuario_responsable integer NOT NULL,
    fecha_entrega timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    observaciones text
);
 #   DROP TABLE public.entregamaterial;
       public         heap    postgres    false            �            1259    17114    entregamaterial_id_seq    SEQUENCE     �   CREATE SEQUENCE public.entregamaterial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.entregamaterial_id_seq;
       public          postgres    false    245            �           0    0    entregamaterial_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.entregamaterial_id_seq OWNED BY public.entregamaterial.id;
          public          postgres    false    244            �            1259    17161    fichasformacion    TABLE     �   CREATE TABLE public.fichasformacion (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    id_titulado integer NOT NULL
);
 #   DROP TABLE public.fichasformacion;
       public         heap    postgres    false            �            1259    17160    fichasformacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.fichasformacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.fichasformacion_id_seq;
       public          postgres    false    251            �           0    0    fichasformacion_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.fichasformacion_id_seq OWNED BY public.fichasformacion.id;
          public          postgres    false    250            �            1259    16951    opciones    TABLE     f   CREATE TABLE public.opciones (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.opciones;
       public         heap    postgres    false            �            1259    16950    opciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.opciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.opciones_id_seq;
       public          postgres    false    221            �           0    0    opciones_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.opciones_id_seq OWNED BY public.opciones.id;
          public          postgres    false    220            �            1259    17030 	   productos    TABLE     T  CREATE TABLE public.productos (
    id integer NOT NULL,
    codigo_sena character varying(50),
    unspc character varying(50),
    nombre character varying(255) NOT NULL,
    descripcion text,
    cantidad integer NOT NULL,
    unidad_medida character varying(50) NOT NULL,
    id_area integer,
    tipo_material character varying(50)
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    17029    productos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.productos_id_seq;
       public          postgres    false    233            �           0    0    productos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;
          public          postgres    false    232            �            1259    17053    registroproductos    TABLE     �   CREATE TABLE public.registroproductos (
    id integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer NOT NULL,
    id_bodega integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 %   DROP TABLE public.registroproductos;
       public         heap    postgres    false            �            1259    17052    registroproductos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.registroproductos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.registroproductos_id_seq;
       public          postgres    false    237            �           0    0    registroproductos_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.registroproductos_id_seq OWNED BY public.registroproductos.id;
          public          postgres    false    236            �            1259    16927    roles    TABLE     f   CREATE TABLE public.roles (
    id integer NOT NULL,
    nombre_rol character varying(50) NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    16926    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    217            �           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    216            �            1259    16934    roles_usuarios    TABLE     ~   CREATE TABLE public.roles_usuarios (
    id integer NOT NULL,
    id_usuario integer NOT NULL,
    id_rol integer NOT NULL
);
 "   DROP TABLE public.roles_usuarios;
       public         heap    postgres    false            �            1259    16933    roles_usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.roles_usuarios_id_seq;
       public          postgres    false    219            �           0    0    roles_usuarios_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.roles_usuarios_id_seq OWNED BY public.roles_usuarios.id;
          public          postgres    false    218            �            1259    17083    solicitudes    TABLE     �   CREATE TABLE public.solicitudes (
    id integer NOT NULL,
    id_usuario_solicitante integer NOT NULL,
    fecha_solicitud timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    estado_solicitud character varying(50) NOT NULL
);
    DROP TABLE public.solicitudes;
       public         heap    postgres    false            �            1259    17082    solicitudes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.solicitudes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.solicitudes_id_seq;
       public          postgres    false    241            �           0    0    solicitudes_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.solicitudes_id_seq OWNED BY public.solicitudes.id;
          public          postgres    false    240            �            1259    17154 	   titulados    TABLE     g   CREATE TABLE public.titulados (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL
);
    DROP TABLE public.titulados;
       public         heap    postgres    false            �            1259    17153    titulados_id_seq    SEQUENCE     �   CREATE SEQUENCE public.titulados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.titulados_id_seq;
       public          postgres    false    249            �           0    0    titulados_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.titulados_id_seq OWNED BY public.titulados.id;
          public          postgres    false    248            �            1259    16914    usuarios    TABLE     [  CREATE TABLE public.usuarios (
    id integer NOT NULL,
    apellido character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL,
    cedula character varying(20) NOT NULL,
    email character varying(255) NOT NULL,
    telefono character varying(20),
    cargo character varying(100),
    id_area integer,
    id_ficha integer
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    16996    usuarios_centros_formacion    TABLE     �   CREATE TABLE public.usuarios_centros_formacion (
    id integer NOT NULL,
    id_usuario integer NOT NULL,
    id_centro_formacion integer NOT NULL
);
 .   DROP TABLE public.usuarios_centros_formacion;
       public         heap    postgres    false            �            1259    16995 !   usuarios_centros_formacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_centros_formacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.usuarios_centros_formacion_id_seq;
       public          postgres    false    229            �           0    0 !   usuarios_centros_formacion_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.usuarios_centros_formacion_id_seq OWNED BY public.usuarios_centros_formacion.id;
          public          postgres    false    228            �            1259    16913    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    215            �           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    214            �           2604    16961 
   accesos id    DEFAULT     h   ALTER TABLE ONLY public.accesos ALTER COLUMN id SET DEFAULT nextval('public.accesos_id_seq'::regclass);
 9   ALTER TABLE public.accesos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    17074    alertavencimiento id    DEFAULT     |   ALTER TABLE ONLY public.alertavencimiento ALTER COLUMN id SET DEFAULT nextval('public.alertavencimiento_id_seq'::regclass);
 C   ALTER TABLE public.alertavencimiento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239            �           2604    16987    areas id    DEFAULT     d   ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);
 7   ALTER TABLE public.areas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    17016    areas_centros_formacion id    DEFAULT     �   ALTER TABLE ONLY public.areas_centros_formacion ALTER COLUMN id SET DEFAULT nextval('public.areas_centros_formacion_id_seq'::regclass);
 I   ALTER TABLE public.areas_centros_formacion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            �           2604    17047 	   bodega id    DEFAULT     f   ALTER TABLE ONLY public.bodega ALTER COLUMN id SET DEFAULT nextval('public.bodega_id_seq'::regclass);
 8   ALTER TABLE public.bodega ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    16978    centroformacion id    DEFAULT     x   ALTER TABLE ONLY public.centroformacion ALTER COLUMN id SET DEFAULT nextval('public.centroformacion_id_seq'::regclass);
 A   ALTER TABLE public.centroformacion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    17139    detallesentrega id    DEFAULT     x   ALTER TABLE ONLY public.detallesentrega ALTER COLUMN id SET DEFAULT nextval('public.detallesentrega_id_seq'::regclass);
 A   ALTER TABLE public.detallesentrega ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    247    247            �           2604    17099    detallesolicitud id    DEFAULT     z   ALTER TABLE ONLY public.detallesolicitud ALTER COLUMN id SET DEFAULT nextval('public.detallesolicitud_id_seq'::regclass);
 B   ALTER TABLE public.detallesolicitud ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243            �           2604    17118    entregamaterial id    DEFAULT     x   ALTER TABLE ONLY public.entregamaterial ALTER COLUMN id SET DEFAULT nextval('public.entregamaterial_id_seq'::regclass);
 A   ALTER TABLE public.entregamaterial ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    244    245            �           2604    17164    fichasformacion id    DEFAULT     x   ALTER TABLE ONLY public.fichasformacion ALTER COLUMN id SET DEFAULT nextval('public.fichasformacion_id_seq'::regclass);
 A   ALTER TABLE public.fichasformacion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    251    251            �           2604    16954    opciones id    DEFAULT     j   ALTER TABLE ONLY public.opciones ALTER COLUMN id SET DEFAULT nextval('public.opciones_id_seq'::regclass);
 :   ALTER TABLE public.opciones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    17033    productos id    DEFAULT     l   ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);
 ;   ALTER TABLE public.productos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    17056    registroproductos id    DEFAULT     |   ALTER TABLE ONLY public.registroproductos ALTER COLUMN id SET DEFAULT nextval('public.registroproductos_id_seq'::regclass);
 C   ALTER TABLE public.registroproductos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    16930    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    16937    roles_usuarios id    DEFAULT     v   ALTER TABLE ONLY public.roles_usuarios ALTER COLUMN id SET DEFAULT nextval('public.roles_usuarios_id_seq'::regclass);
 @   ALTER TABLE public.roles_usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    17086    solicitudes id    DEFAULT     p   ALTER TABLE ONLY public.solicitudes ALTER COLUMN id SET DEFAULT nextval('public.solicitudes_id_seq'::regclass);
 =   ALTER TABLE public.solicitudes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            �           2604    17157    titulados id    DEFAULT     l   ALTER TABLE ONLY public.titulados ALTER COLUMN id SET DEFAULT nextval('public.titulados_id_seq'::regclass);
 ;   ALTER TABLE public.titulados ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248    249            �           2604    16917    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    16999    usuarios_centros_formacion id    DEFAULT     �   ALTER TABLE ONLY public.usuarios_centros_formacion ALTER COLUMN id SET DEFAULT nextval('public.usuarios_centros_formacion_id_seq'::regclass);
 L   ALTER TABLE public.usuarios_centros_formacion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            �          0    16958    accesos 
   TABLE DATA           8   COPY public.accesos (id, id_rol, id_opcion) FROM stdin;
    public          postgres    false    223   ��       �          0    17071    alertavencimiento 
   TABLE DATA           Y   COPY public.alertavencimiento (id, id_producto, fecha_alerta, estado_alerta) FROM stdin;
    public          postgres    false    239   �       �          0    16984    areas 
   TABLE DATA           E   COPY public.areas (id, nombre_area, id_centro_formacion) FROM stdin;
    public          postgres    false    227   5�       �          0    17013    areas_centros_formacion 
   TABLE DATA           S   COPY public.areas_centros_formacion (id, id_area, id_centro_formacion) FROM stdin;
    public          postgres    false    231   R�       �          0    17044    bodega 
   TABLE DATA           7   COPY public.bodega (id, nombre, ubicacion) FROM stdin;
    public          postgres    false    235   o�       �          0    16975    centroformacion 
   TABLE DATA           J   COPY public.centroformacion (id, nombre, ubicacion, telefono) FROM stdin;
    public          postgres    false    225   ��       �          0    17136    detallesentrega 
   TABLE DATA           �   COPY public.detallesentrega (id, id_entrega, id_producto, id_instructor_receptor, id_ficha_formacion, visto_bueno_aprendiz) FROM stdin;
    public          postgres    false    247   ��       �          0    17096    detallesolicitud 
   TABLE DATA           m   COPY public.detallesolicitud (id, id_solicitud, id_producto, cantidad_solicitada, observaciones) FROM stdin;
    public          postgres    false    243   ��       �          0    17115    entregamaterial 
   TABLE DATA           q   COPY public.entregamaterial (id, id_solicitud, id_usuario_responsable, fecha_entrega, observaciones) FROM stdin;
    public          postgres    false    245   ��       �          0    17161    fichasformacion 
   TABLE DATA           B   COPY public.fichasformacion (id, nombre, id_titulado) FROM stdin;
    public          postgres    false    251    �       �          0    16951    opciones 
   TABLE DATA           .   COPY public.opciones (id, nombre) FROM stdin;
    public          postgres    false    221   �       �          0    17030 	   productos 
   TABLE DATA           �   COPY public.productos (id, codigo_sena, unspc, nombre, descripcion, cantidad, unidad_medida, id_area, tipo_material) FROM stdin;
    public          postgres    false    233   :�       �          0    17053    registroproductos 
   TABLE DATA           a   COPY public.registroproductos (id, id_producto, cantidad, id_bodega, fecha_registro) FROM stdin;
    public          postgres    false    237   W�       �          0    16927    roles 
   TABLE DATA           /   COPY public.roles (id, nombre_rol) FROM stdin;
    public          postgres    false    217   t�       �          0    16934    roles_usuarios 
   TABLE DATA           @   COPY public.roles_usuarios (id, id_usuario, id_rol) FROM stdin;
    public          postgres    false    219   ��       �          0    17083    solicitudes 
   TABLE DATA           d   COPY public.solicitudes (id, id_usuario_solicitante, fecha_solicitud, estado_solicitud) FROM stdin;
    public          postgres    false    241   ��       �          0    17154 	   titulados 
   TABLE DATA           /   COPY public.titulados (id, nombre) FROM stdin;
    public          postgres    false    249   ��       �          0    16914    usuarios 
   TABLE DATA           k   COPY public.usuarios (id, apellido, nombre, cedula, email, telefono, cargo, id_area, id_ficha) FROM stdin;
    public          postgres    false    215   ��       �          0    16996    usuarios_centros_formacion 
   TABLE DATA           Y   COPY public.usuarios_centros_formacion (id, id_usuario, id_centro_formacion) FROM stdin;
    public          postgres    false    229   �       �           0    0    accesos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.accesos_id_seq', 1, false);
          public          postgres    false    222            �           0    0    alertavencimiento_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.alertavencimiento_id_seq', 1, false);
          public          postgres    false    238            �           0    0    areas_centros_formacion_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.areas_centros_formacion_id_seq', 1, false);
          public          postgres    false    230            �           0    0    areas_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.areas_id_seq', 1, false);
          public          postgres    false    226            �           0    0    bodega_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.bodega_id_seq', 1, false);
          public          postgres    false    234            �           0    0    centroformacion_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.centroformacion_id_seq', 1, false);
          public          postgres    false    224            �           0    0    detallesentrega_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.detallesentrega_id_seq', 1, false);
          public          postgres    false    246            �           0    0    detallesolicitud_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.detallesolicitud_id_seq', 1, false);
          public          postgres    false    242            �           0    0    entregamaterial_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.entregamaterial_id_seq', 1, false);
          public          postgres    false    244            �           0    0    fichasformacion_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.fichasformacion_id_seq', 1, false);
          public          postgres    false    250            �           0    0    opciones_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.opciones_id_seq', 1, false);
          public          postgres    false    220            �           0    0    productos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.productos_id_seq', 1, false);
          public          postgres    false    232            �           0    0    registroproductos_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.registroproductos_id_seq', 1, false);
          public          postgres    false    236            �           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          postgres    false    216            �           0    0    roles_usuarios_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.roles_usuarios_id_seq', 1, false);
          public          postgres    false    218            �           0    0    solicitudes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.solicitudes_id_seq', 1, false);
          public          postgres    false    240            �           0    0    titulados_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.titulados_id_seq', 1, false);
          public          postgres    false    248            �           0    0 !   usuarios_centros_formacion_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.usuarios_centros_formacion_id_seq', 1, false);
          public          postgres    false    228            �           0    0    usuarios_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.usuarios_id_seq', 1, false);
          public          postgres    false    214            �           2606    16963    accesos accesos_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.accesos
    ADD CONSTRAINT accesos_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.accesos DROP CONSTRAINT accesos_pkey;
       public            postgres    false    223            �           2606    17076 (   alertavencimiento alertavencimiento_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.alertavencimiento
    ADD CONSTRAINT alertavencimiento_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.alertavencimiento DROP CONSTRAINT alertavencimiento_pkey;
       public            postgres    false    239            �           2606    17018 4   areas_centros_formacion areas_centros_formacion_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.areas_centros_formacion
    ADD CONSTRAINT areas_centros_formacion_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.areas_centros_formacion DROP CONSTRAINT areas_centros_formacion_pkey;
       public            postgres    false    231            �           2606    16989    areas areas_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.areas DROP CONSTRAINT areas_pkey;
       public            postgres    false    227            �           2606    17051    bodega bodega_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.bodega
    ADD CONSTRAINT bodega_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.bodega DROP CONSTRAINT bodega_pkey;
       public            postgres    false    235            �           2606    16982 $   centroformacion centroformacion_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.centroformacion
    ADD CONSTRAINT centroformacion_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.centroformacion DROP CONSTRAINT centroformacion_pkey;
       public            postgres    false    225            �           2606    17142 $   detallesentrega detallesentrega_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.detallesentrega
    ADD CONSTRAINT detallesentrega_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.detallesentrega DROP CONSTRAINT detallesentrega_pkey;
       public            postgres    false    247            �           2606    17103 &   detallesolicitud detallesolicitud_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.detallesolicitud
    ADD CONSTRAINT detallesolicitud_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.detallesolicitud DROP CONSTRAINT detallesolicitud_pkey;
       public            postgres    false    243            �           2606    17123 $   entregamaterial entregamaterial_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.entregamaterial
    ADD CONSTRAINT entregamaterial_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.entregamaterial DROP CONSTRAINT entregamaterial_pkey;
       public            postgres    false    245            �           2606    17166 $   fichasformacion fichasformacion_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.fichasformacion
    ADD CONSTRAINT fichasformacion_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.fichasformacion DROP CONSTRAINT fichasformacion_pkey;
       public            postgres    false    251            �           2606    16956    opciones opciones_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.opciones
    ADD CONSTRAINT opciones_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.opciones DROP CONSTRAINT opciones_pkey;
       public            postgres    false    221            �           2606    17037    productos productos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    233            �           2606    17059 (   registroproductos registroproductos_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.registroproductos
    ADD CONSTRAINT registroproductos_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.registroproductos DROP CONSTRAINT registroproductos_pkey;
       public            postgres    false    237            �           2606    16932    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    217            �           2606    16939 "   roles_usuarios roles_usuarios_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.roles_usuarios
    ADD CONSTRAINT roles_usuarios_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.roles_usuarios DROP CONSTRAINT roles_usuarios_pkey;
       public            postgres    false    219            �           2606    17089    solicitudes solicitudes_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT solicitudes_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.solicitudes DROP CONSTRAINT solicitudes_pkey;
       public            postgres    false    241            �           2606    17159    titulados titulados_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.titulados
    ADD CONSTRAINT titulados_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.titulados DROP CONSTRAINT titulados_pkey;
       public            postgres    false    249            �           2606    16923    usuarios usuarios_cedula_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_cedula_key UNIQUE (cedula);
 F   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_cedula_key;
       public            postgres    false    215            �           2606    17001 :   usuarios_centros_formacion usuarios_centros_formacion_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.usuarios_centros_formacion
    ADD CONSTRAINT usuarios_centros_formacion_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.usuarios_centros_formacion DROP CONSTRAINT usuarios_centros_formacion_pkey;
       public            postgres    false    229            �           2606    16925    usuarios usuarios_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_email_key;
       public            postgres    false    215            �           2606    16921    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    215                       2606    16969    accesos accesos_id_opcion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accesos
    ADD CONSTRAINT accesos_id_opcion_fkey FOREIGN KEY (id_opcion) REFERENCES public.opciones(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.accesos DROP CONSTRAINT accesos_id_opcion_fkey;
       public          postgres    false    3297    221    223                       2606    16964    accesos accesos_id_rol_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accesos
    ADD CONSTRAINT accesos_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.roles(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.accesos DROP CONSTRAINT accesos_id_rol_fkey;
       public          postgres    false    223    217    3293                       2606    17077 4   alertavencimiento alertavencimiento_id_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alertavencimiento
    ADD CONSTRAINT alertavencimiento_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.alertavencimiento DROP CONSTRAINT alertavencimiento_id_producto_fkey;
       public          postgres    false    239    3309    233                       2606    17019 <   areas_centros_formacion areas_centros_formacion_id_area_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.areas_centros_formacion
    ADD CONSTRAINT areas_centros_formacion_id_area_fkey FOREIGN KEY (id_area) REFERENCES public.areas(id) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.areas_centros_formacion DROP CONSTRAINT areas_centros_formacion_id_area_fkey;
       public          postgres    false    231    227    3303                       2606    17024 H   areas_centros_formacion areas_centros_formacion_id_centro_formacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.areas_centros_formacion
    ADD CONSTRAINT areas_centros_formacion_id_centro_formacion_fkey FOREIGN KEY (id_centro_formacion) REFERENCES public.centroformacion(id) ON DELETE CASCADE;
 r   ALTER TABLE ONLY public.areas_centros_formacion DROP CONSTRAINT areas_centros_formacion_id_centro_formacion_fkey;
       public          postgres    false    3301    231    225                       2606    16990 $   areas areas_id_centro_formacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_id_centro_formacion_fkey FOREIGN KEY (id_centro_formacion) REFERENCES public.centroformacion(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.areas DROP CONSTRAINT areas_id_centro_formacion_fkey;
       public          postgres    false    227    225    3301                       2606    17143 /   detallesentrega detallesentrega_id_entrega_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallesentrega
    ADD CONSTRAINT detallesentrega_id_entrega_fkey FOREIGN KEY (id_entrega) REFERENCES public.entregamaterial(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.detallesentrega DROP CONSTRAINT detallesentrega_id_entrega_fkey;
       public          postgres    false    245    3321    247                       2606    17148 0   detallesentrega detallesentrega_id_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallesentrega
    ADD CONSTRAINT detallesentrega_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.detallesentrega DROP CONSTRAINT detallesentrega_id_producto_fkey;
       public          postgres    false    233    3309    247                       2606    17109 2   detallesolicitud detallesolicitud_id_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallesolicitud
    ADD CONSTRAINT detallesolicitud_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.detallesolicitud DROP CONSTRAINT detallesolicitud_id_producto_fkey;
       public          postgres    false    243    3309    233                       2606    17104 3   detallesolicitud detallesolicitud_id_solicitud_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallesolicitud
    ADD CONSTRAINT detallesolicitud_id_solicitud_fkey FOREIGN KEY (id_solicitud) REFERENCES public.solicitudes(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.detallesolicitud DROP CONSTRAINT detallesolicitud_id_solicitud_fkey;
       public          postgres    false    241    3317    243                       2606    17124 1   entregamaterial entregamaterial_id_solicitud_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entregamaterial
    ADD CONSTRAINT entregamaterial_id_solicitud_fkey FOREIGN KEY (id_solicitud) REFERENCES public.solicitudes(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.entregamaterial DROP CONSTRAINT entregamaterial_id_solicitud_fkey;
       public          postgres    false    3317    241    245                       2606    17129 ;   entregamaterial entregamaterial_id_usuario_responsable_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entregamaterial
    ADD CONSTRAINT entregamaterial_id_usuario_responsable_fkey FOREIGN KEY (id_usuario_responsable) REFERENCES public.usuarios(id) ON DELETE CASCADE;
 e   ALTER TABLE ONLY public.entregamaterial DROP CONSTRAINT entregamaterial_id_usuario_responsable_fkey;
       public          postgres    false    215    245    3291                       2606    17167 0   fichasformacion fichasformacion_id_titulado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fichasformacion
    ADD CONSTRAINT fichasformacion_id_titulado_fkey FOREIGN KEY (id_titulado) REFERENCES public.titulados(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.fichasformacion DROP CONSTRAINT fichasformacion_id_titulado_fkey;
       public          postgres    false    249    251    3325            	           2606    17038     productos productos_id_area_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_id_area_fkey FOREIGN KEY (id_area) REFERENCES public.areas(id) ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_id_area_fkey;
       public          postgres    false    227    233    3303            
           2606    17065 2   registroproductos registroproductos_id_bodega_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.registroproductos
    ADD CONSTRAINT registroproductos_id_bodega_fkey FOREIGN KEY (id_bodega) REFERENCES public.bodega(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.registroproductos DROP CONSTRAINT registroproductos_id_bodega_fkey;
       public          postgres    false    235    237    3311                       2606    17060 4   registroproductos registroproductos_id_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.registroproductos
    ADD CONSTRAINT registroproductos_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.registroproductos DROP CONSTRAINT registroproductos_id_producto_fkey;
       public          postgres    false    237    233    3309                        2606    16945 )   roles_usuarios roles_usuarios_id_rol_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.roles_usuarios
    ADD CONSTRAINT roles_usuarios_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.roles(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.roles_usuarios DROP CONSTRAINT roles_usuarios_id_rol_fkey;
       public          postgres    false    219    217    3293                       2606    16940 -   roles_usuarios roles_usuarios_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.roles_usuarios
    ADD CONSTRAINT roles_usuarios_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.roles_usuarios DROP CONSTRAINT roles_usuarios_id_usuario_fkey;
       public          postgres    false    219    3291    215                       2606    17090 3   solicitudes solicitudes_id_usuario_solicitante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT solicitudes_id_usuario_solicitante_fkey FOREIGN KEY (id_usuario_solicitante) REFERENCES public.usuarios(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.solicitudes DROP CONSTRAINT solicitudes_id_usuario_solicitante_fkey;
       public          postgres    false    241    3291    215                       2606    17007 N   usuarios_centros_formacion usuarios_centros_formacion_id_centro_formacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_centros_formacion
    ADD CONSTRAINT usuarios_centros_formacion_id_centro_formacion_fkey FOREIGN KEY (id_centro_formacion) REFERENCES public.centroformacion(id) ON DELETE CASCADE;
 x   ALTER TABLE ONLY public.usuarios_centros_formacion DROP CONSTRAINT usuarios_centros_formacion_id_centro_formacion_fkey;
       public          postgres    false    225    229    3301                       2606    17002 E   usuarios_centros_formacion usuarios_centros_formacion_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_centros_formacion
    ADD CONSTRAINT usuarios_centros_formacion_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id) ON DELETE CASCADE;
 o   ALTER TABLE ONLY public.usuarios_centros_formacion DROP CONSTRAINT usuarios_centros_formacion_id_usuario_fkey;
       public          postgres    false    3291    215    229            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     