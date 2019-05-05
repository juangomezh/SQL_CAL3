drop trigger if exists ratingcheck;
drop function if exists contador;
drop procedure if exists contar;
/*trigger*/
delimiter //
create TRIGGER ratingcheck BEFORE INSERT ON aboutdisks FOR EACH ROW IF NEW.rating >10 THEN SET NEW.rating = 10; 
END IF;//
/*function*/
delimiter //
create function contador()
returns varchar(20)
begin
	declare musname varchar(20);                               
	select count(name) into musname from musician;
    return musname;
end;//
/*procedure*/
delimiter //
create procedure contar(out musname varchar(20))
begin
 select count(name) into musname from musician;
 end;//

/**calling the functions*/
call contar(@musname);
select contador();