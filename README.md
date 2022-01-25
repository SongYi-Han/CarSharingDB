# Build a databse for a car sharing business and practice some advanced SQL queries

1. Conceptual Design 
- come up with a conceptual model representing the entities of a carsharing organization.

2. Logical Design
- map the conceptual design onto a logical design (entity types and relationships) 
- deal with structured attributes, domain and collection-valued types
- implement specialization hierarchies

3. Add Constraints
- Define primary key, foreign key, uniqueness, not null, and semantic (check) constraints 


**Sample Data**
In order to have sufficient data to test, please load a database dump containing the table definitions and data. 
The dump file is [Here](https://www.ifi.uzh.ch/dbtg/teaching/courses/DatabaseLab/uebungen/cashdb.tar.txt.txt) 

Restore the dump as follows:
1) create a database user cashu 
2) create a database cashdb owned by user cashu
3) Rename the file from "cashdb.tar.txt" to "cashdb-plain.tar".
4) Restore the database cashdb in pgadmin4 

Alternatively, execute the following command in a shell or command window:
`pg_restore -O -v  -d cashdb -U cashu -v cashdb-plain.tar`
