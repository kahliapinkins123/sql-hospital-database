<div id="top"></div>

<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h3 align="center">Hospital Database</h3>

  <p align="center">
    An SQL database that contains data on patients, nurses, hospital departments, diseases, medication, and billing. This code also contains SQL queries extracting specific and relevant data from our database.
    <br />
    <br />
    <a href="https://medium.com/@kpinkin1/a-comprehensive-guide-to-sql-for-beginners-creating-a-database-fc6f7205235e"><strong>SQL Blog Post »</strong></a>
    <br />
    
    
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#exploring">Exploring the Data</a></li>
    <li><a href="#contact">Contact Me</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
<div id="about-the-project"></div>

## About The Project


This is a Hospital Database built with SQL. It contains several tables with data related to hospital departments, nurses, patients, etc. Many of the tables relate to one another, creating a complex SQL schema. After creating the database, I explored the data using SQL queries that could provide interesting insights into hospital employee and patient trends. The SQL queries include simple to advanced SQL, ranging from Joins, Aggregates, Window Functions, and Subqueries. Listed below are the schema of all of the tables in the hospital database: 

<h3>Patient</h3>
<table>
  <tr>
    <th>Column Name</th>
    <th>Description</th> 
  </tr>
  <tr>
    <td>patient_id</td>
    <td>Uniquely identifies each patient (Primary Key)</td> 
  </tr>
  <tr>
    <td>first_name</td>
    <td>First name of patient</td> 
  </tr>
  <tr>
    <td>last_name</td>
    <td>Last name of patient</td> 
  </tr>
  <tr>
    <td>birthdate</td>
    <td>Patient date of birth</td> 
  </tr>
  <tr>
    <td>sex</td>
    <td>Patient sex</td> 
  </tr>
  <tr>
    <td>weight</td>
    <td>Patient weight</td> 
  </tr>
  <tr>
    <td>nurse_id</td>
    <td>Nurse caring for patient (Foreign Key)</td> 
  </tr>
  <tr>
    <td>department_id</td>
    <td>Department caring for patient (Foreign Key)</td> 
  </tr>
  <tr>
    <td>disease_id</td>
    <td>Patient's disease</td> 
  </tr>
</table>

<h3>Nurse</h3>
<table>
  <tr>
    <th>Column Name</th>
    <th>Description</th> 
  </tr>
  <tr>
    <td>nurse_id</td>
    <td>Uniquely identifies each nurse (Primary Key)</td> 
  </tr>
  <tr>
    <td>first_name</td>
    <td>First name of nurse</td> 
  </tr>
  <tr>
    <td>last_name</td>
    <td>Last name of nurse</td> 
  </tr>
  <tr>
    <td>salary</td>
    <td>Nurse salary</td> 
  </tr>
  <tr>
    <td>department_id</td>
    <td>Nurse's department (Foreign Key)</td> 
  </tr>
  <tr>
  <tr>
    <td>birthdate</td>
    <td>Nurse date of birth</td> 
  </tr>
  <tr>
    <td>sex</td>
    <td>Nurse sex</td> 
  </tr>
</table>
<h3>Department</h3>
<table>
  <tr>
    <th>Column Name</th>
    <th>Description</th> 
  </tr>
  <tr>
    <td>department_id</td>
    <td>Uniquely identifies each hospital department (Primary Key)</td> 
  </tr>
  <tr>
    <td>department_name</td>
    <td>Name of department</td> 
  </tr>
  <tr>
    <td>head_id</td>
    <td>Head Nurse of department (Foreign Key)</td> 
  </tr>
</table>

<h3>Disease</h3>
<table>
  <tr>
    <th>Column Name</th>
    <th>Description</th> 
  </tr>
  <tr>
    <td>disease_id</td>
    <td>Uniquely identifies each disease (Primary Key)</td> 
  </tr>
  <tr>
    <td>disease_name</td>
    <td>Name of disease</td> 
  </tr>
</table>

<h3>Bill</h3>
<table>
  <tr>
    <th>Column Name</th>
    <th>Description</th> 
  </tr>
  <tr>
    <td>disease_id</td>
    <td>Uniquely identifies disease for this bill (First Primary Key/ Foreign Key)</td> 
  </tr>
  <tr>
    <td>department_id</td>
    <td>Uniquely identifies department for this bill (Second Primary Key/ Foreign Key)</td> 
  </tr>
   <tr>
    <td>total_bill</td>
    <td>Bill amount</td> 
  </tr>
</table>

<h3>Medication</h3>
<table>
  <tr>
    <th>Column Name</th>
    <th>Description</th> 
  </tr>
  <tr>
    <td>disease_id</td>
    <td>Uniquely identifies disease for this medication (First Primary Key/ Foreign Key)</td> 
  </tr>
  <tr>
    <td>medication_name</td>
    <td>Uniquely identifies medication name (Second Primary Key)</td> 
  </tr>
   <tr>
    <td>dosage_mg</td>
    <td>Daily medication dosage</td> 
  </tr>
</table>
<div id="about-the-project"></div>

<p align="right">(<a href="#top">back to top</a>)</p>

<div id="built-with"></div>

### Built With

* MySQL
* PopSQL


<p align="right">(<a href="#top">back to top</a>)</p>

<!-- QUERY EXAMPLES -->
<div id="exploring"></div>

## Exploring the Data

After creating the database, I wanted to explore the data further to identify trends and extract important information. I did this using SQL queries. Some of the questions that are explored in this project are listed below : 
    <ol>
        <li>Which patients have cancer?</li>
        <li>How many patients are being treated for COVID-19?</li>
        <li>What is the average weight for patients who suffered a heart attack?</li>
        <li>What are the common diseases for patients over 60?</li>
        <li>What is the average salary of male nurses vs. the average salary of female nurse?</li>
        <li>What is the average age of patients in each department?</li>
        <li>Which patients under 18 have the flu?</li>
        <li>How many milligrams of Ciprofloxacin total will be admistered in a day?</li>
        <li>Which departments have the highest average bill?</li>
        <li>Which nurses are treating patients with pneumonia?</li>
        <li>Are there more females or males in Intensive Care?</li>
        <li>Which disease does the eldest patient in the hospital have?</li>
    </ol>
    
<p>Questions like these helped me to get a better understanding of the hospital data that I'm working with and allowed me to identify trends and patterns for further analysis or to influence future decisions in the hospital.</p>

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
<div id="contact"></div>

## Contact Me
<ul>
  <li><a href="https://www.linkedin.com/in/kahlia-pinkins-616599207/">LinkedIn</a></li>
  <li><a href="https://kahliapinkins123.wixsite.com/kahliapinkins">Portfolio Website</a></li>
  <li>Email: kpinkin1@gmail.com</li>
</ul>

<p align="right">(<a href="#top">back to top</a>)</p>

