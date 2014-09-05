select distinct rawtohex(scope_mask) from odq_app.dwh_records
select distinct rawtohex(rule_mask) from odq_app.dwh_records
select distinct rawtohex(error_mask) from odq_app.dwh_records

select distinct odq_app.to_binary(power(2,32)+rawtohex(scope_mask)) from odq_app.dwh_records
select distinct odq_app.to_binary(power(2,32)+rawtohex(rule_mask)) from odq_app.dwh_records
select distinct odq_app.to_binary(power(2,32)+rawtohex(error_mask)) from odq_app.dwh_records

select distinct odq_app.from_binary(odq_app.to_binary(rawtohex(scope_mask))) from odq_app.dwh_records
select distinct odq_app.from_binary(odq_app.to_binary(rawtohex(rule_mask))) from odq_app.dwh_records
select distinct odq_app.from_binary(odq_app.to_binary(rawtohex(error_mask))) from odq_app.dwh_records

select * from odq_app.dwh_records
where odq_app.bitand2(rawtohex(error_mask),4) <> 0 

select distinct rawtohex(error_mask) from odq_app.dwh_records

select odq_app.to_binary(power(2,32)+rawtohex(scope_mask)),  count(*) from odq_app.dwh_records group by odq_app.to_binary(power(2,32)+rawtohex(scope_mask))
select odq_app.to_binary(power(2,32)+rawtohex(rule_mask)),  count(*) from odq_app.dwh_records group by odq_app.to_binary(power(2,32)+rawtohex(rule_mask))
select odq_app.to_binary(power(2,32)+rawtohex(error_mask)),  count(*) from odq_app.dwh_records group by odq_app.to_binary(power(2,32)+rawtohex(error_mask))

select BR.id, BA.name, BF.name, BP.name, BR.name, count(distinct record_id) total_records
from odq_app.business_areas BA
inner join odq_app.business_flows BF on BF.business_area_id = BA.id
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
inner join odq_app.dwh_records DWH on odq_app.bitand2(power(2,BR.id), rawtohex(rule_mask)) <> 0
group by BR.id, BA.name, BF.name, BP.name, BR.name
order by 1

select BR.id, BA.name, BF.name, BP.name, BR.name, count(distinct record_id) error_records
from odq_app.business_areas BA
inner join odq_app.business_flows BF on BF.business_area_id = BA.id
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
inner join odq_app.dwh_records DWH on odq_app.bitand3(power(2,BR.id), rawtohex(rule_mask), rawtohex(error_mask)) <> 0
group by BR.id, BA.name, BF.name, BP.name, BR.name
order by 1

select BR.id, 
BA.name BA, 
BF.name BF, 
BP.name BP, 
BR.name BR, 
count(record_id) total_records, 
sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end) bad_records
from odq_app.business_areas BA
inner join odq_app.business_flows BF on BF.business_area_id = BA.id
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
inner join odq_app.dwh_records DWH on odq_app.bitand2(power(2,BR.id), rawtohex(rule_mask)) <> 0
group by BR.id, BA.name, BF.name, BP.name, BR.name
order by 1



select BR.playground_id, BR.playground_id || '-BR-' || BR.id ODQ_object_id, BR.playground_id || '-BP-' || BR.business_process_id ODQ_parent_id, to_char(current_date, 'YYYYMMDD') Period_id,  
BR.name BR, 
count(record_id) all_records, 
sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end) bad_records,
sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end)/count(record_id)*100 score
from odq_app.business_areas BA
inner join odq_app.business_flows BF on BF.business_area_id = BA.id
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
inner join odq_app.dwh_records DWH on odq_app.bitand2(power(2,BR.id), rawtohex(rule_mask)) <> 0
group by BR.playground_id, BR.playground_id || '-BR-' || BR.id, BR.playground_id || '-BP-' || BR.business_process_id, to_char(current_date, 'YYYYMMDD'),  
BR.name  
order by 2


/* Full query with -1 assigned to rules with no record evaluated */
/* Is it necessary ? As missing record in the DM_MEASURES table will lead to no join when queried in the front-end */

