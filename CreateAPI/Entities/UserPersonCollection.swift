//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct UserPersonCollection: Codable, Hashable, Identifiable {
    public var career: [PersonCareer]
    public var createdAt: Date
    public var id: Int
    /// Object with some size of images, this object maybe `null`
    public var images: PersonImages?
    public var name: String
    /// `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
    public var type: Int

    public init(career: [PersonCareer], createdAt: Date, id: Int, images: PersonImages? = nil, name: String, type: Int) {
        self.career = career
        self.createdAt = createdAt
        self.id = id
        self.images = images
        self.name = name
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.career = try values.decode([PersonCareer].self, forKey: "career")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.id = try values.decode(Int.self, forKey: "id")
        self.images = try values.decodeIfPresent(PersonImages.self, forKey: "images")
        self.name = try values.decode(String.self, forKey: "name")
        self.type = try values.decode(Int.self, forKey: "type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(career, forKey: "career")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(id, forKey: "id")
        try values.encodeIfPresent(images, forKey: "images")
        try values.encode(name, forKey: "name")
        try values.encode(type, forKey: "type")
    }
}
