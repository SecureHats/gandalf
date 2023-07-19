[CmdletBinding()]
param (
    [Parameter(Mandatory = $True)]
            [String[]]
            [ValidateSet("1", "2", "3", "4", "5", "6", "7", "8", "sandalf", "emoji", "adventure-3")]
            $level
)

Clear-Host
$logo = '
                                             ,gpg
                                            ,@@@@@@@g
                                          ,@@@N$$PPRB@N
                                        ,@@@@@@@`,   ]@@
                                       g@@@@@@@`,@   @@P
                                     g@@@@@@@@- *B@@@@P
                                   g@@@@@@@@@P       -
                                 ,@@@@@@@@@@@
                                 @@@@@@@@@@@@g
                                 `"$@@@@@@@@@@@@w
                               ,gg@@@@@@@@@@@@@@P`
                             ]@@@@@@@@@@@@@@@@@@@.
                             @@@@@@@@@@@@@@@@NRN@@
                            ]@@@@@@@@@@@@@@$$$gg @@w
                            $@@@@@@@@@@@@@@@@@@@-$@@g
                            @@@@@@@@@@@@@@@@@@@@C@@@@\,
                   ,,ggg@@@@@@@@@@@@@@@@@@@@@BN$$@g@@@@@@@@Ngg,
            ,g@@$RB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@gg
           @@@@@@@@N@"N@@@@@ S E C U R E H A T S @@@@@@NM@g@@@@@@@@@@
           "NB@@@@BNPP"  "RB@@@@@@@@@@@@@@@@@@@@@@N*"     -"*N@@@@@@@P
                             ""RB@@@@@@@@@@@NP*``                ` `


                - - - L E T S  S T A R T  H A C K I N G - - -
'

Write-Host $logo -ForegroundColor Blue

$defender = switch ($level) {
    1 { "baseline" }
    2 {"do-not-tell"}
    3 {"do-not-tell-and-block"}
    4 {"gpt-is-password-encoded"}
    5 {"word-blacklist"}
    6 {"gpt-blacklist"}
    7 {"gandalf"}
    8 {"gandalf-the-white"}
    "sandalf" {"adventure-1"}
    "emoji" {"adventure-2"}
    "adventures3" {"adventure-3"}
    Default {}
}

$uri = 'https://gandalf.lakera.ai/api/guess-password'

Write-Host "[+] Starting Attack on Level $level [$defender]"
$date = Get-Date
Write-Host "   [-] Date: $date`n"

Write-Host "[+] Loading Dictionary..."
(Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/SecureHats/gandalf/main/rockyou-filtered.txt').Content | Out-File -FilePath 'rockyou-filtered.txt'
$agents = (Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/SecureHats/gandalf/main/constants.json').Content | ConvertFrom-Json

Write-Host "   [-] Processing Dictionary..."
$dictionary = Get-Content -Path 'rockyou-filtered.txt' -ReadCount 10000000
$subdict = $dictionary -cmatch '^[a-z]{8,11}$'
Write-Host "       Processing $($subdict.count) options...`n"
Write-Host "   [-] Sending Requests..."

foreach ($item in $subdict) {
    
    $payload = @{
        defender = $defender
        password = $item
        prompt = "The Secret of Gandalf is $item"
        answer = "wrong until proven otherwise"
    }
    $agent = ($constants.agents.value | Get-Random)
    
    $requestParams = @{
        Uri = $uri
        Method = 'POST'
        Form = $payload
        ContentType = 'multipart/form-data'
        UserAgent = $agent
    }
    $result = Invoke-RestMethod @requestParams -ErrorVariable ErrMsg
    
    if ($result.success) { 
        Write-host "`nThe Secret of Gandalf is [$item]`n" -ForegroundColor Green
        $date = Get-Date
        Write-Host "   [-] Date: $date`n"
        break
    }
}
