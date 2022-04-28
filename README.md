[![Apache License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
# Asana 

This package models Asana data from [Fivetran's connector](https://fivetran.com/docs/applications/asana). It uses data in the format described by [this ERD](https://fivetran.com/docs/applications/asana#schemainformation).

This package enriches your Fivetran data by doing the following:
* Adds descriptions to tables and columns that are synced using Fivetran
* Adds freshness tests to source data
* Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
* Models staging tables, which will be used in our transform package

## Models

This package contains staging models, designed to work simultaneously with our [Asana transform package](https://github.com/fivetran/dbt_asana).  The staging models:
* Remove any rows that are soft-deleted
* Name columns consistently across all packages:
    * Boolean fields are prefixed with `is_` or `has_`
    * Timestamps are appended with `_at`
    * ID primary keys are prefixed with the name of the table.  For example, the user table's ID column is renamed user_id.
    * Foreign keys include the table that they refer to. For example, the project table's owner ID column is renamed owner_user_id.

## Installation Instructions
Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

Include in your `packages.yml`

```yaml
packages:
  - package: fivetran/asana_source
    version: [">=0.5.0", "<0.6.0"]
```

## Configuration
By default, this package will run using your target database and the `asana` schema. If this is not where your Asana data is (perhaps your Asana schema is `asana_fivetran`), add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
config-version: 2

vars:
  asana_source:
    asana_database: your_database_name
    asana_schema: your_schema_name 
```

To add additional columns to tasks use the pass-through column variable.  This is useful for adding custom fields not already included in this package.

```yml
# dbt_project.yml

...
vars:
  asana_source:
    task_pass_through_columns: [custom_status, custom_department]
```

### Changing the Build Schema
By default this package will build the Asana staging models within a schema titled (<target_schema> + `_stg_asana`) in your target database. If this is not where you would like your Asana staging data to be written to, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
models:
    asana_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```

## Database support
This package is compatible with BigQuery, Snowflake, and Redshift.

## Contributions

Additional contributions to this package are very welcome! Please create issues
or open PRs against `main`. Check out 
[this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) 
on the best workflow for contributing to a package.

## Resources:
- Provide [feedback](https://www.surveymonkey.com/r/DQ7K7WW) on our existing dbt packages or what you'd like to see next
- Have questions, feedback, or need help? Book a time during our office hours [using Calendly](https://calendly.com/fivetran-solutions-team/fivetran-solutions-team-office-hours) or email us at solutions@fivetran.com
- Find all of Fivetran's pre-built dbt packages in our [dbt hub](https://hub.getdbt.com/fivetran/)
- Learn how to orchestrate [dbt transformations with Fivetran](https://fivetran.com/docs/transformations/dbt)
- Learn more about Fivetran overall [in our docs](https://fivetran.com/docs)
- Check out [Fivetran's blog](https://fivetran.com/blog)
- Learn more about dbt [in the dbt docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the dbt blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
