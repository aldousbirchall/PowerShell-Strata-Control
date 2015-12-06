## test script to extract data from SQL DB and dump in csv
## Uses sqlps cmdlet.

## '-DisableNameChecking' and '-NoType' give clean output
Import-module "sqlps" -DisableNameChecking

Invoke-Sqlcmd -Query "SELECT * FROM cds_yieldCurves;" `
–Database “Strata_TestDB” -ServerInstance "MINIDESKTOP\SQLEXPRESS" `
| Export-Csv -NoType C:\Users\Aldous\Desktop\Test_SQL_export.csv