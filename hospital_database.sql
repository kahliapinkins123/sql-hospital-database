CREATE TABLE patient (
  patient_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birthdate DATE,
  sex VARCHAR(1),
  weight INT,
  nurse_id INT,
  department_id INT,
  disease_id INT
);

CREATE TABLE nurse (
    nurse_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    salary INT,
    department_id INT,
    birthdate DATE,
    sex VARCHAR(1)
);

CREATE TABLE department (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(40),
  head_id INT,
  FOREIGN KEY(head_id) REFERENCES nurse(nurse_id) ON DELETE SET NULL
);

ALTER TABLE patient
ADD FOREIGN KEY(nurse_id)
REFERENCES nurse(nurse_id)
ON DELETE SET NULL;

ALTER TABLE patient
ADD FOREIGN KEY(department_id)
REFERENCES department(department_id)
ON DELETE SET NULL;

ALTER TABLE nurse
ADD FOREIGN KEY(department_id)
REFERENCES department(department_id)
ON DELETE SET NULL;

CREATE TABLE disease(
    disease_id INT PRIMARY KEY,
    disease_name VARCHAR(40)
);

ALTER TABLE patient
ADD FOREIGN KEY(disease_id)
REFERENCES disease(disease_id)
ON DELETE SET NULL;


CREATE TABLE  bill(
  disease_id INT,
  department_id INT,
  total_bill INT,
  PRIMARY KEY(disease_id, department_id),
  FOREIGN KEY(disease_id) REFERENCES disease(disease_id) ON DELETE CASCADE,
  FOREIGN KEY(department_id) REFERENCES department(department_id) ON DELETE CASCADE
);

CREATE TABLE medication(
  disease_id INT,
  medication_name VARCHAR(40),
  dosage INT,
  PRIMARY KEY(disease_id, medication_name),
  FOREIGN KEY(disease_id) REFERENCES disease(disease_id) ON DELETE CASCADE
);
 

------------------------------------------------------------------------------------

INSERT INTO nurse VALUES
    (1, "Shirley", "Hausman", 80000, NULL, '1998-07-01', 'F'),
    (2, "Debra", "Samuels", 76000, NULL, '2000-11-11', 'F'),
    (3, "Miley", "Thompson", 210000, NULL, '1970-04-18', 'F' ),
    (4, "George", "Brown", 250000, NULL, '1965-10-13', 'M'),
    (5, "Adam", "Black", 82000, NULL, '1999-12-15', 'M'),
    (6, "Ryan", "Yakotori", 150000, NULL, '1970-06-22', 'M'),
    (7, "Lisa", "Shcniderman", 95000, '1985-07-30', 'F'),
    (8, "Craig", "Ford", 90000, NULL, '1987-08-17', 'M'),
    (9, "Gary", "Peters", 200000, NULL, '1970-09-24', 'M'),
    (10, "Dylan", "Yelnats", 70000, NULL, '2000-08-27', 'F');

INSERT INTO department VALUES 
    (276, 'Intensive Care', 3),
    (444, 'Oncology', 4),
    (124, 'Pediatrics', 9);

INSERT INTO disease VALUES 
    (1001, 'Cold'),
    (1002, 'Pneunomia'),
    (1003, 'Lung Cancer'),
    (1004, 'Breast Cancer'),
    (1005, 'COVID 19'),
    (1006, 'Stroke'),
    (1007, 'Influenza'),
    (1008, 'Heart Attack');

INSERT INTO patient VALUES 
    (100, "Kelly", "Hampton", "1978-08-12", 'F', 170, 4, 444, 1004);

-- Oncology
INSERT INTO patient VALUES 
    (101, "Mark", "Logans", "1949-04-18", 'M', 198, 5, 444, 1003),
    (102, "Madison", "Daggerman", "1964-12-24", 'F', 156, 7, 444, 1003),
    (103, "Ron", "Gilson", "1950-05-22", 'M', 230, 4, 444, 1003),
    (104, "Liza", "Cheryl", "1961-07-04", 'F', 198, 10, 444, 1004);

