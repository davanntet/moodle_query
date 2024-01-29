use mdl;
select _user.id as user_id,
sum(distinct _sessions.timemodified-_sessions.timecreated)/(60*60) as 'duration(hours)'
from mdl_user as _user
inner join mdl_role_assignments as _user_role on _user_role.userid = _user.id and _user_role.roleid=5
left join mdl_sessions as _sessions on _sessions.userid=_user.id
group by _user.id;