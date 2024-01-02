create trigger dbo.TR_Basket_insert
on dbo.Basket
after insert, update -- запускается при вставке или обновлении
as
begin
    update dbo.Basket
    set DiscountValue = 
    case 
        when (select count(*) from dbo.Basket as b where b.ID_SKU = dbo.Basket.ID_SKU) > 1 
        then 0.05 * Value
        else 0
    end
end
