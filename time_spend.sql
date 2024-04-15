SELECT idnumber, courseid, SUM(time_spent) AS total_time_spent
FROM (
    SELECT idnumber, courseid,
           CASE
               WHEN @prev_userid = idnumber AND @prev_courseid = courseid THEN
                   CASE
                       WHEN (timecreated - @prev_timecreated) < 3600 THEN
                           (timecreated - @prev_timecreated)
                       ELSE
                           0
                   END
               ELSE
                   0
           END AS time_spent,
           @prev_userid := idnumber,
           @prev_courseid := courseid,
           @prev_timecreated := timecreated
    FROM mdl_logstore_standard_log
    CROSS JOIN (SELECT @prev_userid := NULL, @prev_courseid := NULL, @prev_timecreated := NULL) AS vars
    ORDER BY idnumber, courseid, timecreated
) AS time_spent_subquery
GROUP BY idnumber, courseid;