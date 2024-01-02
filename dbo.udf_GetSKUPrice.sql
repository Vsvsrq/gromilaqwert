create or alter function dbo.udf_GetSKUPrice (@ID_SKU int)
returns decimal(18, 2) -- функция возвращает значения типа decimal
as
begin
    -- переменные которые использую внутри функции
    declare @result decimal(18, 2)
    declare @sumValue decimal(18, 2)
    declare @sumQuantity decimal(18, 2)
    -- расчитываю суммы столбцов по передаваемому значению
    select @sumValue = sum(value),
        @sumQuantity = sum(Quantity)
    from dbo.Basket
    where ID_SKU = @ID_SKU
    -- делю полученные значения и присваиваю результат 
    set @result = @sumValue/@sumQuantity
    return @result 
end
