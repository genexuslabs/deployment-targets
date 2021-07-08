if ([System.Convert]::ToBoolean($Env:IsPrerelease)) {
  $IsMaster = $Env:GIT_REF -match 'master$'
  $VersionTag =  @("trunk", "stable")[$IsMaster]
  $Timestamp = (Get-Date).ToString("yyyyMMddHHmmss")
  $VersionSuffix = "-" + $VersionTag + "." + $Timestamp
}

$GetFileVersionOutput = dotnet msbuild $PSScriptRoot/../Directory.Build.props /t:GetFileVersionForPackage /p:VersionSuffix="$VersionSuffix"
"$GetFileVersionOutput" -match "(?<=FileVersion:)(.*)" > $null
$GetFileVersionOutput = $Matches[0]

return $NuGetPackageVersion