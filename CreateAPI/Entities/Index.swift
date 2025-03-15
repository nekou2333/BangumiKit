//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct Index: Codable, Hashable, Identifiable {
    /// Ban
    ///
    /// Deprecated, always false.
    ///
    /// - warning: Deprecated.
    public var isBan: Bool
    public var createdAt: Date
    /// 意义同<a href="#model-Me">Me</a>
    public var creator: Creator
    public var desc: String
    public var id: Int
    /// 目录是否包括 nsfw 条目
    public var isNsfw: Bool
    /// 目录评论及收藏数
    public var stat: Stat
    public var title: String
    /// 收录条目总数
    public var total: Int?
    public var updatedAt: Date

    public init(isBan: Bool, createdAt: Date, creator: Creator, desc: String, id: Int, isNsfw: Bool, stat: Stat, title: String, total: Int? = nil, updatedAt: Date) {
        self.isBan = isBan
        self.createdAt = createdAt
        self.creator = creator
        self.desc = desc
        self.id = id
        self.isNsfw = isNsfw
        self.stat = stat
        self.title = title
        self.total = total
        self.updatedAt = updatedAt
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isBan = try values.decode(Bool.self, forKey: "ban")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.creator = try values.decode(Creator.self, forKey: "creator")
        self.desc = try values.decode(String.self, forKey: "desc")
        self.id = try values.decode(Int.self, forKey: "id")
        self.isNsfw = try values.decode(Bool.self, forKey: "nsfw")
        self.stat = try values.decode(Stat.self, forKey: "stat")
        self.title = try values.decode(String.self, forKey: "title")
        self.total = try values.decodeIfPresent(Int.self, forKey: "total")
        self.updatedAt = try values.decode(Date.self, forKey: "updated_at")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(isBan, forKey: "ban")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(creator, forKey: "creator")
        try values.encode(desc, forKey: "desc")
        try values.encode(id, forKey: "id")
        try values.encode(isNsfw, forKey: "nsfw")
        try values.encode(stat, forKey: "stat")
        try values.encode(title, forKey: "title")
        try values.encodeIfPresent(total, forKey: "total")
        try values.encode(updatedAt, forKey: "updated_at")
    }
}
