--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.17
-- Dumped by pg_dump version 9.5.17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: zmap_expression_pop_expression; Type: TABLE; Schema: public; Owner: tripal
--

CREATE TABLE public.zmap_expression_pop_expression (
    "GeneID" character(16),
    "05W002" double precision,
    "05WN230" double precision,
    "07KS4" double precision,
    "150" double precision,
    "177" double precision,
    "18-599" double precision,
    "238" double precision,
    "268" double precision,
    "303WX" double precision,
    "4F1" double precision,
    "5237" double precision,
    "526018" double precision,
    "647" double precision,
    "7327" double precision,
    "7884-4HT" double precision,
    "81162" double precision,
    "835B" double precision,
    "8902" double precision,
    "9642" double precision,
    "975-12" double precision,
    "B11" double precision,
    "B110" double precision,
    "B111" double precision,
    "B113" double precision,
    "B114" double precision,
    "B151" double precision,
    "B77" double precision,
    "BS16" double precision,
    "BY4839" double precision,
    "BY4944" double precision,
    "BY4960" double precision,
    "BY804" double precision,
    "BY807" double precision,
    "BY809" double precision,
    "BY813" double precision,
    "BY815" double precision,
    "BY855" double precision,
    "BZN" double precision,
    "CHANG3" double precision,
    "CHENG698" double precision,
    "CHUAN48-2" double precision,
    "CI7" double precision,
    "CIMBL1" double precision,
    "CIMBL10" double precision,
    "CIMBL100" double precision,
    "CIMBL101" double precision,
    "CIMBL102" double precision,
    "CIMBL105" double precision,
    "CIMBL106" double precision,
    "CIMBL108" double precision,
    "CIMBL11" double precision,
    "CIMBL111" double precision,
    "CIMBL113" double precision,
    "CIMBL114" double precision,
    "CIMBL115" double precision,
    "CIMBL116" double precision,
    "CIMBL119" double precision,
    "CIMBL120" double precision,
    "CIMBL121" double precision,
    "CIMBL122" double precision,
    "CIMBL123" double precision,
    "CIMBL124" double precision,
    "CIMBL125" double precision,
    "CIMBL127" double precision,
    "CIMBL129" double precision,
    "CIMBL13" double precision,
    "CIMBL133" double precision,
    "CIMBL137" double precision,
    "CIMBL139" double precision,
    "CIMBL140" double precision,
    "CIMBL141" double precision,
    "CIMBL142" double precision,
    "CIMBL143" double precision,
    "CIMBL144" double precision,
    "CIMBL145" double precision,
    "CIMBL147" double precision,
    "CIMBL149" double precision,
    "CIMBL15" double precision,
    "CIMBL150" double precision,
    "CIMBL151" double precision,
    "CIMBL152" double precision,
    "CIMBL153" double precision,
    "CIMBL156" double precision,
    "CIMBL157" double precision,
    "CIMBL16" double precision,
    "CIMBL17" double precision,
    "CIMBL18" double precision,
    "CIMBL19" double precision,
    "CIMBL2" double precision,
    "CIMBL21" double precision,
    "CIMBL22" double precision,
    "CIMBL23" double precision,
    "CIMBL25" double precision,
    "CIMBL27" double precision,
    "CIMBL28" double precision,
    "CIMBL3" double precision,
    "CIMBL32" double precision,
    "CIMBL38" double precision,
    "CIMBL4" double precision,
    "CIMBL40" double precision,
    "CIMBL42" double precision,
    "CIMBL43" double precision,
    "CIMBL46" double precision,
    "CIMBL47" double precision,
    "CIMBL48" double precision,
    "CIMBL49" double precision,
    "CIMBL5" double precision,
    "CIMBL50" double precision,
    "CIMBL51" double precision,
    "CIMBL52" double precision,
    "CIMBL53" double precision,
    "CIMBL54" double precision,
    "CIMBL56" double precision,
    "CIMBL59" double precision,
    "CIMBL6" double precision,
    "CIMBL60" double precision,
    "CIMBL62" double precision,
    "CIMBL63" double precision,
    "CIMBL66" double precision,
    "CIMBL68" double precision,
    "CIMBL69" double precision,
    "CIMBL7" double precision,
    "CIMBL70" double precision,
    "CIMBL71" double precision,
    "CIMBL74" double precision,
    "CIMBL75" double precision,
    "CIMBL77" double precision,
    "CIMBL79" double precision,
    "CIMBL81" double precision,
    "CIMBL82" double precision,
    "CIMBL83" double precision,
    "CIMBL84" double precision,
    "CIMBL86" double precision,
    "CIMBL88" double precision,
    "CIMBL89" double precision,
    "CIMBL9" double precision,
    "CIMBL90" double precision,
    "CIMBL91" double precision,
    "CIMBL92" double precision,
    "CIMBL93" double precision,
    "CIMBL94" double precision,
    "CIMBL95" double precision,
    "CIMBL96" double precision,
    "CIMBL98" double precision,
    "CIMBL99" double precision,
    "CML114" double precision,
    "CML118" double precision,
    "CML121" double precision,
    "CML122" double precision,
    "CML130" double precision,
    "CML134" double precision,
    "CML139" double precision,
    "CML162" double precision,
    "CML163" double precision,
    "CML165" double precision,
    "CML170" double precision,
    "CML171" double precision,
    "CML172" double precision,
    "CML189" double precision,
    "CML191" double precision,
    "CML192" double precision,
    "CML20" double precision,
    "CML290" double precision,
    "CML298" double precision,
    "CML31" double precision,
    "CML32" double precision,
    "CML323" double precision,
    "CML324" double precision,
    "CML325" double precision,
    "CML327" double precision,
    "CML338" double precision,
    "CML360" double precision,
    "CML361" double precision,
    "CML411" double precision,
    "CML415" double precision,
    "CML422" double precision,
    "CML423" double precision,
    "CML426" double precision,
    "CML431" double precision,
    "CML432" double precision,
    "CML454" double precision,
    "CML470" double precision,
    "CML479" double precision,
    "CML480" double precision,
    "CML493" double precision,
    "CML496" double precision,
    "CML50" double precision,
    "CML69" double precision,
    "D863F" double precision,
    "DAN3130" double precision,
    "DAN340" double precision,
    "DAN360" double precision,
    "DAN4245" double precision,
    "DAN599" double precision,
    "DH3732" double precision,
    "DONG237" double precision,
    "DONG46" double precision,
    "EN25" double precision,
    "ES40" double precision,
    "FCD0602" double precision,
    "GEMS1" double precision,
    "GEMS10" double precision,
    "GEMS11" double precision,
    "GEMS13" double precision,
    "GEMS14" double precision,
    "GEMS15" double precision,
    "GEMS16" double precision,
    "GEMS17" double precision,
    "GEMS18" double precision,
    "GEMS19" double precision,
    "GEMS2" double precision,
    "GEMS20" double precision,
    "GEMS21" double precision,
    "GEMS23" double precision,
    "GEMS25" double precision,
    "GEMS28" double precision,
    "GEMS29" double precision,
    "GEMS3" double precision,
    "GEMS30" double precision,
    "GEMS31" double precision,
    "GEMS32" double precision,
    "GEMS33" double precision,
    "GEMS35" double precision,
    "GEMS36" double precision,
    "GEMS37" double precision,
    "GEMS39" double precision,
    "GEMS4" double precision,
    "GEMS40" double precision,
    "GEMS41" double precision,
    "GEMS42" double precision,
    "GEMS44" double precision,
    "GEMS46" double precision,
    "GEMS48" double precision,
    "GEMS49" double precision,
    "GEMS5" double precision,
    "GEMS50" double precision,
    "GEMS51" double precision,
    "GEMS54" double precision,
    "GEMS55" double precision,
    "GEMS56" double precision,
    "GEMS58" double precision,
    "GEMS59" double precision,
    "GEMS6" double precision,
    "GEMS60" double precision,
    "GEMS61" double precision,
    "GEMS62" double precision,
    "GEMS63" double precision,
    "GEMS64" double precision,
    "GEMS65" double precision,
    "GEMS66" double precision,
    "GEMS9" double precision,
    "GY1032" double precision,
    "GY386" double precision,
    "GY462" double precision,
    "GY798" double precision,
    "GY923" double precision,
    "HTH-17" double precision,
    "HUA83-2" double precision,
    "HYS" double precision,
    "HZS" double precision,
    "IRF314" double precision,
    "JH59" double precision,
    "JH96C" double precision,
    "JI63" double precision,
    "JI842" double precision,
    "JI846" double precision,
    "JI853" double precision,
    "JIAO51" double precision,
    "JY01" double precision,
    "K10" double precision,
    "K12" double precision,
    "K22" double precision,
    "L3180" double precision,
    "LG001" double precision,
    "LIAO138" double precision,
    "LIAO159" double precision,
    "LIAO5114" double precision,
    "LIAO5262" double precision,
    "LIAO5263" double precision,
    "LK11" double precision,
    "LV28" double precision,
    "LXN" double precision,
    "LY042" double precision,
    "M153" double precision,
    "M97" double precision,
    "NAN21-3" double precision,
    "P178" double precision,
    "QI205" double precision,
    "R15" double precision,
    "R15X1141" double precision,
    "RY713" double precision,
    "RY729" double precision,
    "S37" double precision,
    "SC55" double precision,
    "SHEN5003" double precision,
    "SI273" double precision,
    "SI434" double precision,
    "SI446" double precision,
    "SW92E114" double precision,
    "SY1032" double precision,
    "SY1035" double precision,
    "SY1039" double precision,
    "SY1052" double precision,
    "SY3073" double precision,
    "TIAN77" double precision,
    "TIE7922" double precision,
    "TY1" double precision,
    "TY11" double precision,
    "TY2" double precision,
    "TY3" double precision,
    "TY4" double precision,
    "TY5" double precision,
    "TY6" double precision,
    "U8112" double precision,
    "W138" double precision,
    "WH413" double precision,
    "WU109" double precision,
    "XI502" double precision,
    "XUN971" double precision,
    "XZ698" double precision,
    "YE478" double precision,
    "YE515" double precision,
    "YE52106" double precision,
    "YE8001" double precision,
    "YU374" double precision,
    "Z2018F" double precision,
    "ZB648" double precision,
    "ZH68" double precision,
    "ZHENG28" double precision,
    "ZHENG29" double precision,
    "ZHENG30" double precision,
    "ZHENG32" double precision,
    "ZHENG35" double precision,
    "ZHENG653" double precision,
    "ZHI41" double precision,
    "ZHONG69" double precision,
    "ZONG31" double precision,
    "ZZ01" double precision,
    "ZZ03" double precision
);


