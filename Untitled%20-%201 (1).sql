#view called EMP_DEPT to display salary along with some basic sensitive data of employees from the HR database
    CREATE VIEW EMP_DEPT AS
    SELECT EMP_ID, F_NAME, L_NAME, DEP_ID
    FROM EMPLOYEES;
    
    #Modifying “EMP_DEPT” such that it displays Department names instead of Department IDs. For this, we need to combine information from EMPLOYEES and DEPARTMENTS
    CREATE OR REPLACE VIEW EMP_DEPT AS
    SELECT EMP_ID, F_NAME, L_NAME, DEP_NAME
    FROM EMPLOYEES, DEPARTMENTS
    WHERE EMPLOYEES.DEP_ID = DEPARTMENTS.DEPT_ID_DEP;

    #dropping the created View EMP_DEPT
    DROP VIEW EMP_DEPT
