The SQL scripts in this folder depend on Python scripts for their execution.
The Python scripts are also contained in this folder, but are referenced with
aboslute paths in the SQL scripts since they must be accessed by Python
during the execution of the SQL query by hive.
Please make sure to change the add file statement paths to the full paths to
the script files when transfered on your instance.

Each sql script in this folder should be launched with the following command:
hive -f script_file_name.sql
