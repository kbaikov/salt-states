Import-Module PSReadLine

# Install-Module -Name Terminal-Icons
Import-Module -Name Terminal-Icons

Set-PSReadLineOption -Colors @{
    "Type" = [ConsoleColor]::Magenta;
    "Variable" = [ConsoleColor]::Magenta
}

# Install-Module PSReadline -RequiredVersion 2.2.0-beta3 -AllowPrerelease
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

function Create-Venv {
    python -m venv .venv
    echo * > .venv/.gitignore
    .venv/Scripts/activate
    python -m pip install --upgrade pip wheel setuptools
}

Set-Alias -Name venv -Value Create-Venv -Description "Creates a virtual environment and upgrades pip"

function Pip-Install-Requirements {
    python -m pip install --upgrade pip wheel setuptools
    python -m pip install -r requirements.txt
}

Set-Alias -Name pir -Value Pip-Install-Requirements -Description "Upgrades pip and installs requrements"


Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

Invoke-Expression (&starship init powershell)
