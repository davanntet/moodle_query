use mdl;
select _user.id as user_id,_course.id as course_id,_course.fullname as course, count(distinct _attendance_sessions.id) as session,
count(distinct CASE WHEN _attendance_statuses.acronym = 'P' THEN _attendance_log.id END) as Presence,
count(distinct CASE WHEN _attendance_statuses.acronym = 'L' THEN _attendance_log.id END) as Late,
count(distinct CASE WHEN _attendance_statuses.acronym = 'E' THEN _attendance_log.id END) as Excused,
count(distinct CASE WHEN _attendance_statuses.acronym = 'A' THEN _attendance_log.id END) as Absent
from mdl_user as _user
inner join mdl_role_assignments as _user_role on _user_role.userid = _user.id and _user_role.roleid=5
left join mdl_user_enrolments as _uenrol on _user.id = _uenrol.userid
left join mdl_enrol as _enrol on _uenrol.enrolid = _enrol.id
left join mdl_course as _course on _enrol.courseid= _course.id
left join mdl_attendance as _attendance on _attendance.course=_course.id
left join mdl_attendance_sessions as _attendance_sessions on _attendance_sessions.attendanceid=_attendance.id
left join mdl_attendance_log as _attendance_log on _attendance_log.sessionid = _attendance_sessions.id and _attendance_log.studentid=_user.id
left join mdl_attendance_statuses as _attendance_statuses on _attendance_statuses.attendanceid=_attendance.id and _attendance_statuses.id=_attendance_log.statusid
group by _user.id,_course.id,_attendance_statuses.attendanceid;