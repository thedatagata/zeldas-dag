from dagster_dbt import load_assets_from_dbt_project, dbt_cli_resource
from dagster import file_relative_path, with_resources

DBT_PROJECT_PATH = file_relative_path(__file__, "../../zeldas-dbt-models")
DBT_PROFILES = file_relative_path(__file__, "../../zeldas-dbt-models/config")

dbt_assets = with_resources(
    load_assets_from_dbt_project(DBT_PROJECT_PATH),
    {
        "dbt": dbt_cli_resource.configured(
            {
                "project_dir": DBT_PROJECT_PATH,
                "profiles_dir": DBT_PROFILES
            }
        )
    }
)