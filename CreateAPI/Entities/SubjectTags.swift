//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Tag
public struct SubjectTag: Codable, Hashable {
    public var count: Int
    public var name: String

    public init(count: Int, name: String) {
        self.count = count
        self.name = name
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.count = try values.decode(Int.self, forKey: "count")
        self.name = try values.decode(String.self, forKey: "name")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(count, forKey: "count")
        try values.encode(name, forKey: "name")
    }
}
