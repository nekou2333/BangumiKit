//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct Page: Codable, Hashable {
    public var limit: Int
    public var offset: Int
    public var total: Int

    public init(limit: Int, offset: Int, total: Int) {
        self.limit = limit
        self.offset = offset
        self.total = total
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.limit = try values.decode(Int.self, forKey: "limit")
        self.offset = try values.decode(Int.self, forKey: "offset")
        self.total = try values.decode(Int.self, forKey: "total")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(limit, forKey: "limit")
        try values.encode(offset, forKey: "offset")
        try values.encode(total, forKey: "total")
    }
}
