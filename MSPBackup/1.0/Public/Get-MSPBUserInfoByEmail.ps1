function Get-MSPBUserInfoByEmail {
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
        $EmailAddress
    )
    $URI = 'https://api.backup.management/jsonapi'
    $body = @{
        'id' = '1'
        'jsonrpc' = '2.0'
        'method' = 'GetUserInfo'
        'visa' = $Visa
        'params' = @{
            'partnerIds' = $PartnerID
            'nameOrEmail' = $EmailAddress
        }
    }
    return (Invoke-RestMethod -Uri $URI -Body ($body | ConvertTo-Json) -ContentType 'application/json' -Method Post).result.result
}