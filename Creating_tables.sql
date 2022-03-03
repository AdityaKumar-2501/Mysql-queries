create table department (
	Dno integer primary key,
    Dname varchar(50),
    Location varchar(50) default "New Delhi"
);

create table employee (
	Eno char(3) PRIMARY KEY,
    Ename varchar(50) NOT NULL,
    Job_type Varchar(50) NOt Null,
    SupervisorEno char(3),
    Hire_date DATE NOT NULL,
    Dno Integer,
    Commission DECIMAL(10,2),
    Salary DEcimal(7,2) NOT NULL,
    Foreign KEy (SupervisorEno) references supervisor(SupervisorEno),
    foreign key (Dno) references department(Dno)
);

-- Alter table supervisor Modify column SupervisorEno char(3);

create table supervisor (
	SupervisorEno char(3) primary key,
    SupervisorName varchar(50) NOt NuLL
);