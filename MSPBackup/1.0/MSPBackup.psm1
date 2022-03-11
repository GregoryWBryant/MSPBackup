# Export nothing to clear implicit exports
Export-ModuleMember

# Export script cmdlets
$public  = @(Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue)
$private = @(Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue)

foreach ($import in @($public + $Private)) {
    try {
        $fullName = $import.fullName
        . $fullName -ErrorAction Stop
    }
    catch {
        Write-Error -Message "Failed to import function ${fullName}: ${_}" -ErrorAction Continue
    }
}

Export-ModuleMember -Function $public.baseName