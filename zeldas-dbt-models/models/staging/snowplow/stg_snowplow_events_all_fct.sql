select * 
from {{ ref('src_snowplow_events_all_fct') }} e 
where e.collector_tstamp > TIMESTAMP_ADD(current_timestamp(), INTERVAL -7 DAY)
  and e.event = 'pageview'