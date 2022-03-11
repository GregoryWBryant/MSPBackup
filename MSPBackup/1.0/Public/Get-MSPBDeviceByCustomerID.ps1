function Get-MSPBDeviceByCustomerID {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Visa,
        [Parameter()]
        [int]
        $PartnerID
    )
    $URI = 'https://api.backup.management/jsonapi'
    $body = @{
        'id' = '1'
        'jsonrpc' = '2.0'
        'method' = 'EnumerateAccounts'
        'visa' = $Visa
        'params' = @{
            'partnerID' = $PartnerID
        }
    }
    return = (Invoke-RestMethod -Uri $URI -Body ($body | ConvertTo-Json) -ContentType 'application/json' -Method Post).result.result
}
