#  
# Module manifest for module 'AzureRM.Netcore'  
#  
# Generated by: Microsoft Corporation  
#  
# Generated on: 01/23/2018 17:30:51
#  

$PSDefaultParameterValues.Clear()
Set-StrictMode -Version Latest

Import-Module AzureRM.Profile.Netcore -RequiredVersion 0.10.0
Import-Module AzureRM.Compute.Netcore -RequiredVersion 0.10.0
Import-Module AzureRM.KeyVault.Netcore -RequiredVersion 0.10.0
Import-Module AzureRM.Network.Netcore -RequiredVersion 0.10.0
Import-Module AzureRM.Resources.Netcore -RequiredVersion 0.10.0
Import-Module AzureRM.Storage.Netcore -RequiredVersion 0.10.0
Import-Module AzureRM.Tags.Netcore -RequiredVersion 0.10.0
Import-Module AzureRM.Websites.Netcore -RequiredVersion 0.10.0


if (Test-Path -Path "$PSScriptRoot\StartupScripts")
{
    Get-ChildItem "$PSScriptRoot\StartupScripts" | ForEach-Object {
        . $_.FullName
    }
}

if ($PSVersionTable.PSVersion.Major -ge 5)
{
    $completerCommands = @()
    
    $completerCommands | ForEach-Object {
        $type = $_.AttributeType
        $args = "@()"
        if ($_.ArgumentList.Count -ne 0) {
		    $temp = $_.ArgumentList -join "`", `"" 
            $args = "@(`"" + $temp + "`")" 
        }
        $sb = [scriptblock]::Create("param(`$commandName, `$parameterName, `$wordToComplete, `$commandAst, `$fakeBoundParameter) `
        `$completerObject = New-Object $type -ArgumentList $args `
        `$arguments = `$completerObject.GetCompleterValues() `
        `$wordToCompleteTrimQuote = `$wordToComplete.Trim(`"'`")
        `$wordToCompleteTrimmed = `$wordToCompleteTrimQuote.Trim(`"```"`")
        `$arguments | Where-Object { (`$_ -Like `"`$wordToComplete*`")  -or (`$_ -Like `"```'`$wordToCompleteTrimmed*```'`") } | ForEach-Object { [System.Management.Automation.CompletionResult]::new(`$_, `$_, 'ParameterValue', `$_) }")
        Register-ArgumentCompleter -CommandName $_.Command -ParameterName $_.Parameter -ScriptBlock $sb
    }
}

$FilteredCommands = @()

$FilteredCommands | ForEach-Object {
	$global:PSDefaultParameterValues.Add($_,
		{
			$context = Get-AzureRmContext
			if (($context -ne $null) -and $context.ExtendedProperties.ContainsKey("Default Resource Group")) {
				$context.ExtendedProperties["Default Resource Group"]
			} 
		})
}