ALTER TABLE public.zmap_expression_pop_expression OWNER TO tripal;

--
-- Name: zmap_expression_pop_sample; Type: TABLE; Schema: public; Owner: tripal
--

CREATE TABLE public.zmap_expression_pop_sample (
    sample character(16),
    class character(16),
    hex character(8),
    rgb character(16)
);


ALTER TABLE public.zmap_expression_pop_sample OWNER TO tripal;

--
-- Name: zmap_expression_ref_expression_b73; Type: TABLE; Schema: public; Owner: tripal
--

CREATE TABLE public.zmap_expression_ref_expression_b73 (
    "GeneID" character varying(32),
    "B73_6-7_internode" double precision,
    "B73_7-8_internode" double precision,
    "B73_Vegetative_Meristem_16-19_Day" double precision,
    "B73_Ear_Primordium_2-4_mm" double precision,
    "B73_Ear_Primordium_6-8_mm" double precision,
    "B73_Embryo_20_DAP" double precision,
    "B73_Embryo_38_DAP" double precision,
    "B73_Endosperm_12_DAP" double precision,
    "B73_Endosperm_Crown_27_DAP" double precision,
    "B73_Germinatin_Kernels_2_DAI" double precision,
    "B73_Pericarp_Aleurone_27_DAP" double precision,
    "B73_Leaf_Zone_1_Symmetrical" double precision,
    "B73_Leaf_Zone_2_Stomatal" double precision,
    "B73_Leaf_Zone_3_Growth" double precision,
    "B73_Mature_Leaf_8" double precision,
    "B73_Primary_Root_5_Days" double precision,
    "B73_Root_Cortex_5_Days" double precision,
    "B73_Root_Elongation_Zone_5_Days" double precision,
    "B73_Root_Meristem_Zone_5_Days" double precision,
    "B73_Secondary_Root_7-8_Days" double precision,
    "B73_Mature_Pollen" double precision,
    "B73_Female_Spikelet_Collected_on_day_as_silk" double precision,
    "B73_Silk" double precision
);


