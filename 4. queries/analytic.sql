 -- year and month of reservations and number of reservations during this month (use reservation begin). 
 -- Sort according to number of reservations within each year
select jahr, monat, cnt,
       rank() over(partition by jahr order by cnt desc) as rang
  from (select extract(year from (interval).begints) as jahr,
               extract(month from (interval).begints) as Monat,
               count(*) as cnt
          from reservation
         group by extract(year from (interval).begints), extract(month from (interval).begints)) t
 order by jahr, rang;

with ResProMonat as
       (select extract(year from (interval).begints) as jahr,
               extract(month from (interval).begints) as Monat,
               count(*) as cnt
          from reservation
         group by extract(year from (interval).begints), extract(month from (interval).begints)) 
       
select jahr, monat, cnt,
       rank() over(partition by jahr order by cnt desc) as rang
  from ResProMonat
 order by jahr, rang;


-- calculate the 3-months moving average of reservation counts
select jahr, monat, cnt,
       avg(cnt) over(partition by jahr
                     order by monat
                     rows between 1 preceding and 1 following) as mvgavg
  from (select extract(year from (interval).begints) as jahr,
               extract(month from (interval).begints) as Monat,
               count(*) as cnt
          from reservation
         group by extract(year from (interval).begints),
                  extract(month from (interval).begints)) t
 order by jahr, monat;


-- calculate the cumulated sums of monthly reservation counts per year
select jahr, monat, cnt,
       sum(cnt) over(partition by jahr order by monat rows unbounded preceding ) as cumsum
  from (select extract(year from (interval).begints) as jahr,
               extract(month from (interval).begints) as Monat,
               count(*) as cnt
          from reservation
         group by extract(year from (interval).begints), extract(month from (interval).begints)) t
 order by jahr, monat;
 

-- assign the months of the year 2021 to tertiles (three quantiles) based on the number of reservations per month
select jahr, monat, cnt,
       ntile(3) over(partition by jahr order by cnt ) as tiles
  from (select extract(year from (interval).begints) as jahr,
               extract(month from (interval).begints) as Monat,
               count(*) as cnt
          from reservation
         group by extract(year from (interval).begints), extract(month from (interval).begints)) t
 where jahr = 2021;
