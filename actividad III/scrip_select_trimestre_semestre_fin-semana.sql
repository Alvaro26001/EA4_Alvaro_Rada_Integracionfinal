SELECT 
    [ID_DimTiempo],
    [fecha_pedido],
    [anio],
    [mes],
    [dia],
    CASE 
        WHEN DATEPART(month, [fecha_pedido]) BETWEEN 1 AND 6 THEN 1 
        ELSE 2
    END AS [Semestre],
    CASE 
        WHEN DATEPART(month, [fecha_pedido]) BETWEEN 1 AND 3 THEN 1  
        WHEN DATEPART(month, [fecha_pedido]) BETWEEN 4 AND 6 THEN 2  
        WHEN DATEPART(month, [fecha_pedido]) BETWEEN 7 AND 9 THEN 3  
        ELSE 4  
    END AS [Trimestre],
    CASE 
        WHEN DATEPART(WEEKDAY, [fecha_pedido]) IN (1, 7) THEN 'Sí'  
        ELSE 'No'  
    END AS [EsFinDeSemana]
FROM 
    [StagingJD].[dbo].[STDimTiempo]
