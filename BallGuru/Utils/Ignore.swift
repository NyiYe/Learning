//
//  Ignore.swift
//  BallGuru
//
//  Created by Barry on 08/09/2023.
//

import Foundation

@propertyWrapper
struct Ignore<T> {
    var wrappedValue: T
}

extension Ignore: Encodable where T: Encodable { }
extension Ignore: Decodable where T: Decodable { }

extension KeyedEncodingContainer {
    mutating func encode<T: Encodable>(_ value: Ignore<T>, forKey key: KeyedEncodingContainer<K>.Key) throws { }
}

extension KeyedDecodingContainer {
    func decode<T: Decodable>(_ type: Ignore<T?>.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Ignore<T?> {
        return try .init(wrappedValue: decodeIfPresent(T.self, forKey: key))
    }
}
