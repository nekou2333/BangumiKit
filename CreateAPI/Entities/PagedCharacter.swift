//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Paged[Character]
public struct PagedCharacter: Codable, Hashable {
    public var data: [Character]?
    public var limit: Int?
    public var offset: Int?
    public var total: Int?

    public init(data: [Character]? = nil, limit: Int? = nil, offset: Int? = nil, total: Int? = nil) {
        self.data = data
        self.limit = limit
        self.offset = offset
        self.total = total
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.data = try values.decodeIfPresent([Character].self, forKey: "data")
        self.limit = try values.decodeIfPresent(Int.self, forKey: "limit")
        self.offset = try values.decodeIfPresent(Int.self, forKey: "offset")
        self.total = try values.decodeIfPresent(Int.self, forKey: "total")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(data, forKey: "data")
        try values.encodeIfPresent(limit, forKey: "limit")
        try values.encodeIfPresent(offset, forKey: "offset")
        try values.encodeIfPresent(total, forKey: "total")
    }
}
