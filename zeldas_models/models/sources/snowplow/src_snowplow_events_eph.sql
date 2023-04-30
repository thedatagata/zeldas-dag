SELECT * 
FROM {{ source('snowplow', 'events') }}