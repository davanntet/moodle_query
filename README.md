# moodle_query
### Note: `inner join mdl_role_assignments as _user_role on _user_role.userid = _user.id and _user_role.roleid=5`
- must be careful with the roleid, it is not always 5 for students
- in this case, it is 5 for student, 4 for teacher
- we can check the roleid in the `mdl_role` table
