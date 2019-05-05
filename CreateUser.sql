drop user if exists boss;
drop user if exists customer;
/*boss user*/
create user boss;
grant insert, update, delete on assigment.concerts to boss;
/*customer*/
create user customer;
grant select on assigment.concerts to customer;
grant select on assigment.buydisks to customer;