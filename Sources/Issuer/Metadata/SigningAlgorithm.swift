//
//  SigningAlgorithm.swift
//  CredentialIssuer
//
//  Created by Oliver Binns on 20/10/2024.
//


enum SigningAlgorithm: String, Encodable {
    /// Elliptic Curve Digital Signature Algorithm with the P-256 curve and the SHA-256 hash function
    case es256 = "ES256"
}