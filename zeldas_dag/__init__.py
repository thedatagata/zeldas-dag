from zeldas_dag.zeldas_assets import dbt_assets

from dagster import ScheduleDefinition, define_asset_job, Definitions  

run_dbt_job = define_asset_job("run_dbt", selection="*")

defs = Definitions(
    assets=dbt_assets, 
    schedules=[
        ScheduleDefinition(
            job=run_dbt_job,
            cron_schedule="@daily"
        )
    ]
)