-- Создание таблицы dbo.SKU
if object_id('dbo.SKU') is null
begin
	create table dbo.SKU (
  		ID int not null identity,
  		Code as ('s' + cast( ID as varchar)),
   		[Name] varchar(255),
		constraint PK_SKU primary key clustered (ID)
	)
	alter table dbo.SKU add constraint UK_SKU_Code unique (Code)
end

-- Создание таблицы dbo.Family
if object_id('dbo.Family') is null
begin
	create table dbo.Family(
		ID int not null identity,
		SurName varchar(255),
		BudgetValue float,
		constraint PK_Family primary key clustered (ID)
	)
end

-- Создание таблицы dbo.Basket
if object_id('dbo.Basket') is null
begin
	create table dbo.Basket(
		ID int not null identity,
		ID_SKU int,
		ID_Family int,
		Quantity float not null,
		[Value] float not null,
		PurchaseDate date,
    	DiscountValue float
		constraint PK_Basket primary key clustered (ID)
	)
	alter table dbo.Basket add constraint FK_Basket_ID_SKU_SKU foreign key (ID_SKU) references dbo.SKU (ID)
	alter table dbo.Basket add constraint FK_Basket_ID_Family_Family foreign key (ID_Family) references dbo.Family(ID)
	alter table dbo.Basket add constraint DF_Basket_PurchaseDate default getdate() for PurchaseDate
end
