import Foundation
@testable import Issuer
import Testing

struct CredentialConfigurationTests {
    @Test
    func libraryCard() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]

        let data = try encoder.encode(CredentialConfiguration.libraryCard)
        #expect(String(data: data, encoding: .utf8) == """
        {
          "claims" : {
            "family_name" : {

            },
            "given_name" : {

            },
            "is_over_18" : {

            },
            "is_over_65" : {

            }
          },
          "credential_signing_alg_values_supported" : [
            "ES256"
          ],
          "cryptographic_binding_methods_supported" : [
            "jwk"
          ],
          "format" : "vc+sd-jwt",
          "proof_types_supported" : {
            "jwt" : {
              "proof_signing_alg_values_supported" : [
                "ES256"
              ]
            }
          },
          "scope" : "library.catalogue.read",
          "vct" : "vc+sd-jwt-library-card-sample-implementation"
        }
        """)
    }
}
/*
 {
   "credential_configurations_supported": {
     "SD_JWT_VC_example_in_OpenID4VCI": {
       "format": "vc+sd-jwt",
       "scope": "SD_JWT_VC_example_in_OpenID4VCI",
       "cryptographic_binding_methods_supported": [
         "jwk"
       ],
       "credential_signing_alg_values_supported": [
         "ES256"
       ],
       "display": [
         {
           "name": "IdentityCredential",
           "logo": {
                     "uri": "https://university.example.edu/public/logo.png",
                     "alt_text": "a square logo of a university"
           },
           "locale": "en-US",
           "background_color": "#12107c",
           "text_color": "#FFFFFF"
         }
       ],
       "proof_types_supported": {
         "jwt": {
           "proof_signing_alg_values_supported": [
             "ES256"
           ]
         }
       },
       "vct": "SD_JWT_VC_example_in_OpenID4VCI",
       "claims": {
         "given_name": {
           "display": [
             {
               "name": "Given Name",
               "locale": "en-US"
             },
             {
               "name": "Vorname",
               "locale": "de-DE"
             }
           ]
         },
         "family_name": {
           "display": [
             {
               "name": "Surname",
               "locale": "en-US"
             },
             {
               "name": "Nachname",
               "locale": "de-DE"
             }
           ]
         },
         "email": {},
         "phone_number": {},
         "address": {
           "street_address": {},
           "locality": {},
           "region": {},
           "country": {}
         },
         "birthdate": {},
         "is_over_18": {},
         "is_over_21": {},
         "is_over_65": {}
       }
     }
   }
 }
 */
