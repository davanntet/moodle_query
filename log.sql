use moodles;
select _user.id as user_id,_user.idnumber,_user.firstname,_user.lastname,_course.id as course_id,
_course.fullname as course,count(distinct _log.id) as total_log ,
count(distinct _log.id)/10 as 'avg_log_week'
from mdl_user as _user
inner join mdl_role_assignments as _user_role on _user_role.userid = _user.id and _user_role.roleid=5
left join mdl_user_enrolments as _uenrol on _user.id = _uenrol.userid
left join mdl_enrol as _enrol on _uenrol.enrolid = _enrol.id
left join mdl_course as _course on _enrol.courseid= _course.id
left join mdl_logstore_standard_log as _log on _log.idnumber=_user.idnumber and _log.courseid = _course.id
where _user.idnumber like 'idtb09%'
group by _user.id,_course.id;