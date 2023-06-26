import jwt
encoded_jwt = jwt.encode({'credentials':'[default]\naws_access_key = ASIIAMFAKENOPZLX6J5L\naws_secret_access_key = w0pE4j5k4FlUrkIIAMFAKEdiLMKLGZlxyct+GpTam\naws_session_token = FQoGZXIvYXdzEDwaIIAMFAKEn0LVImWNQHiLuAWKe+KFkLeIvpOHEruWjyCjrEdyjtW8WCbnmJGM1ES20xq1fcaS5TERHDUabZJ60Kk6nc9uHoCDb1QKHi+MerRIcKJTi3OKz0QMVPAGVqVWgvOBBSQ2lylLVjtMMSQF+yLZsP1bvehQ0ke/Bl/X6RJySOHg2TZGyESPL/INqJiZyEHi+MelAnThepVgWUKFPD5mESBVlpy2LVCE3xPpHFqOm0Q79svRSSW2jLj5NkRXL+xhkcvt+g8vNt1ODEwixwMGpFB2sBHryv6EXNeX6c88vxJ8Zyfkmsqi0xmCW1f9jWAPIXNkt/nEYW4J4coyLKP7QU='}, "123sairam4$#", algorithm="HS256")
print(encoded_jwt)
decrypt_jwt=jwt.decode(encoded_jwt, "123sairam4$#", algorithms=["HS256"])
print(decrypt_jwt)