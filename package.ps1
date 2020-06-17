$template = ".\GeneXus.DeploymentTargets.nuspec.template"
$nuspec = ".\GeneXus.DeploymentTargets.nuspec"

$Timestamp = (Get-Date).ToString("yyyyMMddHHmmss")

$xml = Get-Content $template -Raw
$xml = $xml -replace "trunk.\*","trunk.$Timestamp"

Set-Content $nuspec $xml


nuget pack .\GeneXus.DeploymentTargets.nuspec 