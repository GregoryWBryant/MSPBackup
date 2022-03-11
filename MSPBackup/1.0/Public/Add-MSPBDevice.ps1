function Add-MSPBDevice {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Visa,
        [Parameter()]
        [string]
        $DeviceName,
        [Parameter()]
        [int]
        $PartnerID,
        [Parameter()]
        [int]
        $ProductID,
        [Parameter()]
        [int]
        $StorageID,
        [Parameter()]
        [int]
        $LocationID
    )
    $URI = 'https://api.backup.management/jsonapi'
    $body = @{
        'id' = '1'
        'jsonrpc' = '2.0'
        'method' = 'AddAccount'
        'visa' = $Visa
        'params' = @{
            'PartnerId' = $PartnerID
            'Name' = $DeviceName
            "ProductId" = $ProductID
            "StorageId" = $StorageID
            "LocationId" = $LocationID
        }
    }
    $return = (Invoke-RestMethod -Uri $URI -Body ($body | ConvertTo-Json) -ContentType 'application/json' -Method Post).result.result
    return $return
}