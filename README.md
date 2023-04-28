dbt init --profiles-dir ./

```bash
# outputs

21:24:55  Running with dbt=1.4.6
Enter a name for your project (letters, digits, underscore): brazillian_ecom
Which database would you like to use?
[1] databricks
[2] spark

(Don't see the one you want? https://docs.getdbt.com/docs/available-adapters)

Enter a number: 1
host (yourorg.databricks.com): <your_host>
http_path (HTTP Path): <your_http>
token (dapiXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX): 
[1] use Unity Catalog
[2] not use Unity Catalog
Desired unity catalog option (enter a number): 2
schema (default schema that dbt will build objects in): brazillian_ecom
threads (1 or more) [1]: 1
21:25:24  Profile brazillian_ecom written to /home/hongong/working/dbt-databricks/profiles.yml using target's profile_template.yml and your supplied values. Run 'dbt debug' to validate the connection.
21:25:24  
Your new dbt project "brazillian_ecom" was created!

For more information on how to configure the profiles.yml file,
please consult the dbt documentation here:

  https://docs.getdbt.com/docs/configure-your-profile

One more thing:

Need help? Don't hesitate to reach out to us via GitHub issues or on Slack:

  https://community.getdbt.com/

Happy modeling!
```

dbt run --profiles-dir ./ --project-dir brazillian_ecom 

``bash
# outputs

21:31:49  Running with dbt=1.4.6
21:31:49  Unable to do partial parsing because saved manifest not found. Starting full parse.
21:31:49  Found 2 models, 4 tests, 0 snapshots, 0 analyses, 385 macros, 0 operations, 0 seed files, 0 sources, 0 exposures, 0 metrics
21:31:49  
21:31:51  Concurrency: 1 threads (target='dev')
21:31:51  
21:31:51  1 of 2 START sql table model brazillian_ecom.my_first_dbt_model ................ [RUN]
21:31:56  1 of 2 OK created sql table model brazillian_ecom.my_first_dbt_model ........... [OK in 5.07s]
21:31:56  2 of 2 START sql view model brazillian_ecom.my_second_dbt_model ................ [RUN]
21:31:58  2 of 2 OK created sql view model brazillian_ecom.my_second_dbt_model ........... [OK in 1.03s]
21:31:58  
21:31:58  Finished running 1 table model, 1 view model in 0 hours 0 minutes and 8.53 seconds (8.53s).
21:31:58  
21:31:58  Completed successfully
21:31:58  
21:31:58  Done. PASS=2 WARN=0 ERROR=0 SKIP=0 TOTAL=2
```

dbt test --profiles-dir ./ --project-dir brazillian_ecom 

```bash
# outputs

21:33:13  Running with dbt=1.4.6
21:33:13  Found 2 models, 4 tests, 0 snapshots, 0 analyses, 385 macros, 0 operations, 0 seed files, 0 sources, 0 exposures, 0 metrics
21:33:13  
21:33:15  Concurrency: 1 threads (target='dev')
21:33:15  
21:33:15  1 of 4 START test not_null_my_first_dbt_model_id ............................... [RUN]
21:33:16  1 of 4 FAIL 1 not_null_my_first_dbt_model_id ................................... [FAIL 1 in 1.50s]
21:33:16  2 of 4 START test not_null_my_second_dbt_model_id .............................. [RUN]
21:33:17  2 of 4 PASS not_null_my_second_dbt_model_id .................................... [PASS in 1.15s]
21:33:17  3 of 4 START test unique_my_first_dbt_model_id ................................. [RUN]
21:33:19  3 of 4 PASS unique_my_first_dbt_model_id ....................................... [PASS in 1.93s]
21:33:19  4 of 4 START test unique_my_second_dbt_model_id ................................ [RUN]
21:33:21  4 of 4 PASS unique_my_second_dbt_model_id ...................................... [PASS in 1.56s]
21:33:21  
21:33:21  Finished running 4 tests in 0 hours 0 minutes and 8.11 seconds (8.11s).
21:33:21  
21:33:21  Completed with 1 error and 0 warnings:
21:33:21  
21:33:21  Failure in test not_null_my_first_dbt_model_id (models/example/schema.yml)
21:33:21    Got 1 result, configured to fail if != 0
21:33:21  
21:33:21    compiled Code at target/compiled/brazillian_ecom/models/example/schema.yml/not_null_my_first_dbt_model_id.sql
21:33:21  
21:33:21  Done. PASS=3 WARN=0 ERROR=1 SKIP=0 TOTAL=4
```

dbt docs generate --profiles-dir ./ --project-dir brazillian_ecom && \
dbt docs serve --profiles-dir ./ --project-dir brazillian_ecom

```bash
# outputs

21:36:12  Running with dbt=1.4.6
21:36:12  Found 2 models, 4 tests, 0 snapshots, 0 analyses, 385 macros, 0 operations, 0 seed files, 0 sources, 0 exposures, 0 metrics
21:36:12  
21:36:14  Concurrency: 1 threads (target='dev')
21:36:14  
21:36:14  Done.
21:36:14  Building catalog
21:36:15  Catalog written to /home/hongong/working/dbt-databricks/brazillian_ecom/target/catalog.json
21:36:18  Running with dbt=1.4.6
21:36:18  Serving docs at 0.0.0.0:8080
21:36:18  To access from your browser, navigate to:  http://localhost:8080
21:36:18  
21:36:18  
21:36:18  Press Ctrl+C to exit.
127.0.0.1 - - [28/Apr/2023 04:36:20] "GET / HTTP/1.1" 200 -
127.0.0.1 - - [28/Apr/2023 04:36:20] "GET /manifest.json?cb=1682631380490 HTTP/1.1" 200 -
127.0.0.1 - - [28/Apr/2023 04:36:20] "GET /catalog.json?cb=1682631380490 HTTP/1.1" 200 -
```

dbt seed --profiles-dir ./ --project-dir brazillian_ecom

```bash
# outputs

21:38:01  Running with dbt=1.4.6
21:38:02  Found 2 models, 4 tests, 0 snapshots, 0 analyses, 385 macros, 0 operations, 1 seed file, 0 sources, 0 exposures, 0 metrics
21:38:02  
21:38:04  Concurrency: 1 threads (target='dev')
21:38:04  
21:38:04  1 of 1 START seed file brazillian_ecom.product_category_name_translation ....... [RUN]
21:38:11  1 of 1 OK loaded seed file brazillian_ecom.product_category_name_translation ... [INSERT 71 in 6.62s]
21:38:11  
21:38:11  Finished running 1 seed in 0 hours 0 minutes and 9.70 seconds (9.70s).
21:38:11  
21:38:11  Completed successfully
21:38:11  
21:38:11  Done. PASS=1 WARN=0 ERROR=0 SKIP=0 TOTAL=1
```

dbt run-operation --profiles-dir ./ --project-dir brazillian_ecom stage_external_sources

```bash
# outputs

08:47:21  Running with dbt=1.4.6
08:47:21  1 of 1 START external source brazillian_ecom.olist_order_items
08:47:22  1 of 1 (1) drop table if exists `brazillian_ecom`.`olist_order_items`
08:47:22  1 of 1 (1) OK
08:47:22  1 of 1 (2) create table `brazillian_ecom`.`olist_order_items` (                    order_id...  
08:47:24  1 of 1 (2) OK
```