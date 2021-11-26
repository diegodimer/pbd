#!/bin/bash
set -e

# PSQL_CONNECTION=postgresql://postgres:postgres@0.0.0.0:5432/postgres

psql $PSQL_CONNECTION -f /db_scripts/schema.sql

psql $PSQL_CONNECTION -f /db_scripts/extract.sql

psql $PSQL_CONNECTION -f /db_scripts/clean.sql

psql $PSQL_CONNECTION -f /db_scripts/aggregate.sql