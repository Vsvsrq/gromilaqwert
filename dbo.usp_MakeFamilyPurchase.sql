create or alter procedure dbo.usp_MakeFamilyPurchase
    @FamilySurName varchar(255)
as
begin
    if @FamilySurName not in (select SurName from dbo.Family)
    begin
        raiserror ('Такой семьи не существует', 16, 1)
        return
    end
    update dbo.Family
    set BudgetValue = BudgetValue - (select sum(value)
	                                from dbo.Basket as b 
                                        inner join dbo.Family as f 
	                                    on f.ID = b.ID_Family
	                                where f.SurName = @FamilySurName)
    where dbo.Family.SurName = @FamilySurName
end

    