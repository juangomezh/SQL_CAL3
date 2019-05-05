drop user if exists boss;
drop user if exists customer;
create user boss;
grant insert, update, delete on assigment.concerts to boss;
create user customer;
grant select on assigment.concerts to customer;
grant select on assigment.buydisks to customer;