-- Pediatrics
INSERT INTO patient VALUES 
    (105, "Alexa", "Samuels", "2010-08-10", 'F', 93, 2, 124, 1001),
    (106, "Allison", "Henderson", "2010-11-06", 'F', 95, 6, 124, 1007),
    (107, "David", "Rodriguez", "2012-02-22", 'M', 100, 9, 124, 1002),
    (108, "Lin", "Clark", "2008-05-14", 'M', 110, 2, 124, 1001),
    (109, "Melissa", "Santiago", "2012-12-30", 'F', 85, 6, 124, 1002),
    (110, "Victor", "Jackson", "2015-05-22", 'M', 70, 9, 124, 1007),
    (111, "Leslie", "Tuckers", "2016-10-04", 'F', 64, 2, 124, 1001);

-- Intensive Care
INSERT INTO patient VALUES 
    (112, "Craig", "Thomas", "2000-09-11", 'M', 190, 3, 276, 1005),
    (113, "Jason", "Linn", "1965-11-05", 'M', 215, 1, 276, 1007),
    (114, "Alex", "Flenderson", "1985-02-12", 'M', 200, 1, 276, 1002),
    (115, "Todd", "Jackson", "1950-06-18", 'M', 280, 8, 276, 1008),
    (116, "Dylan", "Santiage", "1942-10-31", 'M', 312, 8, 276, 1006),
    (117, "Mariah", "Jackson", "1955-01-25", 'F', 200, 3, 276, 1008),
    (118, "Ashley", "Brewer", "1986-03-04", 'F', 165, 3, 276, 1005),
    (119, "Morgan", "Chase", "1996-05-14", 'F', 170, 1, 276, 1002);

-- BILL
INSERT INTO bill VALUES
    (1004, 444, 10000),
    (1003, 444, 15000),
    (1001, 124, 50),
    (1007, 124, 70),
    (1002, 124, 100),
    (1005, 276, 1280),
    (1007, 276, 980),
    (1002, 276, 950),
    (1008, 276, 1500),
    (1006, 276, 1700);

-- MEDICATION
INSERT INTO medication VALUES
    (1001, 'Ibuprofen', 1200),
    (1002, 'Ciprofloxacin', 1500),
    (1003, 'Etoposide', 50),
    (1004, 'Soltamox', 20),
    (1005, 'Paxlovid', 300),
    (1006, 'Alteplase', 95),
    (1007, 'Zanamivir', 10),
    (1008, 'Lisinopril', 30);



--------------------------VIEWS--------------------------------------------------

-- Create view with patient's age
CREATE VIEW patient_age AS (
    SELECT 
        patient.*,
        DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), patient.birthdate)), '%Y') + 0 AS age
    FROM patient
);

-- Create view with patients, diseases, and departments by name
CREATE VIEW patient_info AS (
WITH patient_bill AS (
    SELECT 
        patient.patient_id, 
        patient.first_name, 
        patient.last_name, 
        patient.department_id,
        patient.disease_id,
        bill.total_bill
    FROM patient
    JOIN bill
    ON 
        patient.disease_id = bill.disease_id AND 
        patient.department_id = bill.department_id)
SELECT 
    patient_bill.patient_id,
    patient_bill.first_name, 
    patient_bill.last_name,
    department.department_name,
    disease.disease_name,
    patient_bill.total_bill AS bill,
    department.department_id,
    disease.disease_id
FROM patient_bill
JOIN department
ON patient_bill.department_id = department.department_id
JOIN disease
ON patient_bill.disease_id = disease.disease_id
);

--------------------------QUERIES------------------------------------------------

-- Which nurses have the top 5 salaries
SELECT first_name, last_name, salary
FROM nurse
ORDER BY salary DESC
LIMIT 5;

-- Which patients have cancer
SELECT
    patient_id, first_name, last_name, disease_name
FROM patient_info
WHERE LOWER(disease_name) LIKE '%cancer';

