function Invoke-GlobalConfig() { 
    [cmdletbinding()]
    param(
        [string]$ConfigPath,
        [switch]$reload
    )

    begin { 
        if(!$ConfigPath) { 
            $ModuleRoot = $($(Get-Item -Path $(Get-Module -Name 'sqlshell').Path).Directory).FullName

            $ConfigPath = Join-Path -Path $ModuleRoot -ChildPath '\config\sqlshellconfig.json'

        } elseif (!$(Test-path $ConfigPath)) { 
            $error = "The Config Path: {0} is not valid" -f $ConfigPath
            Write-Host $error 
            continue 
            
        }
    }

    process { 
        [pscustomobject]$ConfigObject = Get-Content -Raw -Path $ConfigPath | ConvertFrom-Json 

        $global:sqlshell = $ConfigObject | Select-Object -First 1
        $defaultLogPath = Join-Path -Path $ModuleRoot -ChildPath $ConfigObject.DefaultLogLocation

        $global:sqlshell.DefaultLogLocation = $defaultLogPath 

    }
}