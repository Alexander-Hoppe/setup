Import-Module PSReadLine
Set-PSReadLineOption -EditMode vi

function fzfp()
{
    fzf --preview 'type {}'
}

function fzfo()
{
    Invoke-Fzf -Preview 'type {}' | % { start $_ }
}

function grepr([string]$searchstr)
{
    dir -Recurse | Select-String -pattern $searchstr
}
