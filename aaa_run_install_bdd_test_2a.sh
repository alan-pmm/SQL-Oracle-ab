#!/bin/bash

# Configuration - can be overridden by environment variables
ORACLE_USER=${ORACLE_USER:-"ALAIN"}
ORACLE_PASSWORD=${ORACLE_PASSWORD:-"oracle"}
ORACLE_CONNECTION=${ORACLE_CONNECTION:-"localhost:1521/XE"}

# List your SQL files here
SQL_FILES=(
  "db_drop_ref_tables.sql"
  "ac_create_tables_alain_ref_person_product.sql"
  "dc_drop_bdd_a_tables_alain.sql"
  "ab_create_tables_alain_a_bdd.sql"
  "ac_alter_tables_alain_a_bdd.sql"
  "ab_create_sequence_with_array.sql"
  "ad_insert_into_tables_alain_a_person_product_with_seq.sql"
  "ae_create_function_randint.sql"
  "ae_create_proc_insert_into_table_a_order_history_sp_.sql"
  "af_insert_into_tables_alain_a_order_history.sql"
  "da_drop_sequences.sql"
  "db_drop_ref_tables.sql"
)

# Log file with timestamp
LOG_FILE="oracle_run_$(date +%Y%m%d_%H%M%S).log"

for SQL_FILE in "${SQL_FILES[@]}"; do
  if [[ ! -f "$SQL_FILE" ]]; then
    echo "Error: SQL file '$SQL_FILE' not found." | tee -a "$LOG_FILE"
    continue
  fi
  echo "Running $SQL_FILE..." | tee -a "$LOG_FILE"
  sqlplus -s "${ORACLE_USER}/${ORACLE_PASSWORD}@${ORACLE_CONNECTION}" @"$SQL_FILE" >> "$LOG_FILE" 2>&1
done

echo "Log written to $LOG_FILE"