ALTER TABLE public.zmap_expression_ref_expression_b73 OWNER TO tripal;

--
-- Name: zmap_expression_ref_expression_sk; Type: TABLE; Schema: public; Owner: tripal
--

CREATE TABLE public.zmap_expression_ref_expression_sk (
    "GeneID" character varying(32),
    "SK_15_DAP_Kernel" double precision,
    "SK_Immature_Ear" double precision,
    "SK_Internode" double precision,
    "SK_Leaf" double precision,
    "SK_Mature_pollen" double precision,
    "SK_Primary_root" double precision,
    "SK_SAM" double precision,
    "SK_Silk" double precision,
    "SK_Tassel" double precision
);


ALTER TABLE public.zmap_expression_ref_expression_sk OWNER TO tripal;

--
-- Name: zmap_expression_ref_sample; Type: TABLE; Schema: public; Owner: tripal
--

CREATE TABLE public.zmap_expression_ref_sample (
    sample character varying(128),
    class character varying(8),
    hex character(8),
    rgb character(11)
);


ALTER TABLE public.zmap_expression_ref_sample OWNER TO tripal;


--
-- Name: zmap_expression_ref_expression_hzs; Type: TABLE; Schema: public; Owner: tripal
--

CREATE TABLE public.zmap_expression_ref_expression_hzs (
    "GeneID" character varying(32),
    "HZS_endosperm" double precision,
    "HZS_embryo" double precision,
    "HZS_stem_and_SAM" double precision,
    "HZS_Meristematic_and_elongation_primary_root" double precision,
    "HZS_Fourth_elongated_internode" double precision,
    "HZS_Anthers" double precision,
    "HZS_Immature_Cob" double precision,
    "HZS_Meiotic_Tassel" double precision,
    "HZS_Eighth_leaf_tip_stage" double precision,
    "HZS_Eighth_leaf_middle_stage" double precision,
    "HZS_Eighth_leaf_base_stage" double precision,
    "HZS_Crown_roots" double precision
);


