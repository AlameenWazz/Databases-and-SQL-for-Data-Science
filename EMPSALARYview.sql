#view called EMPSALARY to display salary along with some basic sensitive data of employees from the HR database
    CREATE VIEW EMPSALARY AS
    SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, SALARY
    FROM EMPLOYEES;
    
    #Using SELECT, query the EMPSALARY view to retrieve all the records.
    SELECT * FROM EMPSALARY;
    
    #Updating view to display min//max salaries and job titles
    CREATE OR REPLACE VIEW EMPSALARY AS
    SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, JOB_TITLE,
    MIN_SALARY, MAX_SALARY
    FROM EMPLOYEES, JOBS
    WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;
    
    #Using SELECT, query the EMPSALARY view to retrieve all the records.
    SELECT * FROM EMPSALARY;
    
    #dropping the created View EMPSALARY.
    DROP VIEW EMPSALARY;
    
    #verifying whether the EMPSALARY view has been deleted or not. 
    Use the code below.
    SELECT * FROM EMPSALARY;
    
