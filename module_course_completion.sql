select _user.idnumber as user_id,_user.firstname,_user.lastname,
       _course.id as course_id,_course.fullname as course,
       count(distinct _course_module.id) as total_task,
       count(distinct _course_module_completion.coursemoduleid) as completed,
       count(
               distinct _course_module_completion.coursemoduleid
       )*100/count(
               distinct _course_module.id
            ) as percentage
from mdl_user as _user
inner join mdl_role_assignments as _user_role on _user_role.userid = _user.id and _user_role.roleid=5
left join mdl_user_enrolments as _uenrol on _user.id = _uenrol.userid
left join mdl_enrol as _enrol on _uenrol.enrolid = _enrol.id
left join mdl_course as _course on _enrol.courseid= _course.id
left join mdl_course_modules as _course_module on _course.id=_course_module.course
left join mdl_course_modules_completion as _course_module_completion
    on _course_module_completion.coursemoduleid=_course_module.id
           and _course_module_completion.userid=_user.id
           and _course_module_completion.completionstate=1
where _user.idnumber like 'idtb09%' and _course.id in
(474, 497, 498, 499, 500, 501,502, 506, 507, 533, 534, 535, 536, 537, 538, 539, 540, 541)
group by _user.id,_user.idnumber,_course.id;