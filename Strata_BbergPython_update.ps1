#test script to pull live Bloomberg data and feed to Strata

#Set directory
cd "C:\Program Files\StrataStack"
#indefinite loop for calling connect function  
    while(1)
{
    #Run Python module to update data
    #C:\"Program Files\StrataStack\Python\BbergPython\Curve_Query.py" #Debugging using .py
    C:\"Program Files\StrataStack\Python\BbergPython\Curve_Query.pyw" #Live (cmd UI suppresion) using .pyw

    #Allow 20 seconds to complete (should be more than enough)
    start-sleep -seconds 20
    
    #Run strata report tool
    java -jar strata-report-tool.jar `
    -p example-portfolios/CDS-portfolio.xml `
    -t example-reports/CDS-report-template.ini `
    -d 2014-01-22 `
    -m bbg_marketdata `
    -f csv > CDS-report_PS.csv 

    #Excel max update frequency is 1 minute, so wait another 40 seconds
    start-sleep -seconds 40

}