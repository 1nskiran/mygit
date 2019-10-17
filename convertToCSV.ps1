$w=$args[0]

Function excel2csv{
Param ($ExcelFile,$csvFile,$SheetName,$EndRow,$EndCol)
write-host -foregroundcolor "yellow" "Excel file " $ExcelFile
write-host -foregroundcolor "yellow" "CSV file " $csvFile

 if ((Test-Path $ExcelFile))
 {write-host -foregroundcolor "green" "Excel file exists"; 
 } 
 else 
   {write-host -foregroundcolor "red" "Excel file does not exists"; 
   } 

$excelObject = New-Object -ComObject Excel.Application
$excelObject.Visible = $false
$excelObject.DisplayAlerts = $false
$wb= $excelObject.Workbooks.Open($ExcelFile)
$xlCSVType = 6
$wb.SaveAs("$csvFile",$xlCSVType)
$wb.close()
$excelObject.Quit()
"Conversion over for $w.xlsx"+" at "+$(Get-Date -Format "MM/dd/yyyy HH:mm:ss")>> "C:\Duetto_Rate_Recommendations\log\$(Get-Date -Format "MMddyyyy")\XlsxtoCsvConvertion.txt"
"">> "C:\Duetto_Rate_Recommendations\log\$(Get-Date -Format "MMddyyyy")\XlsxtoCsvConvertion.txt"
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($wb) > $Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excelObject) > $Null
}

excel2csv "$w.xlsx" "$w.csv"


