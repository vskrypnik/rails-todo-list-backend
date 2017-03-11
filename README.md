#SQL queries

1) get all statuses, not repeating, alphabetically ordered

> SELECT status FROM tasks GROUP BY status ORDER BY status ASC

2) get the count of all tasks in each project, order by tasks count descending

> SELECT COUNT(tasks.name) AS count, projects.name AS name FROM tasks JOIN projects ON

> projects.id = tasks.project_id GROUP BY tasks.project_id ORDER BY count DESC

3) get the count of all tasks in each project, order by projects names

> SELECT COUNT(tasks.name) AS count, projects.name AS name FROM tasks JOIN projects ON

> projects.id = tasks.project_id GROUP BY tasks.project_id ORDER BY name ASC

4) get the tasks for all projects having the name beginning with “N” letter

> SELECT * FROM tasks WHERE name LIKE 'N%'

5) get the list of all projects containing the ‘a’ letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id=NULL.

> SELECT projects.name AS name, COUNT(tasks.name) AS count FROM tasks JOIN projects ON

> projects.name LIKE '%a%' AND projects.id = tasks.project_id GROUP BY projects.name

6) get the list of tasks with duplicate names ordered alphabetically

> SELECT name, COUNT(name) FROM tasks GROUP BY name HAVING COUNT(name) > 1 ORDER BY name ASC

7) get the list of project names having more than 10 tasks in status ‘completed’ ordered by project_id

> SELECT projects.name, COUNT(tasks.status), COUNT(CASE WHEN tasks.status = 1 THEN 'V'

> ELSE NULL END) AS count_of_completed FROM projects JOIN tasks ON projects.id = tasks.project_id

> GROUP BY projects.name HAVING count_of_completed >= 10 ORDER BY projects.id
