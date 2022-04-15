--Deliverable 1

SELECT e.emp_no,e.first_name,e.last_name,
    tl.title,tl.from_date,tl.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * from retirement_titles

--second part Deliverable 1
SELECT DISTINCT ON (rt.emp_no)rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date=('9999-01-01')
ORDER BY rt.emp_no ASC, rt.to_date DESC;

SELECT * from unique_titles

--third part of Deliverable 1
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT(ut.emp_no) DESC;

--Deliverable 2
SELECT DISTINCT ON (e.emp_no)e.emp_no,
	e.first_name, e.last_name, e.birth_date,
	de.from_date, de.to_date, tl.title
INTO mentorship_eligibilty
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (de.to_date='9999-01-01') AND 
	(tl.to_date='9999-01-01') AND
	(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- Deliverable 3: Write 2 additional queries
-- Create mentee counts per titles
SELECT COUNT(me.title), me.title
INTO mentee_counts
FROM mentorship_eligibilty AS me
GROUP BY me.title
ORDER BY COUNT(me.title) DESC;

-- Expanding the mentor criteria 
-- filtering on being about 35 years old when starting job with current job title
SELECT DISTINCT ON (e.emp_no)e.emp_no, 
	e.first_name,
	e.last_name,
	tl.title,
	tl.from_date,
	tl.to_date
INTO add_mentors
FROM employees as e
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND tl.to_date=('9999-01-01')
AND (tl.from_date BETWEEN '1985-01-01' AND '1985-12-31')
ORDER by e.emp_no ASC, tl.from_date DESC;

SELECT COUNT (am.title),am.title
INTO add_mentor_count
FROM add_mentors AS am
GROUP BY am.title
ORDER BY COUNT(am.title) DESC;

SELECT * from add_mentor_count


