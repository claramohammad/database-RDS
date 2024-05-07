SELECT 
    id_veiculo,
    AVG(Total_Pacientes) AS Media_Pacientes_Por_Mes
FROM (
    SELECT
        T.id_veiculo,
        YEAR(T.data) AS Ano,
        MONTH(T.data) AS Mes,
        SUM(TP.quantidade) AS Total_Pacientes
    FROM Transporte T
    JOIN TransportePaciente TP ON T.id_transporte = TP.id_transporte
    GROUP BY T.id_veiculo, YEAR(T.data), MONTH(T.data)
) AS MonthlyTotals
GROUP BY id_veiculo;
