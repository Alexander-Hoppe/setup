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
