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
	, ps.Tariff
From
	PatientStay ps
WHERE ps.Hospital IN('Kingston', 'PRUH')
	AND ps.ward LIKE '%Surgery'
	AND ps.AdmittedDate BETWEEN '2024-02-27'AND '2024-03-01'
ORDER BY ps.AdmittedDate ASC, ps.DischargeDate ASC

SELECT Top 5
	ps.Hospital
	, ps.ward
	, COUNT(*) AS PatientCount
	, SUM(ps.Tariff) As TotalTariff
	, AVG (ps.Tariff) AS AverageTariff

FROM
	PatientStay ps
GROUP BY ps.Hospital, ps.ward
ORDER BY Totaltariff DESC


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

SELECT
	PatientID,
	AdmittedDate,
	DischargeDate,
	Hospital,
	Ward,
	DATEDIFF(DAY, AdmittedDate, DischargeDate) + 1 AS LengthOfStay
FROM PatientStay
WHERE Hospital IN ('Oxleas', 'PRUH')
	AND AdmittedDate BETWEEN '2024-02-01' AND '2024-02-29'
	AND Ward LIKE '%Surgery'
ORDER BY AdmittedDate DESC, PatientID DESC;


/*
5. How many patients has each hospital admitted? 
6. How much is the total tariff for each hospital?
7. List only those hospitals that have admitted over 10 patients
8. Order by the hospital with most admissions first
*/

SELECT
	Hospital,
	COUNT(*) AS PatientCount,
	SUM(Tariff) AS TotalTariff
FROM PatientStay
GROUP BY Hospital
HAVING COUNT(*) > 10
ORDER BY PatientCount DESC;


