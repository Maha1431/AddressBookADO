use AddressBookservice;

Alter procedure spGetAllAddressBook
As 
Begin try
select * from Address_Book
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH 

exec spGetAllAddressBook

Alter procedure spAddInAddressBook
(
@FirstName varchar(20),
@LastName varchar(20),
@Address varchar(50),
@City varchar(20),
@State varchar(20),
@Zipcode int,
@PhoneNumber varchar(10),
@Email varchar(50)
)
As
Begin try
insert into Address_Book(FirstName, LastName, Address, City, State, Zipcode, PhoneNumber, Email) 
   values (@FirstName, @LastName, @Address, @City, @State, @Zipcode, @PhoneNumber, @Email)
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_NUMBER() AS ErorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec spAddInAddressBook
'mahil','jain','maruthi nagar','pune','mumbai',74434,9638527410,'mahil@gmail.com';

select * from Address_Book

Alter procedure spUpdateInAddressBook
(
@FirstName varchar(20),
@State varchar(20)
)
As 
Begin try
update Address_Book
set State=@State
where FirstName=@FirstName
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec spUpdateInAddressBook
'Mahil','Bombay'
select * from Address_Book


Alter procedure spDeleteInAddressBook
(
@Firstname varchar(20)
)
As 
Begin try
delete from Address_Book FirstName = @FirstName 
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec spDeleteInAddressBook
'mahil'

create PROCEDURE spAddressBookCityorState 
@City varchar(50),
@State varchar(50)
AS
Begin try
SELECT FirstName,City,State FROM Address_Book WHERE City = @City or State=@State
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec spaddressBookCityorState
'pune', 'mumbai';


Alter procedure spRetrieveCountOfContactsByCity
(
@City varchar(20)
)
As
Begin try
select * from Address_Book where City = @City
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH 

exec spRetrieveCountOfContactsByCity
'bangalore'