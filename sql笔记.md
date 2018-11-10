# sql基础笔记 #
更新时间：2018/7/20 16:26:34  

----------


## 关键字 ##



> **distinct**：去除重复行

    select distinct department_id  from employees; 
> 




| 比较操作符     |意义         
| ------------- |:
|<>|不等于
|between...and..|在2个值之间（>= 和 <=）
|in(set)|在一个集合内
|like|匹配字符串 通配符 '%，_'
|is null| 判断是否为空，不是空： is not null

**例子：**


**in:**

    select employee_id, last_name, salary, manager_id   
    from employees   
    where manager_id in (100, 101, 201); 

**通配符：**

    select last_name    
    from employees    
    where last_name like '_o%'; 

> 
> **ESCAPE** 转义符


搜索带有%的列：

    select * from t_char where a like '%\%%' escape '\';
    或者：  
    select * from t_char where a like'%K%%' escape 'K'; 
    （两个效果是相同的）

|逻辑操作符|意义|
|--|--|
|AND | 所有条件都满足，返回TRUE 
|OR |只要有一个条件满足，返回TRUE 
|NOT |如果条件是FALSE,返回TRUE 





----------
##  单行函数 ##

> 字符函数：（数据库中的**数据**对大小写是敏感的）
> 
|函数 |结果 | 备注|
|--|--|--|
|lower('SQL Course') |sql course | 全部转换为小写
|upper('SQL Course') |SQL COURSE | 全部转换成大写
|initcap('SQL course') |Sql Course | 让首字母都大写
|**length**(c1) | 返回数值|返回字符串的长度
|**substr**('13088888888',3,8)|08888888 |截取子字符串
|TRIM(c1 from c2)|返回字符串 |删除左边和右边出现的字符串
| lpad('gao',10,'*')|*******gao |在字符串c1的**左边**用字符串c2填充，直到长度为n时为止
|rpad('gao',10,'a')|gaoaaaaaaa|在字符串c1的**右边**用字符串c2填充，直到长度为n时为止
|**INSTR**('HelloWorld', 'W')|6|返回字符所在位置


    select TRIM('X' from 'XXXgao qian jingXXXX'),   
    TRIM('X' from 'XXXgaoXXjingXXXX') text  
    from dual;  
    返回：gao qian jing		gaoXXjing



----------

----------


## 数字函数 ##

