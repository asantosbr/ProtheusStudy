USE Protheus
GO

DECLARE @chave VARCHAR(6) = 'ZL'

IF EXISTS (SELECT X5_CHAVE FROM SX5990 WHERE X5_CHAVE = @chave)
	BEGIN
		PRINT 'A chave ' + @chave + ' já existe.'
	END
ELSE
	BEGIN
		PRINT 'Disponível!'
	END
;