-- How many patients have each disease
SELECT disease_name, COUNT(patient_id) AS num_of_patients
FROM patient_info
GROUP BY disease_id 
ORDER BY COUNT(patient_id) DESC;

-- What is the average patient weight for each disease
SELECT disease.disease_name, AVG(patient.weight) AS avg_patient_weight
FROM patient
JOIN disease
ON patient.disease_id = disease.disease_id
GROUP BY patient.disease_id;

-- List all diseases of patients over 60
SELECT DISTINCT disease.disease_name
FROM patient_age
JOIN disease
ON patient_age.disease_id = disease.disease_id
WHERE age > 60;

-- Find the amont of money each department makes
SELECT department_id, department_name, SUM(bill) AS total
FROM patient_info
GROUP BY department_id;

-- Who is the highest paid of the 3 youngest nurses?
SELECT young_nurses.* 
FROM(
    SELECT *
    FROM nurse
    ORDER BY nurse.birthdate DESC
    LIMIT 3
) AS young_nurses
ORDER BY young_nurses.salary DESC
LIMIT 1;

-- Find the average salary of the male and female nurses
SELECT sex, AVG(salary) AS avg_salary 
FROM nurse
GROUP BY sex
ORDER BY AVG(salary) DESC;

-- Find the maximum nurse salary in each department
WITH max_salary_by_dept AS (
    SELECT department_id, MAX(salary) AS max_salary
    FROM nurse
    GROUP BY department_id
) 
SELECT department.department_name, max_salary_by_dept.max_salary
FROM department
JOIN max_salary_by_dept
ON department.department_id = max_salary_by_dept.department_id;


-- List all patients under 18 with the flu.
SELECT *
FROM patient_age
JOIN disease
ON patient_age.disease_id = disease.disease_id
WHERE age < 18 AND disease_name = 'Influenza';


-- Find the dept w the most people born before 1995
SELECT department_name
FROM department
WHERE department_id = (
    SELECT department_id
    FROM nurse
    WHERE birthdate < '1995-01-01'
    GROUP BY department_id
    ORDER BY COUNT(nurse_id)
    LIMIT 1
);


-- Find the top 3 female and male nurses by salary 
WITH nurses_ranked AS (
    SELECT first_name, last_name, salary,sex,
        RANK() OVER(PARTITION BY sex ORDER BY salary DESC) AS 'rank'
    FROM nurse
)
SELECT *
FROM nurses_ranked
WHERE nurses_ranked.rank <= 3;

-- What is the minimum salary in each department
SELECT department.department_name, MIN(nurse.salary) AS min_salary
FROM nurse
JOIN department
ON nurse.department_id = department.department_id
GROUP BY nurse.department_id;

-- Find the names of the nurses with the lowest salary in each dept
WITH min_salary_by_dept AS (
    SELECT *, LAST_VALUE(salary) OVER(
        PARTITION BY department_id ORDER BY salary DESC
        RANGE BETWEEN 
        UNBOUNDED PRECEDING 
        AND 
        UNBOUNDED FOLLOWING
        ) AS min_salary
    FROM nurse
)
SELECT 
    department.department_name,
    CONCAT(min_salary_by_dept.first_name, ' ', min_salary_by_dept.last_name) AS nurse_name,
    min_salary_by_dept.salary
FROM min_salary_by_dept
JOIN department
ON min_salary_by_dept.department_id = department.department_id
WHERE salary = min_salary;


-- Find all nurses and their supervisors (head of their department)
WITH nurse_head AS (
    SELECT nurse_id, first_name, last_name, nurse.department_id, department.head_id
    FROM nurse
    JOIN department
    ON nurse.department_id = department.department_id
)
SELECT 
    CONCAT(nurse.first_name, ' ', nurse.last_name) AS nurse,
    CASE
        WHEN nurse.nurse_id = nurse.head_id THEN NULL
        ELSE CONCAT(head.first_name, ' ', head.last_name) 
    END AS supervisor
