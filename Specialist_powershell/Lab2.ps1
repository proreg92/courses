# Для заданной папки создать в каждой из ее подпапок вложенную папку с названием "Специалист"

#[string]$FRoot = "C:\"
#$Dir = Dir $FRoot -Directory
#ForEach ($F in $Dir)
   # {
    #New-Item -Name "Специалист" -ItemType Directory -Path $F.FullName
    #}


########################################################################

Param(
[string]$FRoot = "C:\",
[string]$FNew = "Специалист"
)


$Dir = Dir $FRoot -Directory
ForEach ($F in $Dir)
    {
    New-Item -Name $FNew -ItemType Directory -Path $F.FullName
    }
    
#################################################################################  

Param(
[string]$FRoot = "C:\",
[string]$FNew = "Специалист3"
)

Dir $FRoot -Directory | GM -MemberType Method 

Dir $FRoot -Directory | ForEach-Object CreateSubdirectory $Fnew

$Froot.GetType()