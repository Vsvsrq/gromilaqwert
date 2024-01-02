-- Создание таблицы dbo.SKU
create table dbo.SKU
(
    ID int identity,
    code as ('s' + cast( ID as varchar)),
    [name] varchar(255)
);

-- Создание таблицы dbo.Family
create table dbo.Family
(
	ID int identity,
	SurName varchar(255),
	BudgetValue float
);

-- Создание таблицы dbo.Basket
create table dbo.Basket
(
	ID int identity,
	ID_SKU int,
	constraint Basket_SKU_fk 
    foreign key (ID_SKU)  references dbo.SKU (ID),
	ID_Family int,
	constraint Basket_Family_fk
	foreign key (ID_Family) references dbo.Family (ID),
	Quantity float not null,
	[Value] float not null,
	PurchaseDate date default getdate(),
    DiscountValue float
);
