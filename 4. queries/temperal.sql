 -- open (on going and future) reservations of the member number 1000
select m.memberNr, r.resnumber, r.interval
  from reservation r join
       member m on r.member = m.id
 where m.memberNr = 1000
       And (r.interval).endts > current_timestamp;


 -- all reservations for vehicles of any category at the location ust on 11.11.2021 at 9-10
select resnumber, interval, licensePlate
  from reservation r join
       vehicle v on r.vehicle = v.id join
       location l on v.home = l.id
 where l.shortname = 'ust'
       and ( ( (r.interval).begints <= '2021-11-11 09:00:00'
               and (r.interval).endts > '2021-11-11 09:00:00')
             or
             ( (r.interval).begints >= '2021-11-11 09:00:00'
               and (r.interval).begints <= '2021-11-11 10:00:00'));

 -- all license plates with the number of reservations on 11.11.2021 from 9-10
select licensePlate, 
       (select count(resnumber)
         from reservation r
        where r.vehicle = v.id
              and ( ( (r.interval).begints <= '2021-11-11 09:00:00'
                      and (r.interval).endts > '2021-11-11 09:00:00')
                    or
                    ( (r.interval).begints >= '2021-11-11 09:00:00'
                      and (r.interval).begints <= '2021-11-11 10:00:00')))
  from vehicle v;
