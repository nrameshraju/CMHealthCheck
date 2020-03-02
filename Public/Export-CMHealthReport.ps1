function Export-CMHealthReport {
	<#
	.SYNOPSIS
		Convert extracted ConfigMgr site information to Word Document
	.DESCRIPTION
		Converts the data output from Get-CMHealthCheck to generate a
		report document using Microsoft Word (2010, 2013, 2016). Intended
		to be invoked on a desktop computer which has Office installed.
	.PARAMETER ReportFolder
		Path to output data folder (e.g. ".\2019-03-06\cm01.contoso.local")
	.PARAMETER AutoConfig
		Use an auto configuration file, cmhealthconfig.txt in $env:USERPROFILE\documents folder
		to fill-in AuthorName, CopyrightName, Theme, CssFilename, TableRowStyle
	.PARAMETER Detailed
		Collect more granular data for final reporting, or use AutoConfig file
	.PARAMETER CoverPage
		Word theme cover page (default = "Slice (Light)"), or use AutoConfig file
	.PARAMETER Template
		Word document file to use as a template. Should have a cover page already in place.
		If Template is specified, CoverPage and Copyright are ignored.
	.PARAMETER CustomerName
		Name of customer (default = "Customer Name"), or use AutoConfig file
	.PARAMETER AuthorName
		Report Author name (default = "Your Name"), or use AutoConfig file
	.PARAMETER CopyrightName
		Text to use for copyright footer string (default = "Your Company Name")
	.PARAMETER Overwrite
		Overwrite existing report file if found, or use AutoConfig file
	.PARAMETER Healthcheckfilename
		Healthcheck configuration XML file name (default = ".\assets\cmhealthcheck.xml")
		The file can be local, UNC or URI sourced as well
	.PARAMETER MessagesFilename
		Status and error message lookup table (default = ".\assets\messages.xml")
		The file can be local, UNC or URI sourced as well
	.PARAMETER Healthcheckdebug
		Enable verbose output (or use -Verbose)
	.EXAMPLE
		Export-CMHealthCheck -Detailed -CustomerName "Contoso" -AuthorName "David Stein" -CopyrightName "ACME Consulting" -Overwrite -Verbose
	.EXAMPLE
		Export-CMHealthCheck -ReportFolder "2019-03-06\cm01.contoso.local" -Detailed -Template ".\contoso.docx" -CustomerName "Contoso" -AuthorName "David Stein" -CopyrightName "ACME Consulting" -Overwrite -Verbose
	.EXAMPLE
		Export-CMHealthCheck -ReportFolder "2019-03-06\cm01.contoso.local" -AutoConfig -CustomerName "Contoso"
	.NOTES
		Sample AutoConfig file cmhealthconfig.txt...
		AuthorName=John Wick
		CopyrightName=Retirement Specialists
		Theme=Ocean
		Detailed=True
		TableRowStyle=Solid
		CssFilename=c:\docs\wickrocks.css
		ImageFile=c:\docs\bodybags.png
		CoverPage=
		Template=
		HealthcheckFilename=
		MessagesFilename=
		HealthcheckDebug=False
		Overwrite=True
	#>
	[CmdletBinding()]
	param (
		[parameter()][ValidateNotNullOrEmpty()][string] $ReportFolder = "$($env:USERPROFILE)\Documents",
		[parameter()][ValidateSet('HTML','Word')][string] $ReportType = 'HTML',
		[parameter()][ValidateNotNullOrEmpty()][string] $OutputFolder = "$($env:USERPROFILE)\Documents",
		[parameter()][string] $CustomerName = "Customer Name",
		[parameter()][switch] $AutoConfig,
		[parameter()][string] $SmsProvider = "",
		[parameter()][switch] $Detailed,
		[parameter()][string] $CoverPage = "Slice (Light)",
		[parameter()][string] $Template = "",
		[parameter()][string] $AuthorName = "",
		[parameter()][string] $CopyrightName  = "Your Company Name",
		[parameter()][string] $Healthcheckfilename = "",
		[parameter()][string] $MessagesFilename = "",
		[parameter()][bool] $Healthcheckdebug = $False
	)
	if ($env:USERPROFILE -eq 'c:\windows\system32\config\systemprofile') {
		$OutputFolder = $env:TEMP
	}
	Write-Host "Analyzing collected data, publishing report"
	$StartTime = Get-Date
	switch ($ReportType) {
		'HTML' {
			$expParams = @{
				ReportFolder  = $ReportFolder 
				AutoConfig    = $AutoConfig
				CustomerName  = $CustomerName 
				CopyrightName = $CopyrightName 
				AuthorName    = $AuthorName
				SmsProvider   = $SmsProvider
				OutputFolder  = $OutputFolder
				Detailed      = (!(!$Detailed))
				Overwrite     = $True
				Theme         = "Ocean"
				TableRowStyle = "Solid"
			}
			Export-CMHealthCheckHTML @expParams
		}
		'Word' {
			$expParams = @{
				ReportFolder  = $ReportFolder 
				CustomerName  = $CustomerName 
				CopyrightName = $CopyrightName 
				AuthorName    = $AuthorName 
				SmsProvider   = $SmsProvider
				Detailed      = $Detailed
				Overwrite     = $Overwrite
				AutoConfig    = $AutoConfig
				CoverPage     = "Slice (Light)"

			}
			Export-CMHealthCheck @expParams
		}
	}
	$RunTime  = Get-TimeOffset -StartTime $StartTime
	Write-Output "Report publishing process completed. Total runtime: $RunTime (hh`:mm`:ss)"
}
