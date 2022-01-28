 -- the names and home location of the person members, in the order of the home locations
select firstname || ' ' || lastname, name
  from personmember p join
       location l on p.homelocation = l.id
 order by name;


 -- Make, model, and name of the home location of the vehicles. 
-- The make and model of vehicles without home location should be shown as well
select make, model, name
  from vehicle v left outer join
        location l on v.home = l.id;


 -- the members with due and open invoices
select memberNr 
  from invoice i join
       member m on i.member = m.id
 where not ispaid 
       and dueDate < current_date;


 -- the names and yearly fees of all members
select companyName as name,
        basicFee    as yearlyFee
  from companyMember m join
       memberFees f on m.type = f.memberType
union 
select firstname || ' ' || lastname as name,
       case hadAccident when true then basicFee * 0.8
            else basicFee
       end as yearlyFee
  from PersonMember m join
       memberFees f on m.type = f.memberType
union 
select firstname || ' ' || lastname as name,
       0 as yearlyFee
  from CoopMember m;


 -- all person members living in a city with a location which has limousines
select distinct firstname || ' ' || lastname, (l.address).city, (m.address).city
  from personmember m join 
       location l on (l.address).city = (m.address).city 
 where exists (select *
                 from limousine
                 where home = l.id);