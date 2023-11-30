SET PAGESIZE 200;
set linesize 200;

drop table PurchaseDetail;
drop table Customer;
drop table Pets;
drop table Facilities;
drop table PetCare;

create table PetCare(
    PetCareID number(30),
    Address varchar(30),
    Phone number(20),
    Email varchar(20),
    primary key(PetCareID)
);

create table Facilities(
    FacilitiesId number(30),
    FacilitiesType varchar(20),
    Price number(20),
    PetCareID number(30),
    primary key(FacilitiesId),
    foreign key(PetCareID) REFERENCES PetCare(PetCareID)
);

create table Pets(
    PetId number(20),
    PetType varchar(20),
    Cost number(20),
    PetCareID number(30),
    primary key(PetId),
    foreign key(PetCareID)REFERENCES PetCare(PetCareID)
);

create table Customer(
    CustId number(20),
    CustName varchar(20),
    CustAddress varchar(30),
    CustPhone number(20),
    CustEmail varchar(20),
    PetId number(20),
    FacilitiesId number(30),
    primary key(CustId),
    foreign key(FacilitiesId) REFERENCES Facilities,
    foreign key(PetId) REFERENCES Pets
);

create table PurchaseDetail(
    PurchaseDate Date,
    Quantity number(20),
    CustId number(20),
    foreign key(CustId) REFERENCES Customer
);



insert into PetCare values(1, 'FulbariGate,Khulna', 01234567891,'petstore@gmail.com');


insert into Facilities values('11','Grooming',1000,1);
insert into Facilities values('12','Boarding',2000,1);
insert into Facilities values('13','Vet',1000,1);


insert into Pets values('111','Dog',20000,1);
insert into Pets values('112','Cat',6000,1);
insert into Pets values('113','Birds',500,1);

insert into Customer values(1111,'A','Dhaka',01234567891,'a@gmail.com',null,11);
insert into Customer values('1112','B','Dhaka',01234567891,'b@gmail.com',112,null);
insert into Customer values('1113','c','Khulna',01234567891,'c@gmail.com',113,12);


insert into PurchaseDetail(PurchaseDate,Quantity,CustId) values('10-NOV-2023',1,1111);
insert into PurchaseDetail(PurchaseDate,Quantity,CustId) values('11-NOV-2023',2,1112);
insert into PurchaseDetail(PurchaseDate,Quantity,CustId) values('11-NOV-2023',2,1113);

SELECT * FROM PetCare;
select * from Facilities;
select * from Pets;
select * from Customer;
select * from PurchaseDetail;

select * from Customer natural join PurchaseDetail;
