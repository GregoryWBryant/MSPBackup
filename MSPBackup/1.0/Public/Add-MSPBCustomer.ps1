function Add-MSPBCustomer {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Visa,
        [Parameter()]
        [int]
        $ParentId,
        [Parameter()]
        [string]
        $ServiceType,
        [Parameter()]
        [string]
        $Level,
        [Parameter()]
        [string]
        $CustomerName,
        [Parameter()]
        [string]
        $Country,
        [Parameter()]
        [string]
        $ChildServiceTypes
    )
    $URI = 'https://api.backup.management/jsonapi'
    $body = @{
        'id' = '1'
        'jsonrpc' = '2.0'
        'method' = 'AddPartner'
        'visa' = $Visa
        'params' = @{
            'ParentId' = $ParentId
            "Level" = $Level
            "ServiceType" = $ServiceType
            "Name" = $CustomerName
            "Country" = $Country
            "ChildServiceTypes" = ChildServiceTypes
        }
    }
    Invoke-RestMethod -Uri $URI -Body ($body | ConvertTo-Json) -ContentType 'application/json' -Method Post
}