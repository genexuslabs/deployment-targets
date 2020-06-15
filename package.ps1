$nuspec = ".\GeneXus.DeploymentTargets.nuspec"

$Timestamp = (Get-Date).ToString("yyyyMMddHHmmss")

$xml = Get-Content $nuspec -Raw
$xml = $xml -replace "trunk-\*","trunk-$Timestamp"

Set-Content $nuspec $xml


nuget pack .\GeneXus.DeploymentTargets.nuspec 