ALTER TABLE public.zmap_expression_ref_expression_hzs OWNER TO tripal;

--
-- Name: zmap_expression_ref_expression_hzs_geneid; Type: INDEX; Schema: public; Owner: tripal
--

CREATE INDEX zmap_expression_ref_expression_hzs_geneid ON public.zmap_expression_ref_expression_hzs USING btree ("GeneID");


--
-- Name: TABLE zmap_expression_ref_expression_hzs; Type: ACL; Schema: public; Owner: tripal
--

REVOKE ALL ON TABLE public.zmap_expression_ref_expression_hzs FROM PUBLIC;
REVOKE ALL ON TABLE public.zmap_expression_ref_expression_hzs FROM tripal;
GRANT ALL ON TABLE public.zmap_expression_ref_expression_hzs TO tripal;


--
-- Name: zmap_expression_ref_expression_mo17; Type: TABLE; Schema: public; Owner: tripal
--

CREATE TABLE public.zmap_expression_ref_expression_mo17 (
    "GeneID" character varying(32),
    "Mo17_12_day_after_pollination_endosperm" double precision,
    "Mo17_14_day_seedling" double precision,
    "Mo17_bract" double precision,
    "Mo17_root" double precision,
    "Mo17_stem_harvested_in_silking_stage" double precision
);


