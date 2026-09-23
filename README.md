# Step 1: Create the database and tables
```shell
sqlite3 baseball.db ".read ./2025/scripts/01_create_schema.ddl"
```

# Step 2: Load all CSV data
```shell
sqlite3 baseball.db ".read ./2025/scripts/02_load_data.sql"
```

# Step 3: Create the views
```shell
sqlite3 baseball.db ".read ./2025/scripts/03_create_views.ddl"
```

------

# Verify tables were created:
```shell
sqlite3 baseball.db ".tables"
```

# Check schema of a specific table:
```shell
sqlite3 baseball.db ".schema batting"
```

# Open an interactive session:
```shell
sqlite3 baseball.db
```

