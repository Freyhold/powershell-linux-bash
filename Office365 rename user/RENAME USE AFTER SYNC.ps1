$username = "officelogin"
$password = "officepwd"

$secureStringPwd = $password | ConvertTo-SecureString -AsPlainText -Force 
$UserCredential = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $secureStringPwd


Connect-MsolService -Credential $UserCredential

Get-PSSession | Remove-PSSession
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic –AllowRedirection
Import-PSSession $Session



set-msoluserprincipalname -newuserprincipalname new.name@domian.com -userprincipalname adlogonname@domianHQ.onmicrosoft.com