ALTER TABLE public.zmap_expression_ref_expression_mo17 OWNER TO tripal;

--
-- Name: zmap_expression_ref_expression_mo17_geneid; Type: INDEX; Schema: public; Owner: tripal
--

CREATE INDEX zmap_expression_ref_expression_mo17_geneid ON public.zmap_expression_ref_expression_mo17 USING btree ("GeneID");


--
-- Name: TABLE zmap_expression_ref_expression_mo17; Type: ACL; Schema: public; Owner: tripal
--

REVOKE ALL ON TABLE public.zmap_expression_ref_expression_mo17 FROM PUBLIC;
REVOKE ALL ON TABLE public.zmap_expression_ref_expression_mo17 FROM tripal;
GRANT ALL ON TABLE public.zmap_expression_ref_expression_mo17 TO tripal;

--
-- Name: zmap_expression_pop_sample_class; Type: INDEX; Schema: public; Owner: tripal
--

CREATE INDEX zmap_expression_pop_sample_class ON public.zmap_expression_pop_sample USING btree (class);


--
-- Name: zmap_expression_pop_sample_sample; Type: INDEX; Schema: public; Owner: tripal
--

CREATE INDEX zmap_expression_pop_sample_sample ON public.zmap_expression_pop_sample USING btree (sample);


--
-- Name: zmap_expression_ref_expression_b73_geneid; Type: INDEX; Schema: public; Owner: tripal
--

CREATE INDEX zmap_expression_ref_expression_b73_geneid ON public.zmap_expression_ref_expression_b73 USING btree ("GeneID");


--
-- Name: zmap_expression_ref_expression_sk_geneid; Type: INDEX; Schema: public; Owner: tripal
--

CREATE INDEX zmap_expression_ref_expression_sk_geneid ON public.zmap_expression_ref_expression_sk USING btree ("GeneID");


--
-- Name: TABLE zmap_expression_pop_sample; Type: ACL; Schema: public; Owner: tripal
--

REVOKE ALL ON TABLE public.zmap_expression_pop_sample FROM PUBLIC;
REVOKE ALL ON TABLE public.zmap_expression_pop_sample FROM tripal;
GRANT ALL ON TABLE public.zmap_expression_pop_sample TO tripal;


--
-- Name: TABLE zmap_expression_ref_expression_b73; Type: ACL; Schema: public; Owner: tripal
--

REVOKE ALL ON TABLE public.zmap_expression_ref_expression_b73 FROM PUBLIC;
REVOKE ALL ON TABLE public.zmap_expression_ref_expression_b73 FROM tripal;
GRANT ALL ON TABLE public.zmap_expression_ref_expression_b73 TO tripal;


--
-- Name: TABLE zmap_expression_ref_expression_sk; Type: ACL; Schema: public; Owner: tripal
--

REVOKE ALL ON TABLE public.zmap_expression_ref_expression_sk FROM PUBLIC;
REVOKE ALL ON TABLE public.zmap_expression_ref_expression_sk FROM tripal;
GRANT ALL ON TABLE public.zmap_expression_ref_expression_sk TO tripal;


--
-- Name: TABLE zmap_expression_ref_sample; Type: ACL; Schema: public; Owner: tripal
--

REVOKE ALL ON TABLE public.zmap_expression_ref_sample FROM PUBLIC;
REVOKE ALL ON TABLE public.zmap_expression_ref_sample FROM tripal;
GRANT ALL ON TABLE public.zmap_expression_ref_sample TO tripal;


--
-- PostgreSQL database dump complete
--

