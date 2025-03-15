//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// SubjectRelation
public struct V0SubjectRelation: Codable, Hashable, Identifiable {
    public var id: Int
    public var images: Images?
    public var name: String
    public var nameCn: String
    public var relation: String
    public var type: Int

    public init(id: Int, images: Images? = nil, name: String, nameCn: String, relation: String, type: Int) {
        self.id = id
        self.images = images
        self.name = name
        self.nameCn = nameCn
        self.relation = relation
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.images = try values.decodeIfPresent(Images.self, forKey: "images")
        self.name = try values.decode(String.self, forKey: "name")
        self.nameCn = try values.decode(String.self, forKey: "name_cn")
        self.relation = try values.decode(String.self, forKey: "relation")
        self.type = try values.decode(Int.self, forKey: "type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encodeIfPresent(images, forKey: "images")
        try values.encode(name, forKey: "name")
        try values.encode(nameCn, forKey: "name_cn")
        try values.encode(relation, forKey: "relation")
        try values.encode(type, forKey: "type")
    }
}
