//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct Stat: Codable, Hashable {
    public var collects: Int
    public var comments: Int

    public init(collects: Int, comments: Int) {
        self.collects = collects
        self.comments = comments
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.collects = try values.decode(Int.self, forKey: "collects")
        self.comments = try values.decode(Int.self, forKey: "comments")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(collects, forKey: "collects")
        try values.encode(comments, forKey: "comments")
    }
}
