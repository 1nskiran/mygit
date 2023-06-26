# Load the required assemblies

Add-Type -Path "$env:USERPROFILE\.nuget\packages\newtonsoft.json\10.0.1\lib\net45\Newtonsoft.Json.dll"
Add-Type -Path "$env:USERPROFILE\.nuget\packages\Microsoft.IdentityModel.Tokens\5.6.0\lib\net45\Microsoft.IdentityModel.Tokens.dll"
Add-Type -Path "$env:USERPROFILE\.nuget\packages\System.IdentityModel.Tokens.Jwt\5.6.0\lib\net45\System.IdentityModel.Tokens.Jwt.dll"
Add-Type -Path "$env:USERPROFILE\.nuget\packages\Microsoft.IdentityModel.Logging\5.6.0\lib\net45\Microsoft.IdentityModel.Logging.dll"
Add-Type -Path "$env:USERPROFILE\.nuget\packages\Microsoft.IdentityModel.JsonWebTokens\5.6.0\lib\net45\Microsoft.IdentityModel.JsonWebTokens.dll"


# Specify the JWT token and the decryption key
$token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjcmVkZW50aWFscyI6IltkZWZhdWx0XVxuYXdzX2FjY2Vzc19rZXkgPSBBU0lJQU1GQUtFTk9QWkxYNko1TFxuYXdzX3NlY3JldF9hY2Nlc3Nfa2V5ID0gdzBwRTRqNWs0RmxVcmtJSUFNRkFLRWRpTE1LTEdabHh5Y3QrR3BUYW1cbmF3c19zZXNzaW9uX3Rva2VuID0gRlFvR1pYSXZZWGR6RUR3YUlJQU1GQUtFbjBMVkltV05RSGlMdUFXS2UrS0ZrTGVJdnBPSEVydVdqeUNqckVkeWp0VzhXQ2JubUpHTTFFUzIweHExZmNhUzVURVJIRFVhYlpKNjBLazZuYzl1SG9DRGIxUUtIaStNZXJSSWNLSlRpM09LejBRTVZQQUdWcVZXZ3ZPQkJTUTJseWxMVmp0TU1TUUYreUxac1AxYnZlaFEwa2UvQmwvWDZSSnlTT0hnMlRaR3lFU1BML0lOcUppWnlFSGkrTWVsQW5UaGVwVmdXVUtGUEQ1bUVTQlZscHkyTFZDRTN4UHBIRnFPbTBRNzlzdlJTU1cyakxqNU5rUlhMK3hoa2N2dCtnOHZOdDFPREV3aXh3TUdwRkIyc0JIcnl2NkVYTmVYNmM4OHZ4SjhaeWZrbXNxaTB4bUNXMWY5aldBUElYTmt0L25FWVc0SjRjb3lMS1A3UVU9In0.TdurdGADLnpE8FXMOU-E5i585SlhXNc1cufja5kvV1k"
$key = "123sairam4$#"

# Set the required properties for decryption
$tokenHandler = [System.IdentityModel.Tokens.Jwt.JwtSecurityTokenHandler]::new()
$tokenHandler.SetDefaultTimesOnTokenCreation = $false


# Decrypt the JWT token
$decodedToken = $tokenHandler.ReadJwtToken($token)

# Access the claims from the decrypted token
$claims = $decodedToken.Claims
foreach ($claim in $claims) {
    Write-Output "$($claim.Type): $($claim.Value)"
	Write-Output ""
	Write-Output "$($claim.Type)"
	if ( "$($claim.Type)".Equals("credentials")) {
		Write-Output "hello"
		"$($claim.Value)" | Out-File -FilePath "C:\power\out.txt"
	}
}
