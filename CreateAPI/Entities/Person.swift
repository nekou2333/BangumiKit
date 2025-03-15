//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct Person: Codable, Hashable, Identifiable {
    public var career: [PersonCareer]
    public var id: Int
    /// Object with some size of images, this object maybe `null`
    public var images: PersonImages?
    /// Locked
    public var isLocked: Bool
    public var name: String
    public var shortSummary: String
    /// `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
    public var type: Int

    public init(career: [PersonCareer], id: Int, images: PersonImages? = nil, isLocked: Bool, name: String, shortSummary: String, type: Int) {
        self.career = career
        self.id = id
        self.images = images
        self.isLocked = isLocked
        self.name = name
        self.shortSummary = shortSummary
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.career = try values.decode([PersonCareer].self, forKey: "career")
        self.id = try values.decode(Int.self, forKey: "id")
        self.images = try values.decodeIfPresent(PersonImages.self, forKey: "images")
        self.isLocked = try values.decode(Bool.self, forKey: "locked")
        self.name = try values.decode(String.self, forKey: "name")
        self.shortSummary = try values.decode(String.self, forKey: "short_summary")
        self.type = try values.decode(Int.self, forKey: "type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(career, forKey: "career")
        try values.encode(id, forKey: "id")
        try values.encodeIfPresent(images, forKey: "images")
        try values.encode(isLocked, forKey: "locked")
        try values.encode(name, forKey: "name")
        try values.encode(shortSummary, forKey: "short_summary")
        try values.encode(type, forKey: "type")
    }
}
