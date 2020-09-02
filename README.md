**Bogus - 100% Real Fake Data**

Control Panel found [here](https://app.dev.looker.com/dashboards/697)

Bogus is the process which reverse populates a database with realistic looking fake data from its database design contract (ERD). The information from an ERD, fields tables and relationships, are translated into a JSON array of field "recipes" which describe to the bogus "maker" how to materialize a table. This method allows us to add/remove rows to the bogus dataset over time, modify field recipes simply, and automatically maintain primary and foreign key dependencies (!).

HOW TO ADD A NEW BOGUS DATASET:
1. Add a new `id, name` to [this dataset](https://app.dev.looker.com/sql/px9y5qysgnvynf?toggle=dat,sql)
2. Add a sheet to our [collection of Bogus Schemas](https://docs.google.com/spreadsheets/d/1e38QL47sD8Kub50WxxR5_UtDiXN_mt2ZQlHTMqax7YI/edit?usp=sharing). Follow the demonstrated pattern for the new dataset.
3. Download this completed .tsv and upload to [this bucket](https://console.cloud.google.com/storage/browser/bogus-dev)
4. On the BOGUS CONTROL PANEL dashboard, on the MAKE RECIPES tile, click the action next to your dataset from step 1. Enter the filename of the tsv you uploaded in step 3 (`dataset.tsv`).
5. Download the `dataset.bogus` from the bucket referenced in step 3.
6. Complete the outstanding TODOs. Refer to Snippets section for help.
7. Insert the JSON array as `string` records into this table:
`spencer-white-tckt87992:bogus.recipes`
8. On the BOGUS CONTROL PANEL dashboard, on the MAKE DATA tile, point to a dataset, enter a make order, and select a write-disposition.

Some notes on MAKE DATA:
- If `dataset` doesn't exist, one will be created for you. Use this to make variants.
- The keys to `model bogus` are table names, or the selector "." which references all tables.
- There is a 120 second time-out for this function. So you'll have to play around with it and figure out what kind of stress you can put on the system. Typically, first time I try to add 100 rows to ".". Then I check to see what percent of tables were touched in time, and optimize adding 1000 rows to X tables. For datasets with big tables, you might only be able to add rows to one table at a time. If the action modal goes away, job was successful. If not, an error message will be returned -- this doesn't mean the job was unsuccessful, just that it didn't complete.

HOW TO ADD NEW ROWS TO AN EXISTING BOGUS DATASET:
1. On the BOGUS CONTROL PANEL dashboard, on the MAKE DATA tile, point to a dataset, enter a make order, and choose the APPEND write-disposition.

HOW TO MODIFY A FIELD RECIPE:
1. On the BOGUS CONTROL PANEL dashboard, filter the dashboard to the block whose schema you'd like to modify. In the FIELD RECIPES tile, press the "Modify Recipe" action next to the `Field Recipe` you'd like to modify. Enter a valid recipe and submit. Refer to Snippets section for help with valid recipes.
2. On the MAKE DATA tile, point to a dataset, enter a make order for the table you've modified, and choose the DROP&REPLACE write-disposition. Make as many rows as were present before for no result changes.



**Snippets**
Copy the whole blob, can paste in place over the TODO recipe blobs...

INT between 1 and 1000... Good for random measure fields
    "dist": "random",
    "fk_type": "pyint",
    "fk_args": {
      "min_value": 1,
      "max_value": 1000
    },
    "bq_type": "INT64"

STRING random color name... Good for random dimension fields
    "dist": "random",
    "fk_type": "safe_color_name",
    "fk_args": {},
    "bq_type": "STRING"

STRING random datetime past 3 years...
    "dist": "random",
    "fk_type": "past_datetime",
    "fk_args": {
      "start_date": "-3y"
    },
    "bq_type": "STRING"

STRING random crytpo... Good if you don't want colors or already used
    "dist": "random",
    "fk_type": "cryptocurrency_name",
    "fk_args": {},
    "bq_type": "STRING"

BOOL... True or false
    "dist": "random",
    "fk_type": "pybool",
    "fk_args": {},
    "bq_type": "BOOL"

STRING... Got an enumerated type?
    "dist": "random",
    "fk_type": "random_element",
    "fk_args": {
      "elements": "[Send, Delivery, Open, Clicks, Bounce, SoftBounce, MarkAsSpam, Unsubscribe]"
    },
    "bq_type": "STRING"

STRING... need emails?
    "dist": "random",
    "fk_type": "safe_email",
    "fk_args": {},
    "bq_type": "STRING"


CUSTOM?!?!?!
`dist:` is either pk, fk, or random... Will eventually add more :D
`fk_type:` corresponds to any Faker provider https://faker.readthedocs.io/en/master/providers.html
`fk_args:` is a json object with key, value pairs corresponding to the faker provider parameters
`bq_type:` corresponds to any BQ field data type https://cloud.google.com/bigquery/docs/reference/standard-sql/data-types
