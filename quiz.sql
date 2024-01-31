use mdl;
select _user.id as user_id,_user.firstname,_user.lastname,_course.id as course_id,_course.fullname as course, count(distinct _quiz.id) as total_quiz_course, count(distinct _quiz_attempts.quiz) as quiz_attemts,avg(_quiz_grade.grade) as avg_grad
from mdl_user as _user
inner join mdl_role_assignments as _user_role on _user_role.userid = _user.id and _user_role.roleid=5
left join mdl_user_enrolments as _uenrol on _user.id = _uenrol.userid
left join mdl_enrol as _enrol on _uenrol.enrolid = _enrol.id
left join mdl_course as _course on _enrol.courseid= _course.id
left join mdl_quiz as _quiz on _quiz.course = _course.id
left join mdl_quiz_attempts as _quiz_attempts on _quiz_attempts.quiz = _quiz.id and _quiz_attempts.userid=_user.id
left join mdl_quiz_grades as _quiz_grade on _quiz.id = _quiz_grade.quiz and _quiz_grade.userid = _user.id
group by _user.id,_course.id;