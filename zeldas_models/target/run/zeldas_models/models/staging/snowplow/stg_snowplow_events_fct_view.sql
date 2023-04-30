

  create or replace view `snowplow-gcp-integration`.`dbt_yale`.`stg_snowplow_events_fct_view`
  OPTIONS()
  as with __dbt__cte__src_snowplow_events_eph as (
SELECT * 
FROM `snowplow-gcp-integration`.`sp_snowplow_db`.`events`
)select * 
from __dbt__cte__src_snowplow_events_eph e 
where e.collector_tstamp > TIMESTAMP_ADD(current_timestamp(), INTERVAL -7 DAY)
  and e.event = 'pageview';

