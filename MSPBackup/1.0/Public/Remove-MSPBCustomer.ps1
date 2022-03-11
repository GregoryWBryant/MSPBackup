function Remove-MSPBDevicesByID {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Visa,
        [Parameter()]
        [string]
        $AccountID
    )
    $URI = 'https://api.backup.management/jsonapi'
    $body = @{
        'id' = '1'
        'jsonrpc' = '2.0'
        'method' = 'RemoveAccount'
        'visa' = $Visa
        'params' = @{
            'accountId' = $AccountID
        }
    }
    return (Invoke-RestMethod -Uri $URI -Body ($body | ConvertTo-Json) -ContentType 'application/json' -Method Post).result.result
}