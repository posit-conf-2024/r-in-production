library(duckdb)
con <- DBI::dbConnect(duckdb::duckdb())

DBI::dbExecute(con, "
  CREATE VIEW pollen AS
    SELECT * FROM read_parquet('data/*.parquet');"
)

DBI::dbGetQuery(con, "SELECT count(*) FROM pollen;")
DBI::dbGetQuery(con, "SELECT * FROM pollen LIMIT 10;")
DBI::dbGetQuery(con, "
  SELECT date, count(*) 
  FROM pollen 
  WHERE count > 0 
  GROUP BY date;
")
