--- NOTE ---
-- These are the SQL queries that were used to produce figures and statistics for the companion manuscript to this repository. 
-- These SQL cannot be reproduced without first importing the GBIF dataset and TPT datasets into a Postgres database.
-- There are many ways to do this and this was not a core focus of our work, so we do not provide more specific guidance on how to do this here. If you require further assistance, we encourage you to contact one of the repository authors for more information.

--- Citation for GBIF taxonomy used: GBIF.org (24 March 2021) GBIF Occurrence Download https://doi.org/10.15468/dl.4erswk
--- Note: We downloaded another version of the GBIF taxonomy on April 13, 2021, however the citation information was not recorded for an unknown reason. There should be minimal differences between the two versions (less than 1 month apart), but we cannot guarantee that they are identical.

--- SIPHONAPTERA - FLEAS
-- join all data from both GBIF and TPT [all] - result: 4258 [100%, all colors total]
select count(*) from (select * from tpt.tpt_siphonaptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_siphonaptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical;

-- only records in BOTH GBIF and TPT [valid] - result: 2453 [57.6%, dark purple]
select count(*) from (select * from tpt.tpt_siphonaptera as t4 where t4.taxonlevel in ('species', 'subspecies') and t4.accid is null) as t1
full outer join (select * from gbif.gbif_20210413_siphonaptera as t3 where t3."taxonRank" in ('species', 'subspecies') and t3."taxonomicStatus" in ('accepted')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is not null and not ((t1.accid is not null AND t2."taxonomicStatus" in ('accepted')) OR (t1.accid is null AND t2."taxonomicStatus" not in ('accepted')));

-- only records in BOTH GBIF and TPT [invalid] - result: 205 [4.8%, light purple]
select count(*) from (select * from tpt.tpt_siphonaptera as t4 where t4.taxonlevel in ('species', 'subspecies') and t4.accid is not null) as t1
full outer join (select * from gbif.gbif_20210413_siphonaptera as t3 where t3."taxonRank" in ('species', 'subspecies') and t3."taxonomicStatus" not in ('accepted')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is not null and not ((t1.accid is not null AND t2."taxonomicStatus" in ('accepted')) OR (t1.accid is null AND t2."taxonomicStatus" not in ('accepted')));

-- only records in GBIF and NOT in TPT [valid] - result: 511 [12%, dark green]
select count(*) from (select * from tpt.tpt_siphonaptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_siphonaptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is null and t2."taxonID" is not null and t2."taxonomicStatus" in ('accepted');

-- only records in GBIF and NOT in TPT [invalid] - result: 470 [11%, light green]
select count(*) from (select * from tpt.tpt_siphonaptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_siphonaptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is null and t2."taxonID" is not null and t2."taxonomicStatus" not in ('accepted');

-- only records in TPT and NOT in GBIF [valid] - result: 235 [5.5%, dark orange]
select count(*) from (select * from tpt.tpt_siphonaptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_siphonaptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is null and t1.accid is null;

-- only records in TPT and NOT in GBIF [invalid] - result: 317 [7.4%, light orange]
select count(*) from (select * from tpt.tpt_siphonaptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_siphonaptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is null and t1.accid is not null;

-- only records in BOTH GBIF and TPT [disagree - total] - result: 67 [1.6%, sum of all yellow]
select count(*) from (select * from tpt.tpt_siphonaptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_siphonaptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and ((t1.accid is not null AND t2."taxonomicStatus" in ('accepted')) OR (t1.accid is null AND t2."taxonomicStatus" not in ('accepted')));

-- only records in BOTH GBIF and TPT [disagree - TPT valid] - result: 22 [0.5%, dark yellow]
select count(*) from (select * from tpt.tpt_siphonaptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_siphonaptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and (t1.accid is null AND t2."taxonomicStatus" not in ('accepted'));

-- only records in BOTH GBIF and TPT [disagree - GBIF valid] - result: 45 [1.1%, light yellow]
select count(*) from (select * from tpt.tpt_siphonaptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_siphonaptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and (t1.accid is not null AND t2."taxonomicStatus" in ('accepted'));

--- PHTHIRAPTERA - LICE

-- Filter GBIF on Families
create view gbif.gbif_20210413_phthiraptera as
select *
from gbif.gbif_20210413_lice as t1
where t1.familyy in (select distinct t2.family from tpt.tpt_phthiraptera as t2);

-- join all data from both GBIF and TPT [all]
select count(*) from (select * from tpt.tpt_phthiraptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_phthiraptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical;

-- only records in BOTH GBIF and TPT [valid]
select count(*) from (select * from tpt.tpt_phthiraptera as t4 where t4.taxonlevel in ('species', 'subspecies') and t4.accid is null) as t1
full outer join (select * from gbif.gbif_20210413_phthiraptera as t3 where t3."taxonRank" in ('species', 'subspecies') and t3."taxonomicStatus" in ('accepted')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is not null and not ((t1.accid is not null AND t2."taxonomicStatus" in ('accepted')) OR (t1.accid is null AND t2."taxonomicStatus" not in ('accepted')));

-- only records in BOTH GBIF and TPT [invalid]
select count(*) from (select * from tpt.tpt_phthiraptera as t4 where t4.taxonlevel in ('species', 'subspecies') and t4.accid is not null) as t1
full outer join (select * from gbif.gbif_20210413_phthiraptera as t3 where t3."taxonRank" in ('species', 'subspecies') and t3."taxonomicStatus" not in ('accepted')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is not null and not ((t1.accid is not null AND t2."taxonomicStatus" in ('accepted')) OR (t1.accid is null AND t2."taxonomicStatus" not in ('accepted')));

-- only records in GBIF and NOT in TPT [valid]
select count(*) from (select * from tpt.tpt_phthiraptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_phthiraptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is null and t2."taxonID" is not null and t2."taxonomicStatus" in ('accepted');

-- only records in GBIF and NOT in TPT [invalid]
select count(*) from (select * from tpt.tpt_phthiraptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_phthiraptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is null and t2."taxonID" is not null and t2."taxonomicStatus" not in ('accepted');

-- only records in TPT and NOT in GBIF [valid]
select count(*) from (select * from tpt.tpt_phthiraptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_phthiraptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is null and t1.accid is null;

-- only records in TPT and NOT in GBIF [invalid]
select count(*) from (select * from tpt.tpt_phthiraptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_phthiraptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is null and t1.accid is not null;

-- only records in BOTH GBIF and TPT [disagree - total]
select count(*) from (select * from tpt.tpt_phthiraptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_phthiraptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and ((t1.accid is not null AND t2."taxonomicStatus" in ('accepted')) OR (t1.accid is null AND t2."taxonomicStatus" not in ('accepted')));

-- only records in BOTH GBIF and TPT [disagree - TPT valid]
select count(*) from (select * from tpt.tpt_phthiraptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_phthiraptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and (t1.accid is null AND t2."taxonomicStatus" not in ('accepted'));

-- only records in BOTH GBIF and TPT [disagree - GBIF valid]
select count(*) from (select * from tpt.tpt_phthiraptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_phthiraptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and (t1.accid is not null AND t2."taxonomicStatus" in ('accepted'));

--- ACARI - MITES (excluding Ixodida)
-- join all data from both GBIF and TPT [all]
select count(*) from (select * from tpt.tpt_acari as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_mites as t3 where t3.orderr not in ('Ixodida') and t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical;

-- only records in BOTH GBIF and TPT [valid]
select count(*) from (select * from tpt.tpt_acari as t4 where t4.taxonlevel in ('species', 'subspecies') and t4.accid is null) as t1
full outer join (select * from gbif.gbif_20210413_mites as t3 where t3.orderr not in ('Ixodida') and t3."taxonRank" in ('species', 'subspecies') and t3."taxonomicStatus" in ('accepted')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is not null and not ((t1.accid is not null AND t2."taxonomicStatus" in ('accepted')) OR (t1.accid is null AND t2."taxonomicStatus" not in ('accepted')));

-- only records in BOTH GBIF and TPT [invalid]
select count(*) from (select * from tpt.tpt_acari as t4 where t4.taxonlevel in ('species', 'subspecies') and t4.accid is not null) as t1
full outer join (select * from gbif.gbif_20210413_mites as t3 where t3.orderr not in ('Ixodida') and t3."taxonRank" in ('species', 'subspecies') and t3."taxonomicStatus" not in ('accepted')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is not null and not ((t1.accid is not null AND t2."taxonomicStatus" in ('accepted')) OR (t1.accid is null AND t2."taxonomicStatus" not in ('accepted')));

-- only records in GBIF and NOT in TPT [valid]
select count(*) from (select * from tpt.tpt_acari as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_mites as t3 where t3.orderr not in ('Ixodida') and t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is null and t2."taxonID" is not null and t2."taxonomicStatus" in ('accepted');

-- only records in GBIF and NOT in TPT [invalid]
select count(*) from (select * from tpt.tpt_acari as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_mites as t3 where t3.orderr not in ('Ixodida') and t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is null and t2."taxonID" is not null and t2."taxonomicStatus" not in ('accepted');

-- only records in TPT and NOT in GBIF [valid]
select count(*) from (select * from tpt.tpt_acari as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_mites as t3 where t3.orderr not in ('Ixodida') and t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is null and t1.accid is null;

-- only records in TPT and NOT in GBIF [invalid]
select count(*) from (select * from tpt.tpt_acari as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_mites as t3 where t3.orderr not in ('Ixodida') and t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is null and t1.accid is not null;

-- only records in BOTH GBIF and TPT [disagree - total]
select count(*) from (select * from tpt.tpt_acari as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_mites as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and ((t1.accid is not null AND t2."taxonomicStatus" in ('accepted')) OR (t1.accid is null AND t2."taxonomicStatus" not in ('accepted')));

-- only records in BOTH GBIF and TPT [disagree - TPT valid]
select count(*) from (select * from tpt.tpt_acari as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_mites as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and (t1.accid is null AND t2."taxonomicStatus" not in ('accepted'));

-- only records in BOTH GBIF and TPT [disagree - GBIF valid]
select count(*) from (select * from tpt.tpt_acari as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_mites as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and (t1.accid is not null AND t2."taxonomicStatus" in ('accepted'));

--- ACARI:IXODIDA - TICKS
-- join all data from both GBIF and TPT [all]
select count(*) from (select * from tpt.tpt_ticks as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_ticks as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical;

-- only records in BOTH GBIF and TPT [valid]
select count(*) from (select * from tpt.tpt_ticks as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_ticks as t3 where t3."taxonRank" in ('species', 'subspecies') and t3."taxonomicStatus" in ('accepted')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is not null;

-- only records in BOTH GBIF and TPT [invalid]
select count(*) from (select * from tpt.tpt_ticks as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_ticks as t3 where t3."taxonRank" in ('species', 'subspecies') and t3."taxonomicStatus" not in ('accepted')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is not null;

-- only records in GBIF and NOT in TPT [valid]
select count(*) from (select * from tpt.tpt_ticks as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_ticks as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is null and t2."taxonID" is not null and t2."taxonomicStatus" in ('accepted');

-- only records in GBIF and NOT in TPT [invalid]
select count(*) from (select * from tpt.tpt_ticks as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_ticks as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is null and t2."taxonID" is not null and t2."taxonomicStatus" not in ('accepted');

-- only records in TPT and NOT in GBIF [valid]
select count(*) from (select * from tpt.tpt_ticks as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_ticks as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1.id is not null and t2."taxonID" is null;

-- only records in TPT and NOT in GBIF [invalid]
-- all tick records in TPT are listed as valid; this does not apply

-- only records in BOTH GBIF and TPT [disagree - total]
select count(*) from (select * from tpt.tpt_ticks as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_mites as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and t2."taxonomicStatus" not in ('accepted');

-- only records in BOTH GBIF and TPT [disagree - TPT valid]
-- all tick records in TPT are listed as valid; this is equivalent to "Both - Invalid"
select count(*) from (select * from tpt.tpt_ticks as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_mites as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and t2."taxonomicStatus" not in ('accepted');

-- only records in BOTH GBIF and TPT [disagree - GBIF valid]
-- all tick records in TPT are listed as valid; this does not apply

--- DIPTERA - FLIES
-- Filter GBIF on to exclude subspecies (TPT list doesn't account for those)
create view gbif.gbif_20210413_diptera_restricted_sp as
select *
from gbif.gbif_20210413_diptera_restricted as t1
where t1.taxonRank in ('species');

-- join all data from both GBIF and TPT [all]
select count(*) from (select * from tpt."20211110_tpt_diptera_restricted" as t4 where t4."Category" in ('Species')) as t1
full outer join (select * from gbif.gbif_20210413_diptera_restricted_sp as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical;

-- only records in BOTH GBIF and TPT [valid]
select count(*) from (select * from tpt."20211110_tpt_diptera_restricted" as t4 where t4."Category" in ('Species')) as t1
full outer join (select * from gbif.gbif_20210413_diptera_restricted_sp as t3 where t3."taxonRank" in ('species', 'subspecies') and t3."taxonomicStatus" in ('accepted')) as t2 on t2."canonicalName" = t1.canonical
where t1."Recn" is not null and t2."taxonID" is not null and not (((t1."Status" LIKE '%Invalid%' OR t1."Status" is null) AND t2."taxonomicStatus" in ('accepted')) OR (t1."Status" LIKE '%Valid%' AND t2."taxonomicStatus" not in ('accepted')));

-- only records in BOTH GBIF and TPT [invalid]
select count(*) from (select * from tpt."20211110_tpt_diptera_restricted" as t4 where t4."Category" in ('Species')) as t1
full outer join (select * from gbif.gbif_20210413_diptera_restricted_sp as t3 where t3."taxonRank" in ('species', 'subspecies') and t3."taxonomicStatus" not in ('accepted')) as t2 on t2."canonicalName" = t1.canonical
where t1."Recn" is not null and t2."taxonID" is not null and not (((t1."Status" LIKE '%Invalid%' OR t1."Status" is null) AND t2."taxonomicStatus" in ('accepted')) OR (t1."Status" LIKE '%Valid%' AND t2."taxonomicStatus" not in ('accepted')));

-- only records in GBIF and NOT in TPT [valid]
select count(*) from (select * from tpt."20211110_tpt_diptera_restricted" as t4 where t4."Category" in ('Species')) as t1
full outer join (select * from gbif.gbif_20210413_diptera_restricted_sp as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1."Recn" is null and t2."taxonID" is not null and t2."taxonomicStatus" in ('accepted');

-- only records in GBIF and NOT in TPT [invalid]
select count(*) from (select * from tpt."20211110_tpt_diptera_restricted" as t4 where t4."Category" in ('Species')) as t1
full outer join (select * from gbif.gbif_20210413_diptera_restricted_sp as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1."Recn" is null and t2."taxonID" is not null and t2."taxonomicStatus" not in ('accepted');

-- only records in TPT and NOT in GBIF [valid]
select count(*) from (select * from tpt."20211110_tpt_diptera_restricted" as t4 where t4."Category" in ('Species')) as t1
full outer join (select * from gbif.gbif_20210413_diptera_restricted_sp as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1."Recn" is not null and t2."taxonID" is null and t1."Status" LIKE '%Valid%';

-- only records in TPT and NOT in GBIF [invalid]
select count(*) from (select * from tpt."20211110_tpt_diptera_restricted" as t4 where t4."Category" in ('Species')) as t1
full outer join (select * from gbif.gbif_20210413_diptera_restricted_sp as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where t1."Recn" is not null and t2."taxonID" is null and (t1."Status" LIKE '%Invalid%' OR t1."Status" is null);

-- only records in BOTH GBIF and TPT [disagree - total]
select count(*) from (select * from tpt."20211110_tpt_diptera_restricted" as t4 where t4."Category" in ('Species')) as t1
full outer join (select * from gbif.gbif_20210413_diptera_restricted_sp as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1."Recn" is not null and t2."taxonID" is not null) and (((t1."Status" LIKE '%Invalid%' OR t1."Status" is null) AND t2."taxonomicStatus" in ('accepted')) OR (t1."Status" LIKE '%Valid%' AND t2."taxonomicStatus" not in ('accepted')));

-- only records in BOTH GBIF and TPT [disagree - TPT valid]
select count(*) from (select * from tpt."20211110_tpt_diptera_restricted" as t4 where t4."Category" in ('Species')) as t1
full outer join (select * from gbif.gbif_20210413_diptera_restricted_sp as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1."Recn" is not null and t2."taxonID" is not null) and (t1."Status" LIKE '%Valid%' AND t2."taxonomicStatus" not in ('accepted'));

-- only records in BOTH GBIF and TPT [disagree - GBIF valid]
select count(*) from (select * from tpt."20211110_tpt_diptera_restricted" as t4 where t4."Category" in ('Species')) as t1
full outer join (select * from gbif.gbif_20210413_diptera_restricted_sp as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1."Recn" is not null and t2."taxonID" is not null) and ((t1."Status" LIKE '%Invalid%' OR t1."Status" is null) AND t2."taxonomicStatus" in ('accepted'));

--- HEMIPTERA - TRUE BUGS
-- no TPT resources for Hemiptera; GBIF only

-- only records in GBIF and NOT in TPT [valid]
select count(*) from gbif.gbif_complete_20210413 as t1
where t1.orderr = 'Hemiptera' and t1."taxonomicStatus" in ('accepted') and t1."taxonRank" in ('species', 'subspecies');

-- only records in GBIF and NOT in TPT [invalid]
select count(*) from gbif.gbif_complete_20210413 as t1
where t1.orderr = 'Hemiptera' and t1."taxonomicStatus" not in ('accepted') and t1."taxonRank" in ('species', 'subspecies');

--- --- How many GBIF records are affected by disagreement?
-- Note: This code was added as part of a response to a reviewer question. It is not part of the original analysis, but is added here to describe how we calculated the number of GBIF records affected by disagreement.

-- QUERY GBIF OBSERVATION RECORDS AGAINST COMBINED LIST [ACARI: 143,444 occurrences]
-- citation: GBIF.org (18 August 2023) GBIF Occurrence Download https://doi.org/10.15468/dl.r85u2c
with taxonDisagreeAcari as (select distinct "taxonID" from (select * from tpt.tpt_ticks as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_mites as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and t2."taxonomicStatus" not in ('accepted') union select distinct "taxonID" from (select * from tpt.tpt_acari as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_mites as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and ((t1.accid is not null AND t2."taxonomicStatus" in ('accepted')) OR (t1.accid is null AND t2."taxonomicStatus" not in ('accepted'))))

select count(*) from gbif.gbif_arachnid_obs_20230818 as obs
where obs."taxonKey" in (select "taxonID" from taxonDisagreeAcari)

-- QUERY GBIF OBSERVATION RECORDS AGAINST COMBINED LIST [SIPHONAPTERA: 1,169 occurrences]
-- citation: GBIF.org (18 August 2023) GBIF Occurrence Download https://doi.org/10.15468/dl.wj6nvm
with taxonDisagreeSiphonaptera as (select distinct "taxonID" from (select * from tpt.tpt_siphonaptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_siphonaptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and t2."taxonomicStatus" not in ('accepted'))

select count(*) from gbif.gbif_siphonaptera_obs_20230818 as obs
where obs."taxonKey" in (select "taxonID" from taxonDisagreeSiphonaptera)

-- QUERY GBIF OBSERVATION RECORDS AGAINST COMBINED LIST [PHTHIRAPTERA: 1,668 occurrences]
-- GBIF.org (18 August 2023) GBIF Occurrence Download https://doi.org/10.15468/dl.8jjyua
with taxonDisagreePhthiraptera as (select distinct "taxonID" from (select * from tpt.tpt_phthiraptera as t4 where t4.taxonlevel in ('species', 'subspecies')) as t1
full outer join (select * from gbif.gbif_20210413_phthiraptera as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1.id is not null and t2."taxonID" is not null) and t2."taxonomicStatus" not in ('accepted'))

select count(*) from gbif.gbif_psocodea_obs_20230818 as obs
where obs."taxonKey" in (select "taxonID" from taxonDisagreePhthiraptera)

-- QUERY GBIF OBSERVATION RECORDS AGAINST COMBINED LIST [DIPTERA: 42,088 occurrences]
-- GBIF.org (18 August 2023) GBIF Occurrence Download https://doi.org/10.15468/dl.v5sn8n
with taxonDisagreeDiptera as (select distinct "taxonID" from (select * from tpt."20211110_tpt_diptera_restricted" as t4 where t4."Category" in ('Species')) as t1
full outer join (select * from gbif.gbif_20210413_diptera_restricted_sp as t3 where t3."taxonRank" in ('species', 'subspecies')) as t2 on t2."canonicalName" = t1.canonical
where (t1."Recn" is not null and t2."taxonID" is not null) and (((t1."Status" LIKE '%Invalid%' OR t1."Status" is null) AND t2."taxonomicStatus" in ('accepted')) OR (t1."Status" LIKE '%Valid%' AND t2."taxonomicStatus" not in ('accepted')))

select count(*) from gbif.gbif_diptera_obs_20230818 as obs
where obs."taxonKey" in (select "taxonID" from taxonDisagreeDiptera)