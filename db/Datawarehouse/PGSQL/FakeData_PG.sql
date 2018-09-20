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
set score = (1.0- (1.0 * error_count) / (1.0 * all_records))*100.0 -5
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
/* Generate unique object identifier for loading into Data Marts by concatenating id with object type:
0: playground
1: landscape
2: scope
3: business object
4: business area
5: business flow
6: business process
7: businness rule
8: activity
9: task
*/
insert into odq_dwh.dm_processes(PLAYGROUND_ID,ODQ_OBJECT_ID,ODQ_PARENT_ID,ODQ_OBJECT_NAME, ODQ_OBJECT_CODE, ODQ_OBJECT_URL, PERIOD_DAY, ALL_RECORDS,ERROR_COUNT,SCORE,WORKLOAD,ADDED_VALUE,MAINTENANCE_COST,PERIOD_ID,CREATED_BY,UPDATED_BY,CREATED_AT,UPDATED_AT, TERRITORY_ID, ORGANISATION_ID) 
select DWH.PLAYGROUND_ID, DWH.ID, DWH.PARENT_ID, DWH.NAME, DWH.CODE, DWH.URL, DTIME.PERIOD_DAY, DWH.ALL_RECORDS, DWH.ERROR_COUNT, DWH.SCORE, DWH.WORKLOAD, DWH.ADDED_VALUE, DWH.MAINTENANCE_COST, DTIME.PERIOD_ID,'Rake','Rake',current_timestamp, current_timestamp, 0, 0 from (
select BR.playground_id*10 playground_id, BR.id*10+7 id, BR.business_process_id*10+6 parent_id, BR.name, BR.code, '/business_rules/'||BR.id url, to_char(current_date, 'YYYYMMDD') Period_day,  
br.all_records, 
br.bad_records error_count,
0 score,
0 workload,
0 added_value,
0 maintenance_cost
from odq_app.business_rules BR 
/*group by BR.playground_id*10, BR.id*10+7, BR.business_process_id*10+6, BR.name, BR.code, '/business_rules/'||BR.id,  to_char(current_date, 'YYYYMMDD') */
UNION
select BP.playground_id*10 playground_id, BP.id*10+6 id, BP.business_flow_id*10+5 parent_id, BP.name, BP.code, '/business_processes/'||BP.id url, to_char(current_date, 'YYYYMMDD') Period_day, 
bp.all_records, 
bp.bad_records  error_count,
0 score,
0 workload,
0 added_value,
0 maintenance_cost
from odq_app.business_processes BP 
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
/*group by BP.playground_id*10,  BP.id*10+6, BP.business_flow_id*10+5', BP.name, BP.code, '/business_processes/'||BP.id, to_char(current_date, 'YYYYMMDD')*/
UNION
select BF.playground_id*10 playground_id, BF.id*10+5 id, BF.business_area_id*10+4 parent_id, BF.name, BF.code, '/business_flows/'||BF.id url, to_char(current_date, 'YYYYMMDD') Period_day,  
bf.all_records, 
bf.bad_records  error_count,
0 score,
0 workload,
0 added_value,
0 maintenance_cost
from odq_app.business_flows BF 
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
/*group by BF.playground_id*10, BF.id*10+5, BF.business_area_id*10+4, BF.name, BF.code, '/business_flows/'||BF.id, to_char(current_date, 'YYYYMMDD')*/
UNION
select BA.playground_id*10 playground_id, BA.id*10+4 id, BA.playground_id*10 parent_id, BA.name, BA.code, '/business_areas/'||BA.id url, to_char(current_date, 'YYYYMMDD') Period_day,
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
/*group by BA.playground_id*10,  BA.id*10+4, BA.playground_id*10, BA.name, BA.code, '/business_areas/'||BA.id, to_char(current_date, 'YYYYMMDD')*/
UNION
select PG.id*10 playground_id, PG.id*10 id, PG.id*10 parent_id, PG.name, PG.code, '/playgrounds/'||PG.id url, to_char(current_date, 'YYYYMMDD') Period_day,
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
/*group by PG.id*10, PG.id*10, PG.id*10, PG.name, PG.code, '/playgrounds/'||PG.id, to_char(current_date, 'YYYYMMDD')*/
)  DWH
inner join odq_dwh.DIM_TIME DTIME on DTIME.PERIOD_DATE between current_date -20 and current_date
where dwh.playground_id = 990;
