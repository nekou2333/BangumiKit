//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ErrorDetail: Codable, Hashable {
    public var description: String
    /// Detail
    public var details: Details?
    public var title: String

    /// Detail
    public enum Details: Codable, Hashable {
        case string(String)
        case object(Object)

        public struct Object: Codable, Hashable {
            /// Error message
            public var error: String?
            /// Request path
            public var path: String?

            public init(error: String? = nil, path: String? = nil) {
                self.error = error
                self.path = path
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.error = try values.decodeIfPresent(String.self, forKey: "error")
                self.path = try values.decodeIfPresent(String.self, forKey: "path")
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(error, forKey: "error")
                try values.encodeIfPresent(path, forKey: "path")
            }
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(String.self) {
                self = .string(value)
            } else if let value = try? container.decode(Object.self) {
                self = .object(value)
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Data could not be decoded as any of the expected types (String, Object)."
                )
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let value): try container.encode(value)
            case .object(let value): try container.encode(value)
            }
        }
    }

    public init(description: String, details: Details? = nil, title: String) {
        self.description = description
        self.details = details
        self.title = title
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.description = try values.decode(String.self, forKey: "description")
        self.details = try values.decodeIfPresent(Details.self, forKey: "details")
        self.title = try values.decode(String.self, forKey: "title")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(description, forKey: "description")
        try values.encodeIfPresent(details, forKey: "details")
        try values.encode(title, forKey: "title")
    }
}
