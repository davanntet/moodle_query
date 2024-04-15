select _course.id as course_id,_course.fullname as course,
count(distinct _course_modules.module) as num_content_type,
count(distinct _course_modules.id) as total_content
from  mdl_course as _course
left join mdl_course_modules as _course_modules on _course_modules.course=_course.id
group by _course.id;