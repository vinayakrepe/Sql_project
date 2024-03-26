SELECT * FROM social_meadia.socialmeadia_time;

-- Total no.of Users:
select count(*) as TotalUsers
from socialmeadia_time;

-- Avg Time Spent on Social Media by Gender:
select Gender, avg(time_spent) as AvgTimeSpent
from socialmeadia_time
group by Gender;

-- Average Time Spent on Social Media by grouping the age:

select
    case
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 24 THEN '18-24'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        WHEN Age BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END AS AgeGroup,
    avg(time_spent) as AvgTimeSpent
from socialmeadia_time
group by AgeGroup;

-- Avg Time Spent on all Platform:

select Platform, avg(time_spent) as AvgTimeSpent
from socialmeadia_time
group by Platform;

-- Avg Time Spent on Social Media by Location:

select Location, avg(time_spent) as AvgTimeSpent
from socialmeadia_time
group by Location;

-- Avg Time Spent on Social Media by Profession:

select Profession, avg(time_spent) as AvgTimeSpent
from socialmeadia_time
group by Profession;

-- Avg Time Spent on Social Media of Homeowners & who not have Home:

select IsHomeOwner,avg(time_spent) as AvgTimeSpent
from socialmeadia_time
group by IsHomeOwner;

-- Avg Time Spent on Social Media by Car Owners:

select Owns_Car,avg(time_spent) as AvgTimeSpent
from socialmeadia_time
group by Owns_Car;

-- most time spent on social media in ranking
    
select Platform, avg(time_spent) as AvgTimeSpent
from socialmeadia_time
group by Platform
order by AvgTimeSpent desc;

--total no.of users per platform
select count(*) as total_users,platform
from socialmeadia_time
group by platform;

-- total time spent on each platform through each location where time greater than 100
select Platform, location,sum(Time_Spent) as TotalTimeSpent
from socialmeadia_time
group by Platform ,location
having sum(Time_Spent) > 100;

-- details of users having age greater than 40
select * from socialmeadia_time
where age in (select age from socialmeadia_time where age > 40);


-- detais of users with max time and max income in each location and platforms
select age, location,platform,max(time_spent) as maxtime,max(income) as maxsalary
from socialmeadia_time
group by age,location,platform;


-- top 10 users by income grouped by location age and income
select Location, age, income,platform
from socialmeadia_time
group by Location, age,income,platform
order by income desc
limit 10; 

-- no.of users as per location and platform
select location, platform, count(*) from socialmeadia_time as no_of_users
group by location,platform;


select location, platform, count(*) from socialmeadia_time 
group by location,platform
having platform ='youtube'
order by count(*) asc;

