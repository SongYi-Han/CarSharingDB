
/*          Primary Keys
*/
alter table BusinessPartner
      add constraint BusinessPartner_PK primary key(id);

alter table Person
      add constraint Person_PK primary key(id);

alter table Company
      add constraint Company_PK primary key(id);

alter table InsuranceCompany
      add constraint InsuranceCompany_PK primary key(id);

alter table LeaseContract
      add constraint LeaseContract_PK primary key(id);

alter table Location
      add constraint Location_PK primary key(id);

alter table Member
      add constraint Member_PK primary key(id);

alter table PersonMember
      add constraint PersonMember_PK primary key(id);

alter table CompanyMember
      add constraint CompanyMember_PK primary key(id);

alter table CoopMember
      add constraint CoopMember_PK primary key(id);

alter table Equipment
      add constraint Equipment_PK primary key(id);

alter table Vehicle
      add constraint Vehicle_PK primary key(id);

alter table CompactCar
      add constraint CompactCar_PK primary key(id);

alter table Convertible
      add constraint Convertible_PK primary key(id);

alter table Limousine
      add constraint Limousine_PK primary key(id);

alter table Sedan
      add constraint Sedan_PK primary key(id);

alter table StationWagon
      add constraint StationWagon_PK primary key(id);

alter table Van
      add constraint Van_PK primary key(id);

alter table Pickup
      add constraint Pickup_PK primary key(id);

alter table Transporter
      add constraint Transporter_PK primary key(id);

alter table Reservation
      add constraint Reservation_PK primary key(id);

alter table Invoice
      add constraint Invoice_PK primary key(id);

alter table UseOfVehicle
      add constraint UseOfVehicle_PK primary key(id);

alter table VehicleStaticData
      add constraint VehicleStaticData_PK primary key(type);

alter table MemberFees
      add constraint MemberFees_PK primary key(membertype);


/*          Foreign Keys
*/

-- alter table LeaseContract
--       add foreign key (landlord) references BusinessPartner(id)
--           on delete cascade
-- 	  on update cascade;

alter table Location
      add foreign key (nextLocation) references Location(id)
          on delete set null
 	  on update cascade;

alter table Location
      add foreign key (secondNextLocation) references Location(id)
          on delete set null
 	  on update cascade;

alter table Location
      add foreign key (leaseContract) references LeaseContract(id)
          on delete set null
 	  on update cascade;

alter table Member
      add foreign key (homeLocation) references Location(id)
          on delete set null
 	  on update cascade;

alter table CoopMember
      add foreign key (responsibleFor) references Location(id)
          on delete set null
 	  on update cascade;

alter table Vehicle
      add foreign key (type) references VehicleStaticData
          on delete restrict
 	  on update cascade;

alter table Vehicle
      add foreign key (home) references Location(id)
          on delete set null
 	  on update cascade;

alter table Extras
      add foreign key (car) references Vehicle(id)
          on delete cascade
 	  on update cascade;

-- alter table Reservation
--       add foreign key (vehicle) references Vehicle(id)
--           on delete cascade
--  	  on update cascade;

-- alter table Reservation
--       add foreign key (member) references Member(id)
--           on delete cascade
--  	  on update cascade;

-- alter table Invoice
--       add foreign key (member) references Member(id)
--           on delete cascade
--  	  on update cascade;

alter table UseOfVehicle
      add foreign key (reservation) references Reservation(id)
          on delete cascade
 	  on update cascade;

alter table UseOfVehicle
      add foreign key (invoice) references Invoice(id)
          on delete cascade
 	  on update cascade;


/*          Unique Constraints
*/
alter table Person
      add constraint uniquePersonName unique(lastname, firstname);

alter table PersonMember
      add constraint uniquePMemberName unique(lastname, firstname);

alter table CoopMember
      add constraint uniqueCMemberName unique(lastname, firstname);

alter table Company
      add constraint unique_name unique(companyname);

alter table Reservation
      add constraint unique_resNumber unique(resNumber);

alter table Invoice
      add constraint unique_invoiceNumber unique(invoiceNumber);

alter table UseOfVehicle
      add constraint unique_usageNumber unique(usageNumber);



/*          Not NUll
*/
alter table Person
      alter column firstname  set NOT NULL;

alter table Person
      alter column lastname  set NOT NULL;

alter table Person
      alter column dateofbirth  set NOT NULL;

/*          check constraints
*/
alter table LeaseContract 
      add constraint positiveFee check (monthlyFee > 0);

alter table LeaseContract 
      add constraint positiveSpaceCnt check (parkingSpaceCnt > 0);

alter table Member 
      add constraint validType check (type in ('PersonMember', 'CoopMember', 'CompanyMember'));

alter table CoopMember 
      add constraint positiveShares check (shares > 0);

alter table Vehicle 
      add constraint positiveKilometers check (kilometers >= 0);

alter table Vehicle 
      add constraint positiveGasConsumption check (gasConsumption >= 0);

alter table Truck 
      add constraint positiveLoadingCapacity check (loadingCapacity > 0);

alter table StationWagon 
      add constraint positiveLoadingVolume check (loadingVolume > 0);

alter table Van 
      add constraint positiveNumberOfSeats check (numberOfSeats > 0);

alter table Transporter 
      add constraint positiveHeight check (height >= 0);

alter table Reservation 
      add constraint validInterval check ((interval).endts > (interval).begints);

alter table Invoice 
      add constraint validDates check (dueDate > invoiceDate);

alter table UseOfVehicle 
      add constraint positiveHours check (hours >= 0);

alter table UseOfVehicle 
      add constraint positiveKilometers check (kilometers >= 0);

alter table UseOfVehicle 
      add constraint positiveFuelCosts check (fuelCosts >= 0);


