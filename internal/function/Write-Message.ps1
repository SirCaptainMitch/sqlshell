function Write-Message() { 
    [cmdletbinding()]
    param( 
        [parameter(Mandatory=$true)]
        $message,
        [parameter(Mandatory=$true)]
        [string]$level , 
        [switch]
    )

    begin { 
        if( $message -is [string]) { 
            $IsString = $true 
        } elif ($message -is [pscustomobject]) { 
            $IsString = $false 
        } else { 
            Write-Error -Message "The message parameter must be a string or object."
        }
    }

    process { 
        switch ( $level ) { 
            'Host' {  Write-Host $message   } 
            'Output' { Write-Output $message } 
            'Warning' { Write-Warning $message }
        }
    }

}
