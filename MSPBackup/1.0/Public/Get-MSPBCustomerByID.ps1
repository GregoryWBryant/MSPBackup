function Get-MSPBCustomerByID {
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
        'method' = 'GetPartnerInfoById'
        'visa' = $Visa
        'params' = @{
            'partnerId' = $PartnerID
        }
    }
    $return = (Invoke-RestMethod -Uri $URI -Body ($body | ConvertTo-Json) -ContentType 'application/json' -Method Post).result.result
    return $return
}