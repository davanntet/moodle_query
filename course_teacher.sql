use moodles;
select _user.id as user_id,_user.username as teacher_username,_user.firstname,_user.lastname,_course.id as course_id,_course.fullname as course,_course.startdate,_course.enddate
from mdl_user as _user
inner join mdl_role_assignments as _user_role on _user_role.userid = _user.id and _user_role.roleid=4
left join mdl_user_enrolments as _uenrol on _user.id = _uenrol.userid
left join mdl_enrol as _enrol on _uenrol.enrolid = _enrol.id
left join mdl_course as _course on _enrol.courseid= _course.id
group by _user.id,_course.id;