![](https://i.imgur.com/hlZRMSy.png)


    select round(45.923,2), round(45.923,0),  round(45.923,-1)  from dual;    
    
    select trunc(45.923,2), trunc(45.923), trunc(45.923,-2)  from dual;   
    
    select last_name, salary, mod(salary, 5000) from employees  where job_id = 'sa_rep';


结果：

![](https://i.imgur.com/zgXeK77.png) 



## 日期操作函数 ##

|函数|结果|说明|
|--|--|
|months_between ('01-SEP-95','11-JAN-94')|19.6774194 |返回2个日期之间相差的月数
|add_months ('11-JAN-94',6|11-Jul-94 |返回指定月数后的日期
|extract(c1 from d1)|字符类型|提取时间日期中的数据


    1992年之后出生的学生名单找出年龄最大和最小的同学，显示（学号、姓名、年龄）
    select student_no, student_name, student_age
      from hand_student hs
     where student_age in(
       (select max(student_age)
      from hand_student
     where student_age < to_number(extract(year from sysdate)) - 1992),(select min(student_age)
      from hand_student
     where student_age < to_number(extract(year from sysdate)) - 1992));


----------

## 转换函数 ##


![](https://i.imgur.com/61bbN2Q.png)


|函数|说明|
|--|--|
|to_char()|将日期或数据转换为char数据类型|
|to_number()|将字符串X转化为数字型|
|to_date()|将**字符串**X转化为日期型|


    SELECT last_name,TO_CHAR (hire_date, 'fmDD-MON-YYYY','nls_date_language=american') hire_date
    FROM employees
    WHERE EXTRACT (DAY FROM hire_date) < 16



    七、查询各门课程的平均分（保留2位小数，小数位四舍五入，两位小数需显示出来，比如88，需显示成88.00）。
    显示（课程编号，课程名称，平均分）。6分   
      
    SELECT hsc.course_no
      ,hc.course_name
      ,to_char(round(AVG(hsc.core), 2), '999.99') avg_core
      FROM hand_student_core hsc
      ,hand_course   hc
     WHERE hc.course_no = hsc.course_no
     GROUP BY hsc.course_no
     ,hc.course_name;
    

----------


**NVL函数**

![](https://i.imgur.com/nOY01Bk.png)



    SELECT last_name, salary, NVL(commission_pct, 0), 
    
    (salary*12) + (salary*12*NVL(commission_pct, 0)) AN_SAL FROM employees;




----------


> 条件表达式： 实现方法： CASE 语句 或者DECODE函数，
> 
> 两者均可实现 IF-THEN-ELSE 的逻辑，相比较 而言，DECODE 更加简洁。 



**CASE 语句：**

    SELECT last_name, job_id, salary,  
    CASE job_id  WHEN 'IT_PROG' THEN 1.10*salary   
    WHEN 'ST_CLERK' THEN 1.15*salary WHEN 'SA_REP' THEN 1.20*salary   
    ELSE salary  END "REVISED_SALARY" 
    FROM employees; 


**DECODE函数：**

    SELECT last_name, job_id, salary,    
    DECODE(job_id, 'IT_PROG', 1.10*salary,       
    'ST_CLERK', 1.15*salary,        
    'SA_REP', 1.20*salary,      
     salary)  REVISED_SALARY     
    FROM employees; 



**COUNT 函数说明 :**


![](https://i.imgur.com/54rkRi1.png)


    查询姓氏数量最多的学生名单，显示（学号、姓名、人数）
    select hs.student_no, hs.student_name, ht.cnt
      from (select substr(hs.student_name, 1, 1) surname,
       count(1) cnt,
       dense_rank() over(order by count(1) desc) ranks
      from hand_student hs
     group by substr(hs.student_name, 1, 1)) ht,
       hand_student hs
     where substr(hs.student_name, 1, 1) = ht.surname
       and ht.ranks = 1;

----------


## 集合操作 ##

----------

**UNION： 去除重复记录**

    结果中的总记录数可能 <  employees的记录数+job_history的记录数 
    SELECT employee_id, job_id    
    FROM   employees     
    UNION 
    SELECT employee_id, job_id FROM   job_history; 
    

**UNION  ALL：  保留重复记录**


    结果中的总记录数一定 =  employees的记录数+job_history的记录数 

    SELECT employee_id, job_id, department_id     
    FROM   employees    
    UNION ALL   
    SELECT employee_id, job_id, department_id     
    FROM   job_history     
    ORDER BY  employee_id; 
 

**INTERSECT： 取交集**

    SELECT employee_id, job_id 
    FROM   employees 
    INTERSECT 
    SELECT employee_id, job_id 
    FROM   job_history; 

**MINUS：  取差集**

    SELECT employee_id,job_id 
    FROM   employees 
    MINUS 
    SELECT employee_id,job_id 
    FROM   job_history; 


----------


## 增强 ##


----------

**group by 增强**

> 1、在Group By 中使用Rollup 产生常规分组汇总行 以及分组小计： 
> 
> rollup 后面跟n个条件，则进行n+1次分组，字段从右到左进行分组，然后进行unio 连接

    SELECT   department_id, job_id, SUM(salary) 
    FROM employees   
    WHEREdepartment_id < 60 
    GROUP BY ROLLUP(department_id, job_id); 
![](https://i.imgur.com/YmCOQeq.png)



> 2、在Group By 中使用Cube  产生Rollup结果集 + 多维度的交叉表数据源
> 在cube后面有n个字段就按照n个维度来分组，2的n次方分组，然后进行union


    SELECT   department_id, job_id, SUM(salary) 
    FROM employees   
    WHEREdepartment_id < 60 
    GROUP BY CUBE (department_id, job_id) ; 

![](https://i.imgur.com/Hy9kXqN.png)

----------


**增强子查询**

> 1、将查询的结果看作一张表
> 
> 2、使用 in，或者 exists 

----------



**with...as...**

    WITH  dept_costs  AS (
    SELECT  d.department_name, SUM(e.salary) AS dept_total
    FROMemployees e, departments d
    WHERE   e.department_id = d.department_id   
    GROUP BY d.department_name), avg_costAS (
    SELECT SUM(dept_total)/COUNT(*) AS dept_avg   
    FROM   dept_costs) SELECT *  FROM   dept_costs  
    WHERE  dept_total >(
    SELECT dept_avg   
    FROM avg_cost) 
    ORDER BY department_name; 
  



**递归查询**  


    举例：查询从King开始，从上往下的各级员工。
    
    SELECT  last_name||' reports to '|| 
    PRIOR   last_name "Walk Top Down" 
    FROMemployees 
    START   WITH last_name = 'King' 
    CONNECT BY PRIOR employee_id = manager_id ; 


    举例：查询从101开始，从下往上的各级员工。 
    
    SELECT employee_id, last_name, job_id, manager_id 
    FROM   employees 
    START  WITH  employee_id = 101 
    CONNECT BY PRIOR manager_id = employee_id ; 

**使用LEVEL关键字和 LPAD函数 ，在OUTPUT中显示树形层次**。 

    SELECT LPAD(last_name, LENGTH(last_name)+(LEVEL*2)-2,'_') 
    AS org_chart 
    FROM   employees  
    START WITH last_name='King'  
    CONNECT BY PRIOR employee_id=manager_id 



----------

## 分析函数 ##

----------


查询当前员工所在部门的平均工资、最高工资和最低工资，即可通过分析函数来实现。

    SELECT e.last_name, 
       e.salary, 
       d.department_name, 
       AVG(e.salary) over(PARTITION BY d.department_name) department_avg_salary, 
       MAX(e.salary) over(PARTITION BY d.department_name) department_max_salary, 
       MIN(e.salary) over(PARTITION BY d.department_name) department_min_salary 
      FROM employees e, departments d 
     WHERE 1 = 1AND e.department_id = d.department_id;  


将一个部门内的员工的工资从高到低进行排序，注意三种排序结果是不一样的。


    SELECT d.department_name, 
       e.last_name, 
       e.salary, 
       rank() over(PARTITION BY d.department_name ORDER BY e.salary DESC) dept_salary_rank1, 
       dense_rank() over(PARTITION BY d.department_name ORDER BY e.salary DESC) dept_salary_rank2, 
       row_number() over(PARTITION BY d.department_name ORDER BY e.salary DESC) dept_salary_rank3 
      FROM employees e, departments d 
     WHERE 1 = 1 
       AND e.department_id = d.department_id; 





## sql冒泡 ##

编写查询以显示EMPLOYEES表中的前三个收入者。 显示他们的姓氏和工资。

    SELECT last_name, salary
    FROM   employees e
    WHERE  3  >  (SELECT COUNT(*)
    	  FROM   employees
    	  WHERE  e.salary < salary);
