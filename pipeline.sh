#!/bin/bash

# install psql -> https://www.postgresql.org/download/
# for ubuntu, package postgresql-client-12 is enough

PSQL_CONNECTION=postgresql://root:password@localhost:5432/postgres

psql $PSQL_CONNECTION -f schema.sql

psql $PSQL_CONNECTION -f extract.sql

psql $PSQL_CONNECTION -f clean.sql

psql $PSQL_CONNECTION -f aggregate.sql
