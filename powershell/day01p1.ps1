# Get the input data
$InputData = Get-Content "$PSScriptRoot\inputs\input.txt"

# In a pipeline, calculate the required sum
$InputData | ForEach-Object {
    # Remove all non-digit characters
    $Digits = $_ -replace '[^0-9]'

    # Take the first and last digit, combine them, convert to an integer and
    # Pass this down the pipeline.
    "$($Digits[0])$($Digits[-1])" -as [int64]

} | Measure-Object -Sum | Select-Object -ExpandProperty Sum
