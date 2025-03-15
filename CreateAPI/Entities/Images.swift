//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct Images: Codable, Hashable {
    public var common: String
    public var grid: String
    public var large: String
    public var medium: String
    public var small: String

    public init(common: String, grid: String, large: String, medium: String, small: String) {
        self.common = common
        self.grid = grid
        self.large = large
        self.medium = medium
        self.small = small
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.common = try values.decode(String.self, forKey: "common")
        self.grid = try values.decode(String.self, forKey: "grid")
        self.large = try values.decode(String.self, forKey: "large")
        self.medium = try values.decode(String.self, forKey: "medium")
        self.small = try values.decode(String.self, forKey: "small")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(common, forKey: "common")
        try values.encode(grid, forKey: "grid")
        try values.encode(large, forKey: "large")
        try values.encode(medium, forKey: "medium")
        try values.encode(small, forKey: "small")
    }
}
