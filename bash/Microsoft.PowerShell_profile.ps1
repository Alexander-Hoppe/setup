function fzfp()
{
    fzf --preview 'type {}'
}

function fzfo()
{
    Invoke-Fzf -Preview 'type {}' | % { start $_ }
}