FROM nurse_head AS nurse
LEFT JOIN nurse_head AS head
ON nurse.head_id = head.nurse_id;


-- Find the average age of the patients in each dept 
SELECT department.department_name, avg_age_by_dept.avg_patient_age
FROM (
    SELECT patient_age.department_id, FLOOR(AVG(patient_age.age)) AS avg_patient_age
    FROM patient_age
    GROUP BY department_id
) AS avg_age_by_dept
JOIN department
ON avg_age_by_dept.department_id = department.department_id;


-- Find total number of milligrams of each medication when all patients combined
WITH disease_numbers AS (
    SELECT
        patient_info.disease_id,
        patient_info.disease_name, 
        COUNT(patient_info.patient_id) AS num_of_patients
    FROM patient_info
    GROUP BY patient_info.disease_id 
    ORDER BY COUNT(patient_info.patient_id) DESC
)
SELECT 
    disease_numbers.disease_name,
    medication.medication_name,
    num_of_patients*dosage_mg AS total_mg
FROM disease_numbers
JOIN medication
ON disease_numbers.disease_id = medication.disease_id;


-- List all patients under nurse Brown with over 10,000 in bills
SELECT 
    patient.patient_id,
    patient.first_name,
    patient.last_name,
    bill.total_bill
FROM patient
JOIN bill
ON patient.disease_id = bill.disease_id AND
    patient.department_id AND bill.department_id
WHERE nurse_id = ( 
    SELECT nurse_id
    FROM nurse
    WHERE last_name = 'Brown'
)
HAVING total_bill > 10000;


-- List all male patients in Intensive Care and their diseases
SELECT 
    patient.first_name,
    patient.last_name,
    disease.disease_name
FROM patient
JOIN department
ON patient.department_id = department.department_id
JOIN disease
ON patient.disease_id = disease.disease_id
WHERE patient.sex='M' AND department.department_name = 'Intensive Care';


-- List all patients under nurse Miley Thompson with COVID 19
SELECT *
FROM patient
WHERE 
    patient.nurse_id = (
        SELECT nurse.nurse_id
        FROM nurse
        WHERE nurse.first_name = 'Miley' AND nurse.last_name = 'Thompson'
    ) AND patient.disease_id = (
        SELECT disease_id
        FROM disease
        WHERE disease_name = 'COVID 19'
    );


-- Find the patients w the highest bill in each dept
WITH highest_bill AS (
    SELECT *,
    FIRST_VALUE(bill) OVER(PARTITION BY department_id ORDER BY bill DESC) AS highest_bill
    FROM patient_info
)
SELECT first_name, last_name, department_name, bill AS highest_bill
FROM highest_bill
WHERE bill = highest_bill;


-- Indicate which patients' bills are above and below their dept average
WITH dept_avg AS (
    SELECT department_id, AVG(bill) AS avg_bill
    FROM patient_info
    GROUP BY department_id
)
SELECT 
    first_name,
    last_name,
    disease_name,
    bill,
    CASE
        WHEN bill > avg_bill THEN 'high'
        WHEN bill < avg_bill THEN 'low'
        ELSE 'avg'
    END AS bill_type
FROM patient_info
JOIN dept_avg
ON patient_info.department_id = dept_avg.department_id;


-- Find the name of patients in the dept that are in the dept George Brown runs
SELECT
    first_name,
    last_name
FROM patient
WHERE department_id = (
    SELECT department_id
    FROM department
    WHERE head_id = (
        SELECT nurse_id
        FROM nurse
        WHERE first_name = 'Gary' AND last_name = 'Peters'
    )
);


-- Find the names of the nurses who have patients with pneumonia
SELECT nurse_id, first_name, last_name
FROM nurse
WHERE nurse_id IN (
    SELECT patient.nurse_id
    FROM patient
    WHERE patient.disease_id = (
        SELECT disease.disease_id
        FROM disease
        WHERE LOWER(disease.disease_name) = 'pneunomia'
    )
);