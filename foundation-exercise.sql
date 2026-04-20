/*
Foundation Recap Exercise

Use the table PatientStay.  
This lists 44 patients admitted to London hospitals over 5 days between Feb 26th and March 2nd 2024
*/

SELECT
	ps.PatientID
	, ps.AdmittedDate
	, ps.DischargeDate
	, DATEADD(WEEK, -2, PS.AdmittedDate) AS ReminderDate
	, DATEADD (MONTH, 3, PS.DischargeDate) AS AppointmentDate
	, DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
	, ps.hospital
	, ps.Ward
From
	PatientStay ps
WHERE ps.Hospital IN('Kingston', 'PRUH')
	AND ps.ward LIKE '%Surgery'
	AND ps.AdmittedDate BETWEEN '2024-02-27'AND '2024-03-01'
ORDER BY ps.AdmittedDate ASC, ps.DischargeDate ASC


/*
1. Filter the list the patients to show only those  -
a) in the Oxleas hospital,
b) and also in the PRUH hospital,
c) admitted in February 2024
d) only the surgical wards (i.e. wards ending with the word Surgery)


2. Show the PatientId, AdmittedDate, DischargeDate, Hospital and Ward columns only, not all the columns.
3. Order results by AdmittedDate (latest first) then PatientID column (high to low)
4. Add a new column LengthOfStay which calculates the number of days that the patient stayed in hospital, inclusive of both admitted and discharge date.
*/

-- Write the SQL statement here


/*
5. How many patients has each hospital admitted? 
6. How much is the total tariff for each hospital?
7. List only those hospitals that have admitted over 10 patients
8. Order by the hospital with most admissions first
*/

-- Write the SQL statement here
