select *from CUAHANG

CREATE
--ALTER
PROC ListRestaurantsForPartner
	@masothue CHAR(15)
AS
BEGIN
	IF NOT EXISTS (SELECT MASOTHUE FROM DOITAC WITH(XLOCK) WHERE MASOTHUE = @masothue)
	BEGIN
		SELECT 'PARTNER IS NOT FOUND' AS 'ERROR'
	END
	IF NOT EXISTS (SELECT MASOTHUE FROM CUAHANG WITH(XLOCK) WHERE MASOTHUE = @masothue)
	BEGIN
		SELECT 'PARTNER HAS NO RESTAURANT' AS 'ERROR'
	END
	SELECT * FROM CUAHANG WHERE MASOTHUE = @masothue
END

EXEC ListRestaurantsForPartner 'tax0001'


CREATE
--ALTER
PROC listContractsByPartnerID
	@masothue CHAR(15)
AS
BEGIN
	IF NOT EXISTS(SELECT MASOTHUE FROM DOITAC WHERE MASOTHUE = @masothue)
	BEGIN
		SELECT 'PARTNER IS NOT FOUND' AS 'ERROR'
		RETURN 0
	END
	SELECT *FROM HOPDONG WHERE MASOTHUE = @masothue
END
RETURN 1

EXEC listContractsByPartnerID '000761967'

select * from MONAN