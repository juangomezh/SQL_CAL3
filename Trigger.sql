delimiter //
create TRIGGER ratingcheck BEFORE INSERT ON aboutdisks FOR EACH ROW IF NEW.rating >10 THEN SET NEW.rating = 0; 
END IF;//

delimiter //
create function contador()
returns varchar(20)
begin
	declare musname varchar(20);                               
	select name into musname from musician;
    return musname;
end;//

delimiter //
create procedure contar(out musname varchar(20))
begin
 select name into musname from musician;
 end;
 //