insert into odq_app.dm_measures(PLAYGROUND_ID,ODQ_OBJECT_ID,ODQ_PARENT_ID,PERIOD_DAY,ALL_RECORDS,ERROR_COUNT,SCORE,PERIOD_ID,CREATED_BY,UPDATED_BY,CREATED_AT,UPDATED_AT,PROCESS_ID) 
select DWH.PLAYGROUND_ID, DWH.ODQ_OBJECT_ID, DWH.ODQ_PARENT_ID, DTIME.PERIOD_DAY, DWH.ALL_RECORDS, DWH.ERROR_COUNT,DWH.SCORE, DTIME.PERIOD_ID,'Rake','Rake',current_timestamp, current_timestamp,0 from (

select BR.playground_id, to_char(BR.playground_id) || '-BR-' || to_char(BR.id) ODQ_object_id, to_char(BR.playground_id) || '-BP-' || to_char(BR.business_process_id) ODQ_parent_id, to_char(current_date, 'YYYYMMDD') Period_day,  
BR.name , 
count(distinct record_id) all_records, 
sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end) error_count,
case when count(record_id) <> 0 then 
(1-sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end)/count(distinct record_id))*100 
else -1
end score
from odq_app.business_areas BA
inner join odq_app.business_flows BF on BF.business_area_id = BA.id
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
left outer join odq_app.dwh_records DWH on odq_app.bitand2(power(2,BR.id), rawtohex(rule_mask)) <> 0
group by BR.playground_id, to_char(BR.playground_id) || '-BR-' || to_char(BR.id), to_char(BR.playground_id) || '-BP-' || to_char(BR.business_process_id), to_char(current_date, 'YYYYMMDD'),  
BR.name  

UNION

select BP.playground_id, to_char(BP.playground_id) || '-BP-' || to_char(BP.id) ODQ_object_id, to_char(BP.playground_id) || '-BF-' || to_char(BP.business_flow_id) ODQ_parent_id, to_char(current_date, 'YYYYMMDD') Period_day,  
BP.name , 
count(distinct record_id) all_records, 
sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end) error_count,
case when count(record_id) <> 0 then 
(1-sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end)/count(distinct record_id))*100 
else -1
end score
from odq_app.business_areas BA
inner join odq_app.business_flows BF on BF.business_area_id = BA.id
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
left outer join odq_app.dwh_records DWH on odq_app.bitand2(power(2,BR.id), rawtohex(rule_mask)) <> 0
group by BP.playground_id, to_char(BP.playground_id) || '-BP-' || to_char(BP.id), to_char(BP.playground_id) || '-BF-' || to_char(BP.business_flow_id), to_char(current_date, 'YYYYMMDD'),  
BP.name

UNION

select BF.playground_id, to_char(BF.playground_id) || '-BF-' || to_char(BF.id) ODQ_object_id, to_char(BF.playground_id) || '-BA-' || to_char(BF.business_area_id) ODQ_parent_id, to_char(current_date, 'YYYYMMDD') Period_day,  
BF.name , 
count(distinct record_id) all_records, 
sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end) error_count,
case when count(record_id) <> 0 then 
(1-sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end)/count(distinct record_id))*100 
else -1
end score
from odq_app.business_areas BA
inner join odq_app.business_flows BF on BF.business_area_id = BA.id
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
left outer join odq_app.dwh_records DWH on odq_app.bitand2(power(2,BR.id), rawtohex(rule_mask)) <> 0
group by BF.playground_id, to_char(BF.playground_id) || '-BF-' || to_char(BF.id), to_char(BF.playground_id) || '-BA-' || to_char(BF.business_area_id), to_char(current_date, 'YYYYMMDD'),  
BF.name 

UNION

select BA.playground_id, to_char(BA.playground_id) || '-BA-' || to_char(BA.id) ODQ_object_id, to_char(BA.playground_id) ODQ_parent_id, to_char(current_date, 'YYYYMMDD') Period_day,  
BA.name , 
count(distinct record_id) all_records, 
sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end) error_count,
case when count(record_id) <> 0 then 
(1-sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end)/count(distinct record_id))*100 
else -1
end score
from odq_app.business_areas BA
inner join odq_app.business_flows BF on BF.business_area_id = BA.id
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
left outer join odq_app.dwh_records DWH on odq_app.bitand2(power(2,BR.id), rawtohex(rule_mask)) <> 0
group by BA.playground_id, to_char(BA.playground_id) || '-BA-' || to_char(BA.id), to_char(BA.playground_id), to_char(current_date, 'YYYYMMDD'),  
BA.name
)  DWH
inner join odq_app.DIM_TIME DTIME on DWH.PERIOD_DAY = DTIME.PERIOD_DAY 

