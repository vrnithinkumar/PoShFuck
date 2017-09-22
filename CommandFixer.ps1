$Letters = 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
function Deletes ($command) 
{
   $len = $command.Length-1
   $deleted = @()
   foreach($i in 0..$len)
   {
    $oneDeleted = $command.Remove($i,1)
    $deleted += $oneDeleted
   }
   return $deleted
}
function Inserts($command) 
{
   $len = $command.Length
   $insertions = @()
   foreach($i in 0..$len)
   {
       foreach ($alph in $Letters)
       {
            $oneDeleted = $command.Insert($i, $alph)    
            $insertions += $oneDeleted
       }
   }
   return $insertions
}

function EditsOneLevel ($command) 
{
    return $Letters
}

# Unit tests
function Assert ($fail, $message) 
{
    if ($fail) 
    { 
        Write-Debug -Message $message 
        throw New-Object -TypeName 'System.Exception' -ArgumentList @($message) 
    }
    else 
    {
        Write-Host "Test Passed " -ForegroundColor Green
    } 
}

$x = EditsOneLevel "sdfsd"
$fail = -not ($x[5] -eq 'f') 
$message = "Edit First level" 
Assert $fail $message

$deletedCat = Deletes "cat"
$expected = ("at","ct","ca")
$fail = -not ($deletedCat[1] -eq $expected[1])
$message = "Deletes not working" 
Assert $fail $message

$insertedCats = Inserts "cat"
$expected = ("at","ct","ca")
#$fail = -not ($deletedCat[1] -eq $expected[1])
#$message = "insertions not working" 
#Assert $fail $message
Write-Host $insertedCats