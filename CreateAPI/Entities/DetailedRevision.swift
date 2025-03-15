//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct DetailedRevision: Codable, Hashable, Identifiable {
    public var createdAt: Date
    /// 意义同<a href="#model-Me">Me</a>
    public var creator: Creator?
    /// 编辑修改内容，响应类型不固定
    public var data: [String: AnyJSON]?
    public var id: Int
    public var summary: String
    public var type: Int

    public init(createdAt: Date, creator: Creator? = nil, data: [String: AnyJSON]? = nil, id: Int, summary: String, type: Int) {
        self.createdAt = createdAt
        self.creator = creator
        self.data = data
        self.id = id
        self.summary = summary
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.creator = try values.decodeIfPresent(Creator.self, forKey: "creator")
        self.data = try values.decodeIfPresent([String: AnyJSON].self, forKey: "data")
        self.id = try values.decode(Int.self, forKey: "id")
        self.summary = try values.decode(String.self, forKey: "summary")
        self.type = try values.decode(Int.self, forKey: "type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(createdAt, forKey: "created_at")
        try values.encodeIfPresent(creator, forKey: "creator")
        try values.encodeIfPresent(data, forKey: "data")
        try values.encode(id, forKey: "id")
        try values.encode(summary, forKey: "summary")
        try values.encode(type, forKey: "type")
    }
}
