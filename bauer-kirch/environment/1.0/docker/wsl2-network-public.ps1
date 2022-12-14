# WSL2 network port forwarding script that exposes the app to 0.0.0.0
# (based on https://gist.github.com/daehahn/497fa04c0156b1a762c70ff3f9f7edae)

# If elevation needed, start new process
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
  # Relaunch as an elevated process:
  Start-Process powershell.exe "-File",('"{0}"' -f $MyInvocation.MyCommand.Path),"$Args runas" -Verb RunAs
  exit
}

# You should modify '$Ports' for your applications
$Ports = (6443)

# Check WSL ip address
wsl hostname -I | Set-Variable -Name "WSL"
$WSL = $WSL.split(" ")[0];
$found = $WSL -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';
if (-not $found) {
  echo "WSL2 cannot be found. Terminate script.";
  exit;
}

# Add each port into portproxy
$Addr = "0.0.0.0"
Foreach ($Port in $Ports) {
    netsh interface portproxy delete v4tov4 listenaddress=$Addr listenport=$Port | Out-Null
    if ($Args[0] -ne "delete") {
        netsh interface portproxy add v4tov4 listenaddress=$Addr listenport=$Port connectaddress=$WSL connectport=$Port | Out-Null
    }
}

# Display all portproxy information
echo "Active portproxy rules:"
netsh interface portproxy show v4tov4;

# Give user to chance to see above list when relaunched start
If ($Args[0] -eq "runas" -Or $Args[1] -eq "runas") {
  Write-Host -NoNewLine 'Press any key to close! ';
  $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
}