function Get-MSPBDeviceByName{
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Visa,
        [Parameter()]
        [string]
        $Name,
        [Parameter()]
        [string]
        $Password
    )
    $URI = 'https://api.backup.management/jsonapi'
    $body = @{
        'id' = '1'
        'jsonrpc' = '2.0'
        'method' = 'GetAccountInfo'
        'visa' = $Visa
        'params' = @{
            'name' = $Name
            'password' = $Password
        }
    }
    $return = (Invoke-RestMethod -Uri $URI -Body ($body | ConvertTo-Json) -ContentType 'application/json' -Method Post).result.result
    return $retun
}