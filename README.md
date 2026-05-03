# Step 1: Create the database and tables
sqlite3 baseball.db ".read ./2025/scripts/01_create_schema.ddl"

# Step 2: Load all CSV data
sqlite3 baseball.db ".read ./2025/scripts/02_load_data.sql"

# Step 3: Create the views
sqlite3 baseball.db ".read ./2025/scripts/03_create_views.ddl"

=============================================================

# Verify tables were created:
sqlite3 baseball.db ".tables"

# Check schema of a specific table:
sqlite3 baseball.db ".schema batting"

# Open an interactive session:
sqlite3 baseball.db