/*Based id*/
insert into odq_app.dm_measures(PLAYGROUND_ID,ODQ_OBJECT_ID,ODQ_PARENT_ID,ODQ_OBJECT_NAME, ODQ_OBJECT_CODE, ODQ_OBJECT_URL, PERIOD_DAY,ALL_RECORDS,ERROR_COUNT,SCORE,PERIOD_ID,CREATED_BY,UPDATED_BY,CREATED_AT,UPDATED_AT,PROCESS_ID) 
select DWH.PLAYGROUND_ID, DWH.ID, DWH.PARENT_ID, DWH.NAME, DWH.CODE, DWH.URL, DTIME.PERIOD_DAY, DWH.ALL_RECORDS, DWH.ERROR_COUNT,DWH.SCORE, DTIME.PERIOD_ID,'Rake','Rake',current_timestamp, current_timestamp,0 from (

select BR.playground_id, BR.id, BR.business_process_id parent_id, BR.name, BR.code, '/business_rules/'||BR.id url, to_char(current_date, 'YYYYMMDD') Period_day,  
count(distinct record_id) all_records, 
sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end) error_count,
case when count(record_id) <> 0 then 
(1-sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end)/count(distinct record_id))*100 
else -1
end score
from odq_app.business_areas BA
inner join odq_app.business_flows BF on BF.business_area_id = BA.id
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
left outer join odq_app.dwh_records DWH on odq_app.bitand2(power(2,BR.id), rawtohex(rule_mask)) <> 0
group by BR.playground_id, BR.id, BR.business_process_id, BR.name, BR.code, '/business_rules/'||BR.id,  to_char(current_date, 'YYYYMMDD') 

UNION

select BP.playground_id, BP.id, BP.business_flow_id parent_id, BP.name, BP.code, '/business_processes/'||BP.id url, to_char(current_date, 'YYYYMMDD') Period_day, 
count(distinct record_id) all_records, 
sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end) error_count,
case when count(record_id) <> 0 then 
(1-sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end)/count(distinct record_id))*100 
else -1
end score
from odq_app.business_areas BA
inner join odq_app.business_flows BF on BF.business_area_id = BA.id
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
left outer join odq_app.dwh_records DWH on odq_app.bitand2(power(2,BR.id), rawtohex(rule_mask)) <> 0
group by BP.playground_id,  BP.id, BP.business_flow_id, BP.name, BP.code, '/business_processes/'||BP.id, to_char(current_date, 'YYYYMMDD')

UNION

select BF.playground_id, BF.id, BF.business_area_id parent_id, BF.name, BF.code, '/business_flows/'||BF.id url, to_char(current_date, 'YYYYMMDD') Period_day,  
count(distinct record_id) all_records, 
sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end) error_count,
case when count(record_id) <> 0 then 
(1-sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end)/count(distinct record_id))*100 
else -1
end score
from odq_app.business_areas BA
inner join odq_app.business_flows BF on BF.business_area_id = BA.id
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
left outer join odq_app.dwh_records DWH on odq_app.bitand2(power(2,BR.id), rawtohex(rule_mask)) <> 0
group by BF.playground_id, BF.id, BF.business_area_id, BF.name, BF.code, '/business_flows/'||BF.id, to_char(current_date, 'YYYYMMDD')

UNION

select BA.playground_id, BA.id, BA.playground_id parent_id, BA.name, BA.code, '/business_areas/'||BA.id url, to_char(current_date, 'YYYYMMDD') Period_day,
count(distinct record_id) all_records, 
sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end) error_count,
case when count(record_id) <> 0 then 
(1-sum(case
when  odq_app.bitand2(power(2,BR.id), rawtohex(error_mask)) <> 0 then 1
else 0
end)/count(distinct record_id))*100 
else -1
end score
from odq_app.business_areas BA
inner join odq_app.business_flows BF on BF.business_area_id = BA.id
inner join odq_app.business_processes BP on BP.business_flow_id = BF.id
inner join odq_app.business_rules BR on BR.business_process_id = BP.id
left outer join odq_app.dwh_records DWH on odq_app.bitand2(power(2,BR.id), rawtohex(rule_mask)) <> 0
group by BA.playground_id,  BA.id, BA.playground_id, BA.name, BA.code, '/business_areas/'||BA.id, to_char(current_date, 'YYYYMMDD')

)  DWH
inner join odq_app.DIM_TIME DTIME on DWH.PERIOD_DAY = DTIME.PERIOD_DAY








