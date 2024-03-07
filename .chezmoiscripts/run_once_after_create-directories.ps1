Set-StrictMode -Version 3.0
$ErrorActionPreference = "Stop"

$path = "$env:USERPROFILE\workspace"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}
