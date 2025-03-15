//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Item
public struct WikiV0Item: Codable, Hashable {
    public var key: String
    public var value: Value

    public struct Value: Codable, Hashable {
        public var string: String?
        public var placeholderItems: [PlaceholderItem]?

        public struct PlaceholderItem: Codable, Hashable {
            /// KV
            public var a: A?
            /// V
            public var b: B?

            /// KV
            public struct A: Codable, Hashable {
                public var k: String
                public var v: String

                public init(k: String, v: String) {
                    self.k = k
                    self.v = v
                }

                public init(from decoder: Decoder) throws {
                    let values = try decoder.container(keyedBy: StringCodingKey.self)
                    self.k = try values.decode(String.self, forKey: "k")
                    self.v = try values.decode(String.self, forKey: "v")
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(k, forKey: "k")
                    try values.encode(v, forKey: "v")
                }
            }

            /// V
            public struct B: Codable, Hashable {
                public var v: String

                public init(v: String) {
                    self.v = v
                }

                public init(from decoder: Decoder) throws {
                    let values = try decoder.container(keyedBy: StringCodingKey.self)
                    self.v = try values.decode(String.self, forKey: "v")
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(v, forKey: "v")
                }
            }

            public init(a: A? = nil, b: B? = nil) {
                self.a = a
                self.b = b
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                self.a = try? container.decode(A.self)
                self.b = try? container.decode(B.self)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer()
                if let value = a { try container.encode(value) }
                if let value = b { try container.encode(value) }
            }
        }

        public init(string: String? = nil, placeholderItems: [PlaceholderItem]? = nil) {
            self.string = string
            self.placeholderItems = placeholderItems
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            self.string = try? container.decode(String.self)
            self.placeholderItems = try? container.decode([PlaceholderItem].self)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            if let value = string { try container.encode(value) }
            if let value = placeholderItems { try container.encode(value) }
        }
    }

    public init(key: String, value: Value) {
        self.key = key
        self.value = value
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.key = try values.decode(String.self, forKey: "key")
        self.value = try values.decode(Value.self, forKey: "value")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(key, forKey: "key")
        try values.encode(value, forKey: "value")
    }
}
