-- The number of reservations grouped over the dimensions member, vehicle, and location
select membernr, v.licenseplate, l.name, count(*) 
  from reservation r join 
       vehicle v on r.vehicle = v.id join 
       member m on r.member = m.id join 
       location l on v.home = l.id 
 group by grouping sets (membernr, v.licenseplate, l.name, ()) 
 Order by 1,2,3;

-- The number of reservations grouped over all possible combinations of the dimensions member (member number) and vehicle type.
select membernr, v.type, count(*)
  from reservation r join 
       vehicle v on r.vehicle = v.id join 
       member m on r.member = m.id 
 group by cube (membernr, v.type) 
 Order by 1,2;

-- The number of reservations hierarchically grouped over year, month, and day of the reservation begin
select extract(year from (r.interval).begints) as year,
       to_char((r.interval).begints, 'YYYY-MM') as month,
       date_trunc('day', (r.interval).begints)::date as day,
       count(resnumber)
  from reservation r
 group by rollup(extract(year from (r.interval).begints),
                 to_char((r.interval).begints, 'YYYY-MM'),
                 date_trunc('day', (r.interval).begints))
 order by 1,2,3;
