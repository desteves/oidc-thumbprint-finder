# oidc-thumbprint-finder

Dockerfile that takes in an OIDC IdP URL to obtain it's thumbprint (SHA1 hash of the public certificate)

Provide the OIDC IdP URL as a CMD, it uses GitHub's popular OIDC as an example
You *MUST* include HTTP header
Yout *MUST* exclude the training slash

Build
```bash
docker build --platform linux/amd64 . -t tmp  
```

Run Example 
```bash
OIDC_IDP_URL=https://token.actions.githubusercontent.com
docker run nullstring/oidc-thumbprint-finder $OIDC_IDP_URL
```