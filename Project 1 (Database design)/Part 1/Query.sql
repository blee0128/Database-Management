select snum, ssn from students where name = 'Becky';
select name, level from major where snum in (select snum from students where ssn = 123097834);
select distinct c.name from courses c, departments d where c.department_code = d.code and d.name = 'Computer Science';
select distinct g.name, g.level from degrees g, departments d where g.department_code = d.code and d.name = 'Computer Science';
select distinct s.name from students s, minor m where s.snum = m.snum;
select count(distinct snum) from minor;
select s.name, s.snum from students s, register r, courses c where s.snum = r.snum and r.course_number = c.number and c.name = 'Algorithm';
select s.name, s.snum from students s where s.dob in (select MIN(g.dob) from students g);
select s.name, s.snum from students s where s.dob in (select MAX(g.dob) from students g);
select name, snum, ssn from students s where s.name like "%n%" or s.name like "%N%";
select name, snum, ssn from students s where s.name not like "%n%" and name in (select name from students t where t.name not like "%N%");
select distinct c.number, c.name, count(distinct r.snum) from courses c, register r where c.number = r.course_number group by r.course_number;
select distinct s.name from students s, register r where s.snum = r.snum and r.regtime = "FALL2020";
select distinct c.number, c.name from courses c, departments d where c.department_code = d.code and d.name = "Computer Science";
select distinct c.number, c.name from courses c, departments d where c.department_code = d.code and (d.name = "Computer Science" or d.name = "Landscape Architect") ;