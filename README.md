# Credential Issuer

This Vapor project partially implements the OpenID for Verifiable Credential Issuance specification:
https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0.html#name-credential-issuer

This includes:
- the mandatory Credential Endpoint from which Credentials can be issued


## Credential Issuance Flows

### Authorization

Authorization Code Flow or Pre-Authorized Code Flow: The Credential Issuer can obtain End-User information to turn into a Verifiable Credential using End-User authentication and consent at the Credential Issuer's Authorization Endpoint (Authorization Code Flow) or using out-of-band mechanisms outside of the issuance flow (Pre-Authorized Code Flow).

### Initiator

Wallet initiated or Issuer initiated: The request from the Wallet can be sent to the Credential Issuer without any gesture from the Credential Issuer (Wallet Initiated) or following the communication from the Credential Issuer (Issuer Initiated).

### Devices

Same-device or Cross-device Credential Offer: The End-User may receive the Credential Offer from the Credential Issuer either on the same device as the device the Wallet resides on, or through any other means, such as another device or postal mail, so that the Credential Offer can be communicated to the Wallet.

### Timing

Immediate or Deferred: The Credential Issuer can issue the Credential directly in response to the Credential Request (immediate) or requires time and needs the Wallet to come back to retrieve Credential (deferred).


> Note: while the format for credentials is not specified in the OpenID specification, this implementation uses Selective Disclosure (SD) JSON Web Tokens (JWTs) as defined in the separate W3C specification: [Securing Verifiable Credentials using JOSE and COSE](https://www.w3.org/TR/vc-jose-cose/).
