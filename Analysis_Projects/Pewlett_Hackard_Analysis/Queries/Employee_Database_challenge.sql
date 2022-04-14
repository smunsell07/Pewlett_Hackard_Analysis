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


