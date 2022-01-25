
create table BusinessPartner 
       (id          integer,
        address     AddressT, 	
        bankAccount BankAccountT
       );

create table Person
       (firstName   varchar(25) , 	
        lastName    varchar(25) , 
        dateOfBirth Date 
       ) inherits (BusinessPartner); 

create table Company
       (companyName varchar(25) not null
       ) inherits (BusinessPartner); 

create table InsuranceCompany
       (
       ) inherits (Company); 

create table LeaseContract
       (id              integer , 
	landlord        integer not null, -- reference to BusinessPartner 	
	monthlyFee      Money
	endOfContract   Date, 
	parkingSpaceCnt integer not null
       );

create table Location
       (id                 integer , 
	shortName          char(3) not null, 
	name               varchar(20) not null, 
	nextLocation       integer, -- reference to location
	secondNextLocation integer, -- reference to location
	leaseContract      integer, -- reference to LeaseContract
	address            AddressT, 
	map                ImageT
       );

create table Member
       (id           integer ,
--        type         MemberType, Enum yields problems in SQLJ and JDBC
        type         varchar(15) not null,
        memberNr     integer not null, 	
        password     varchar(15), 
        homeLocation integer   -- reference to Location 
       );

create table CoopMember
       (shares         Money,
	responsibleFor integer -- reference to Location
       ) inherits(Member, Person);

create table CarSharingMember
       (
       ) inherits(Member);

create table PersonMember
       (hadAccident    boolean
	               default false
       ) inherits(CarSharingMember, Person);

create table CompanyMember
       (
       ) inherits(CarSharingMember, Company);

create table Equipment
       (id             integer ,
        feature        varchar(10)
       );

create table Vehicle
	(id             integer ,
--	 type           VehicleType, enum yields problems in JDBC and SQLJ
	 type           varchar(15) not null,
	 licensePlate   varchar(10), 	
	 make           varchar(15), 
	 model          varchar(15), 
	 motorNumber    varchar(20), 
	 kilometers     KilometerT
	                default 0, 
	 isOperational  boolean
	                default true, 
	 operationStart Date, 
	 lastService    Date, 
	 gasConsumption LiterT
	                default 0, 
	 insurance      InsurancePolicyT, 
	 home           integer       -- reference to Location
        );

create table MotorCar
	(childSeat      boolean
		        default false,      
	 extras         varchar(100)
        ) inherits (Vehicle);

create table Truck
	(loadingCapacity smallint
        ) inherits (Vehicle);

create table CompactCar 
        (
        ) inherits (MotorCar);

create table Convertible
        (backseat        boolean
		         default true
        ) inherits (MotorCar);

create table Limousine
	(
        ) inherits (MotorCar);

create table Sedan
	(
        ) inherits (MotorCar);

create table StationWagon
	(loadingVolume   smallint
        ) inherits (MotorCar);

create table Van
	(numberOfSeats   smallint   
        ) inherits (MotorCar);

create table Pickup
	(
        ) inherits (Truck);

create table Transporter
	(height          smallint   
        ) inherits (Truck);

create table Extras
        (car      integer,
	 feature  integer
        );

create table Reservation 
	(id              integer ,
	 interval        IntervalT, 
	 resNumber       integer not null, 
	 vehicle         integer, -- reference to Vehicle
	 member          integer -- reference to Member
        );

create table Invoice
	(id              integer ,
	 invoiceDate     Date, 	
	 dueDate         Date, 
	 invoiceNumber   integer not null, 
	 isPaid          boolean
	                 default false, 
	 total           Money
	                 default 0.00, 
	 member          integer -- reference to Member
        );

create table UseOfVehicle
	(id              integer ,
	 usageNumber     integer not null, 
	 hours           smallint, 	
	 gasConsumed     LiterT, 
	 kilometers      KilometerT, 
	 fuelCosts       Money
	                 default 0.0, 
	 reservation     integer not null, -- reference to Reservation
	 invoice         integer -- reference to Invoice
        );

-- This table contains informations about the fee, the maximum kilometers and
-- the picture for each vehicle type
-- type: The vehicle type
-- pphour: The price in swiss francs for the usage of the vehicle for one hour.
-- ppkilometer: The price in swiss francs for each kilometer driven with the vehicle.
-- maxKilometers: The maximum of kilometers before a car should be sold. 
-- picture: A picture for this type
create table VehicleStaticData 
--	(type           VehicleType, enum yields problems in JDBC,SQLJ
  	(type           varchar(15) ,
	 pphour         Money,
	 ppkilometer    Money,
	 maxKilometers  KilometerT,
	 vehiclePicture ImageT
        );

-- This table contains information about the member fees.
-- memberType: the type of the member (either PersonMember or CompanyMember)
-- basicFee: The basic fee in swiss francs without any reduction.
-- reduction: The reduction in percent.

create table MemberFees
	(memberType varchar(15) ,
	 basicFee   Money,
	 reduction  integer
        );

create table mydual (dummy char(1));
insert into mydual values('0');








