/* Full query with -1 assigned to rules with no record evaluated */
/* PG parent_id is assigned to 0 */
/* Based on id */
/* Simplified and including Playground */


insert into odq_dwh.dm_processes(PLAYGROUND_ID,ODQ_OBJECT_ID,ODQ_PARENT_ID,ODQ_OBJECT_NAME, ODQ_OBJECT_CODE, ODQ_OBJECT_URL, PERIOD_DAY, ALL_RECORDS,ERROR_COUNT,SCORE,WORKLOAD,ADDED_VALUE,MAINTENANCE_COST,PERIOD_ID,CREATED_BY,UPDATED_BY,CREATED_AT,UPDATED_AT, TERRITORY_ID, ORGANISATION_ID) 
select DWH.PLAYGROUND_ID, DWH.ID, DWH.PARENT_ID, DWH.NAME, DWH.CODE, DWH.URL, DTIME.PERIOD_DAY, DWH.ALL_RECORDS, DWH.ERROR_COUNT, DWH.SCORE, DWH.WORKLOAD, DWH.ADDED_VALUE, DWH.MAINTENANCE_COST, DTIME.PERIOD_ID,'Rake','Rake',current_timestamp, current_timestamp, 0, 0 from (
select BR.playground_id, BR.id, BR.business_process_id parent_id, BR.name, BR.code, '/business_rules/'||BR.id url, to_char(current_date, 'YYYYMMDD') Period_day,  
br.all_records, 
br.bad_records error_count,
0 score,
0 workload,
0 added_value,
0 maintenance_cost
from odq_app.business_rules BR 
group by BR.playground_id, BR.id, BR.business_process_id, BR.name, BR.code, '/business_rules/'||BR.id,  to_char(current_date, 'YYYYMMDD') 
UNION
select BP.playground_id, BP.id, BP.business_flow_id parent_id, BP.name, BP.code, '/business_processes/'||BP.id url, to_char(current_date, 'YYYYMMDD') Period_day, 
bp.all_records, 
bp.bad_records  error_count,
0 score,
0 workload,
0 added_value,
0 maintenance_cost
from odq_app.business_processes BP 
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
group by BP.playground_id,  BP.id, BP.business_flow_id, BP.name, BP.code, '/business_processes/'||BP.id, to_char(current_date, 'YYYYMMDD')
UNION
select BF.playground_id, BF.id, BF.business_area_id parent_id, BF.name, BF.code, '/business_flows/'||BF.id url, to_char(current_date, 'YYYYMMDD') Period_day,  
bf.all_records, 
bf.bad_records  error_count,
0 score,
0 workload,
0 added_value,
0 maintenance_cost
from odq_app.business_flows BF 
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
group by BF.playground_id, BF.id, BF.business_area_id, BF.name, BF.code, '/business_flows/'||BF.id, to_char(current_date, 'YYYYMMDD')
UNION
select BA.playground_id, BA.id, BA.playground_id parent_id, BA.name, BA.code, '/business_areas/'||BA.id url, to_char(current_date, 'YYYYMMDD') Period_day,
ba.all_records, 
ba.bad_records  error_count,
0 score,
0 workload,
0 added_value,
0 maintenance_cost
from odq_app.business_areas BA
inner join odq_app.business_flows BF on BF.business_area_id = BA.id
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
group by BA.playground_id,  BA.id, BA.playground_id, BA.name, BA.code, '/business_areas/'||BA.id, to_char(current_date, 'YYYYMMDD')
UNION
select PG.id, PG.id, 0 parent_id, PG.name, PG.code, '/playgrounds/'||PG.id url, to_char(current_date, 'YYYYMMDD') Period_day,
pg.all_records, 
pg.bad_records  error_count,
0 score,
0 workload,
0 added_value,
0 maintenance_cost
from odq_app.playgrounds PG
inner join odq_app.business_areas BA on BA.playground_id = PG.id
inner join odq_app.business_flows BF on BF.business_area_id = BA.id
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
group by PG.id,  PG.id, PG.id, PG.name, PG.code, '/playgrounds/'||PG.id, to_char(current_date, 'YYYYMMDD')
)  DWH
inner join odq_dwh.DIM_TIME DTIME on DTIME.PERIOD_DATE between current_date -20 and current_date
where dwh.playground_id = 99;

commit ;

update odq_dwh.dm_processes 
set error_count = 1+(all_records/10) * random() ;

commit ;

update odq_dwh.dm_processes 
set score = (1.0- (1.0 * error_count) / (1.0 * all_records))*100.0
where error_count > 0;

commit ;

/*Calculer l'impact des erreurs*/

update odq_dwh.dm_processes D 
set workload = D.score * R.maintenance_duration,
added_value = D.score * R.added_value,
maintenance_cost = D.score * R.maintenance_cost
from odq_app.business_rules R
where D.odq_object_id = R.id ;

update odq_dwh.dm_processes D 
set workload = R.workload,
added_value = R.added_value,
maintenance_cost = R.maintenance_cost
from ( select odq_parent_id,
sum(workload) workload,
sum(added_value) added_value,
sum(maintenance_cost) maintenance_cost from odq_dwh.dm_processes 
where odq_object_id < 100
group by odq_parent_id) R 
where
D.odq_object_id = R.odq_parent_id ;

/* Glisser le jeu d'essais de 20 jours */
update odq_dwh.dm_processes AS m 
set period_id = m.period_id+20,
period_day = p.period_day
from odq_dwh.dim_time AS p
where p.period_id = m.period_id+20 ;

/* Etendre le jeu d'essais de 10 jours */

insert into odq_dwh.dm_processes(PLAYGROUND_ID,ODQ_OBJECT_ID,ODQ_PARENT_ID,ODQ_OBJECT_NAME, ODQ_OBJECT_CODE, ODQ_OBJECT_URL, PERIOD_DAY,ALL_RECORDS,ERROR_COUNT,SCORE,WORKLOAD,ADDED_VALUE,MAINTENANCE_COST,PERIOD_ID,CREATED_BY,UPDATED_BY,CREATED_AT,UPDATED_AT,TERRITORY_ID,ORGANISATION_ID) 
select M.PLAYGROUND_ID,ODQ_OBJECT_ID,ODQ_PARENT_ID,ODQ_OBJECT_NAME, ODQ_OBJECT_CODE, ODQ_OBJECT_URL, T.PERIOD_DAY,ALL_RECORDS,ERROR_COUNT,SCORE,WORKLOAD,ADDED_VALUE,MAINTENANCE_COST, T.PERIOD_ID,M.CREATED_BY,M.UPDATED_BY,M.CREATED_AT,M.UPDATED_AT,0,0
from odq_dwh.dm_processes M inner join odq_dwh.dim_time T on T.period_id = M.period_id + 10; 
