# oidc-thumbprint-finder

Dockerfile that takes in an OIDC IdP URL to obtain its thumbprint (SHA1 hash of the public certificate)

Provide the OIDC IdP URL as a CMD; it uses GitHub's popular OIDC as a default example

* You MUST include the HTTP header
* You MUST exclude the trailing slash

Example (using default - GitHub's )
```bash
docker run --platform linux/amd64  nullstring/oidc-thumbprint-finder:latest                                       
1b511abead59c6ce207077c0bf0e0043b1382612
```

Example using a Specific IdP
```bash
docker run --platform linux/amd64  nullstring/oidc-thumbprint-finder:latest https://api.pulumi.com/oidc
9e99a48a9960b14926bb7f3b02e22da2b0ab7280
```
