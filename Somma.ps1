param ([Parameter(Mandatory=$true)][string]$string)
$sum = 0
$string | Select-String -AllMatches -Pattern ' *((\d+\.{1}\d+)|(\d+)) *' | ForEach-Object -MemberName Matches | ForEach-Object { $sum += $_.Groups[0].Value }
$sum