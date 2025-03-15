//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct RelatedPerson: Codable, Hashable, Identifiable {
    public var career: [PersonCareer]
    /// 参与章节/曲目
    public var eps: String
    public var id: Int
    /// Object with some size of images, this object maybe `null`
    public var images: PersonImages?
    public var name: String
    public var relation: String
    /// `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
    public var type: Int

    public init(career: [PersonCareer], eps: String, id: Int, images: PersonImages? = nil, name: String, relation: String, type: Int) {
        self.career = career
        self.eps = eps
        self.id = id
        self.images = images
        self.name = name
        self.relation = relation
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.career = try values.decode([PersonCareer].self, forKey: "career")
        self.eps = try values.decode(String.self, forKey: "eps")
        self.id = try values.decode(Int.self, forKey: "id")
        self.images = try values.decodeIfPresent(PersonImages.self, forKey: "images")
        self.name = try values.decode(String.self, forKey: "name")
        self.relation = try values.decode(String.self, forKey: "relation")
        self.type = try values.decode(Int.self, forKey: "type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(career, forKey: "career")
        try values.encode(eps, forKey: "eps")
        try values.encode(id, forKey: "id")
        try values.encodeIfPresent(images, forKey: "images")
        try values.encode(name, forKey: "name")
        try values.encode(relation, forKey: "relation")
        try values.encode(type, forKey: "type")
    }
}
