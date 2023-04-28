run:
	dbt run --profiles-dir ./ --project-dir brazillian_ecom 

test:
	dbt test --profiles-dir ./ --project-dir brazillian_ecom

seed:
	dbt seed --profiles-dir ./ --project-dir brazillian_ecom

docs:
	dbt docs generate --profiles-dir ./ --project-dir brazillian_ecom && \
	dbt docs serve --profiles-dir ./ --project-dir brazillian_ecom

external:
	dbt run-operation --profiles-dir ./ --project-dir brazillian_ecom stage_external_sources	