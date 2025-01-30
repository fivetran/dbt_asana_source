# Decision Log

## Tags and Ticket Tags Source Configurations
This package takes into consideration that not all users of Asana will utilize tags or ticket tags. 

The below variables control the respective behaviors and may be overridden if desired in your `dbt_project.yml`. If overridden and configured to `false`, the models will still be materialized, but it will return no rows (or one for Redshift due to maintaining data types). This ensures the package does not generate records from the source, but still materializes the schema to ensure there is no run failure. The intention is that these variables are not needed to be configured, but if necessary they are available.


```yml
vars:
  using_asana__tag: false ## Dynamically checks the source at runtime to set as either true or false. May be overridden using this variable if desired.
  using_asana__task_tag: false ## Dynamically checks the source at runtime to set as either true or false. May be overridden using this variable if desired.
```