function Get-GlobalConfig() { 
    [cmdletbinding()]
    param ( 

    )

    if($Global:sqlshell){ 
        return $Global:sqlshell 
    } else { 
        Write-Message -Message 'Reloading Global Config' -Level 'Host'
        Invoke-SqGlobalConfig 

        return $Global:sqlshell 
    }     
}