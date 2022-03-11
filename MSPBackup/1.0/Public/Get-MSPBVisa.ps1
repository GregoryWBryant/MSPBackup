function Get-MSPBVisa {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Partner,
        [Parameter()]
        [string]
        $Username,
        [Parameter()]
        [string]
        $Password
    )
    $URI = 'https://api.backup.management/jsonapi'
    $body = @{
        'id' = '1'
        'jsonrpc' = '2.0'
        'method' = 'Login'
        'params' = @{
            'partner' = $Partner
            'username' = $Username
            'password' = $Password
        }
    }
    $return = (Invoke-RestMethod -Uri $URI -Body ($body | ConvertTo-Json) -ContentType 'application/json' -Method Post).visa
    return $return
}