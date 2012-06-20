if($args.Length -eq 2)
{
    [System.Diagnostics.EventLog]::CreateEventSource($args[0], $args[1])
}
else
{
    $ScriptName = $MyInvocation.MyCommand.Name
    Write-Host "`r`nThis script requires 2 parameters."
    Write-Host "$ScriptName SOURCE_NAME LOG_NAME"
    Write-Host "`r`nExample"
    Write-Host "================================================="
    Write-Host "$ScriptName `"Enterprise Library Logging`" `"Application`"`r`n"
}