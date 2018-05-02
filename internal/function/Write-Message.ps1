function Write-Message() { 
    [cmdletbinding()]
    param( 
        [parameter(Mandatory=$true)]
        $message,
        [parameter(Mandatory=$true)]
        [string]$level
    )

    begin { 
    }

    process { 
        switch ( $level ) { 
            'Host' {  Write-Host $message   } 
            'Output' { Write-Output $message } 
            'Warning' { Write-Warning $message }
            'Verbose' { Write-Verbose $message }
        }
    }

}
