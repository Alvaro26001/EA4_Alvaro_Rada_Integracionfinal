SELECT 
   emp.[ID_empleado],
   emp.[ID_oficina],
    emp.[ID_jefe],
   oficina.[Descripcion] AS Nombre_Oficina,
    jefe.[nombre] AS Nombre_Jefe
FROM 
    [StagingJD].[dbo].[EmpleadoST] emp
-- Join con la tabla OficinaST para obtener el nombre de la oficina
LEFT JOIN 
    [StagingJD].[dbo].[OficinaST] oficina
    ON emp.[ID_oficina] = oficina.[ID_oficina]
-- Self-Join con EmpleadoST para obtener el nombre del jefe
LEFT JOIN 
    [StagingJD].[dbo].[EmpleadoST] jefe
    ON emp.[ID_jefe] = jefe.[ID_empleado]