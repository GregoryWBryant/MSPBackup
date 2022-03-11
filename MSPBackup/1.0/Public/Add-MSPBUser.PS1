function Add-MSPBUser {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Visa,
        [Parameter()]
        [array]
        $PartnerID,
        [Parameter()]
        [string]
        $EmailAddress,
        [Parameter()]
        [string]
        $FirstName,
        [Parameter()]
        [string]
        $SurName
    )
    $URI = 'https://api.backup.management/jsonapi'
    $body = @{
        'id' = '1'
        'jsonrpc' = '2.0'
        'method' = 'AddUser'
        'visa' = $Visa
        'params' = @{
            'name' = $EmailAddress
            'PartnerId' = $PartnerID
            'RoleId' = $RoleID
            'EmailAddress' = $EmailAddress
            'FirstName' = $FirstName
            'FullName' = $SurName

        }
    }
    return (Invoke-RestMethod -Uri $URI -Body ($body | ConvertTo-Json) -ContentType 'application/json' -Method Post).result.result
}