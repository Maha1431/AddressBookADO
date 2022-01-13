--uc1
create database AddressBookservice;

use AddressBookservice;
--uc2
create table Address_Book(
FirstName varchar(30) not null,
LastName varchar(20) not null,
Address varchar(100) not null,
City varchar(50) not null,
State varchar(50) not null,
Zipcode varchar(30) not null,
PhoneNumber varchar(20) not null,
Email varchar(50) not null
);

select * from Address_book;
--uc3
insert into Address_book Values
('maha', 'lakshmi', 'thyagarajanagar', 'banglore', 'karnataka', '8787', '7783727255', 'klal@gmail.com'),
('teju', 'hasini', 'shastri nagar', 'pune', 'mumbai', '9898', '9277277621', 'jjaha@gmail.com'),
('promod', 'jain', 'banshankari', 'chennai', 'Tamil nadu', '2872', '7727777271', 'jsh@gmail.com');

select *from Address_Book;

--uc4
update Address_Book set Zipcode = '1919', Email = 'mmahaece072gmail.com' where Firstname = 'maha';
select *from Address_Book;

-- uc5
delete  from Address_Book
  where FirstName = 'teju';	
  select *from Address_Book;
  
 --uc6
  select * from Address_Book
  where city = 'chennai' or state = 'Tamil nadu';
  
  --uc7
  select City,count(City) from Address_Book group by City;
  select State,count(State) from Address_Book group by State;
  
  --uc8
  select * from Address_Book
where City = 'banglore'
order by FirstName asc;

--uc9
Alter table Address_Book add Addressbook_name varchar(25),type varchar(50)
update Address_Book set Addressbook_name = 'Home',type = 'Family' where FirstName = 'maha' 
update Address_Book set Addressbook_name = 'Home',type = 'Friends' where FirstName = 'promod' 
update Address_Book set Addressbook_name = 'Office',type = 'Profession' where FirstName = 'teju';
select * from Address_Book;
--uc10

 select type, COUNT(FirstName) from address_book group by type;
 --uc11
 create table Addressbook(
 AddressBookID int identity(1,1) primary key,
AddressBookName varchar(100)
)

Insert into Addressbook values ('Family'),('Freinds')

select * from Addressbook;

create table Contact_Person(
AddressBook_ID int,
ContactID int identity(1,1) primary key,
FirstName varchar(100),
LastName varchar(100),
Address varchar(250),
City varchar(100),
StateName varchar(100),
ZipCode BigInt,
PhoneNum BigInt,
EmailId varchar(200),
foreign key (AddressBook_ID) references AddressBook(AddressBookID))

Insert into Contact_Person values
(1,'raju','karan','Mailapur','chennai','tamilnadu',38737,28388328,'r.k@gmail.com'),
(2,'yash','mahil','electronic city','bangalore','karnatka',727121,9838818281,'yashmahil@gmail.com'),
(2,'promod','Kumar','T.R nagar','hydrabad','andhra pradesh',098988,017211551,'kumar@gmail.com'),
(1,'shalu','malini','h.s.r layout','nellore','tamilnadu',76263,8282718711,'shalu@gmail.com');

select * from Contact_Person

---Create contact_type table
create table Contact_Type
(ContactTypeID int identity(1,1) primary key,
ContactTypeName varchar(100)
)

---Insert the values in contat_type
Insert into Contact_Type values
('Family'),('Friends')

--Retrieve the data
Select * from Contact_Type

---Create relation type table
create Table Relation_Type(
ContactType_ID int,
Contact_ID int,
foreign key (ContactType_ID) references Contact_Type(ContactTypeID),
foreign key (Contact_ID) references Contact_Person(ContactID)
)

---Insert the values in relation_type
insert into Relation_Type values
(1,1),
(2,2),
(1,3),
(1,4)

--Retrieve the data
Select * from Relation_Type;

--UC12
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Addressbook 
Full JOIN Contact_Person on Addressbook.AddressBookID=Contact_Person.AddressBook_ID 
Full JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
Full JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID

--Uc13
--uc6
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Contact_Person 
INNER JOIN  Addressbook on Addressbook.AddressBookID=Contact_Person.AddressBook_ID and (City='Chennai' or StateName='tamilNadu')
INNER JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
--UC7
select Count(*)As CountOfStateAndCity ,StateName,City
from Contact_Person 
INNER JOIN  Addressbook on Addressbook.AddressBookID=AddressBook_ID 
Group by StateName,City
-----UC8-----
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Contact_Person 
INNER JOIN  Addressbook on Addressbook.AddressBookID=AddressBook_ID 
INNER JOIN Relation_Type on Relation_Type.Contact_Id=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
order by(FirstName)
---	UC9----
select Count(*) as NumberOfContacts,Contact_Type.ContactTypeName
from Contact_Person 
INNER JOIN  Addressbook on Addressbook.AddressBookID=Contact_Person.AddressBook_ID
INNER JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
Group by ContactTypeName

select * from Address_Book


  
  

  
