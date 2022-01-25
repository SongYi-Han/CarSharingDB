
create type VehicleType as enum ('CompactCar',
	                         'Convertible',
				 'Limousine',
				 'Pickup'
				 'Sedan',
				 'StationWagon',
				 'Transporter',
				 'Van'
			        );

create type MemberType as enum ('PersonMember',
	                        'CoopMember',
				'CompanyMember'
			        );

create domain KilometerT
   as numeric(10,3);

create domain LiterT
   as numeric(10,2);

create domain ImageT
   as bytea;

create type IntervalT as 
	(begints Timestamp, 
	 endts   Timestamp);

create type AddressT as 
	(streetName  Varchar(25), 	
	 houseNumber Integer, 
	 zipCode     varchar(5), 
	 city        varchar(25));

create type BankAccountT as 
	(bankName       Varchar(25), 	
	 accountNumber  varchar(12), 
	 clearingNumber Integer);

create type InsurancePolicyT as 
	(insuranceCompany integer, -- reference to InsuranceCompany	
	 yearlyFee        numeric(8,2)); 

