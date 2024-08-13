-- https://www.interviewquery.com/questions/exam-scores

SELECT student_name,
max(case when exam_id = 1 then score end) as exam_1,
max(case when exam_id = 2 then score end) as exam_2,
max(case when exam_id = 3 then score end) as exam_3,
max(case when exam_id = 4 then score end) as exam_4
FROM exam_scores
group by student_name