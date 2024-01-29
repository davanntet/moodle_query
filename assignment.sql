use mdl;
select _user.id as user_id,_course.id as course_id,_course.fullname as course, count(distinct _assign.id) as total_assignment_course, count(distinct _assign_submission.assignment) as assignment_submission,avg(_assign_grade.grade) as avg_grad
from mdl_user as _user
inner join mdl_role_assignments as _user_role on _user_role.userid = _user.id and _user_role.roleid=5
left join mdl_user_enrolments as _uenrol on _user.id = _uenrol.userid
left join mdl_enrol as _enrol on _uenrol.enrolid = _enrol.id
left join mdl_course as _course on _enrol.courseid= _course.id
left join mdl_assign as _assign on _assign.course = _course.id
left join mdl_assign_submission as _assign_submission on _assign_submission.assignment = _assign.id and _assign_submission.userid=_user.id
left join mdl_assign_grades as _assign_grade on _assign.id = _assign_grade.assignment and _assign_grade.userid = _user.id
group by _user.id,_course.id;