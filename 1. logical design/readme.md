
**General Requirements**  
»Car-Sharing« refers to the joint ownership and/or usage of vehicles by members of an organization. The participants can thus use automobiles without having to privately own
the cars. Here we assume that the organization is in the form of a cooperative.  
Information about the Car-Sharing assets that should be managed by the application include:  
  
❑ the members of the Car-Sharing organization,  
❑ vehicles the organization owns,  
❑ locations of the vehicles,  
❑ reservations,  
❑ utilization and efficiency of vehicles and locations.  
  
`Vehicles`  
The cooperative jointly owns vehicles which can be used by the members. There are various types of vehicles, which are suited for different purposes.
For ecologically aware members, hybrid cars and compact cars are offered. For normal tours, regular automobiles (sedans) exist, while large families and groups can use mini
vans. For shopping tours, station wagons and trucks (for bulk purchases) are available. Trucks come in two variations: open (pickups) and closed (transporters). The cooperative finally decided to also offer convertibles and limousines, however at much higher prices.  
We assume that all vehicles are equipped with airbags on their front seats. Not all vehicles (e.g., some pickups) have seats in the back. Little children must use special child seats (which are available in some cars). Children until the age of 12 may only travel on back seats. All vehicles must have a valid license plate and need auto insurance.  
For all vehicles the odometer (before and after each trip) must be known. Vehicles are principally purchased new and will be sold as soon as a type-specific odometer value is reached. Finally, the gas usage must be logged for each vehicle. All vehicles have a computer on board which is able to store data such as reservations and can communicate with the headquarter.
  
`members`  
Members of the cooperative are (human) persons which hold shares of the cooperative. Upon joining the cooperative, they buy shares for a certain (individual) amount, which
they receive back when they leave.  
Car-sharing members are persons or companies which pay a yearly fee. Both kinds of members are principally authorized to use vehicles of the cooperative (after reserving
them, of course), assuming that they meet the legal requirements and those of the cooperative. Company membership means that a certain number of company employees can
use the vehicles for business purposes.  
Each user (driver) must have a valid driver license. The yearly fee for person members is discounted if the member is older than 25 years and has not had an accident for at
least one year. Members must have a postal address and email address, so that the cooperative can send invoices. Also, members need a bank account.  
Members can specify a home location, which is the favorite location where they most often reserve vehicles. They are however free to use vehicles from any location in the
country.  
Finally, members have a member number and password, which they need to log into the reservation application.   
  
`Reservations` and `Usages`  
Vehicles can be used after they have been successfully reserved. A reservation thus specifies which member has reserved which vehicle for which time period. The on-board
computer will allow the vehicle usage only for those members that have a valid reservation.  
For each usage, the cost is based on the duration of the usage (time-based cost) and the distance driven. Both, the hourly price and the price per kilometer depend on the
type of the vehicle (e.g. both kinds of prices are higher for limousines than for compact cars).  
The organization needs to keep track of the vehicle usages by members. The resulting cost must be calculated and invoiced to members on a regular basis (e.g., monthly).
Members are required to refuel whenever tank content is below a certain threshold. Fuel expenses will be credited to the member with the next invoice.  
As mentioned reservations are prerequisite for vehicle usage.  
Typically a user will provide the following information with each reservation request:  
- location,
- desired vehicle type,
- time period,
- extra requirements such as child seat.  
  
In case a reservation requirements cannot be exactly matched, the application should support the member with alternative options:  
- meeting the reservation request at a nearby location;
- meeting the reservation request with a different vehicle type but at the desired location and time.  
  
It should also be possible to retrieve a daily usage schedule for individual vehicles or all vehicles of a location.
  
`Monitoring` and `Planing`  
The Char-Sharing organization naturally wants to operate its vehicles as economically and efficiently as possible. To that end, a number of regular analyses should be carried
out, such as:  
- Utilization of vehicles by location,
- Utilization of vehicles by type,
- Vehicle utilization by type and location,
- bottlenecks and shortages (by location, vehicle type, and/or day of week or time of day),
- Utilization by user / user region


