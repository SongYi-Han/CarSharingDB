-- the sum (of hours) of vehicle uses per day
select (r.interval).begints :: date, sum(hours)
  from useofvehicle u join reservation r on u.reservation = r.id
 group by 1
 order by 1;


-- the vehicle with the highest odometer value
select licensePlate
  from Vehicle
 where kilometers = (select max(kilometers)
                       from Vehicle);


-- the number of limousines per location
select shortname, count(v.id)
  from limousine v right outer join location l on v.home = l.id
 group by shortname;


-- the location with the highest number of limousines
select shortname, count(v.id) as limocnt
  from limousine v right outer join location l on v.home = l.id
 group by shortname
having count(v.id) = (select max(limocnt) as maxlimo
                        from (select shortname, count(v.id) as limocnt
                                from limousine v right outer join location l on v.home = l.id
                               group by shortname) as lc);

  
with limos(shortName, limoCnt) as 
     (select shortname, count(v.id)
        from limousine v right outer join location l on v.home = l.id
       group by shortname)
 select shortName, limocnt
   from limos 
  where limoCnt = (select max(limocnt) from limos);