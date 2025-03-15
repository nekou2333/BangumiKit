//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// 讨论版
public struct LegacyTopic: Codable, Hashable, Identifiable {
    /// ID
    public var id: Int?
    /// 最后回复时间
    public var lastpost: Int?
    /// 所属对象（条目） ID
    public var mainID: Int?
    /// 回复数
    public var replies: Int?
    /// 发布时间
    public var timestamp: Int?
    /// 标题
    public var title: String?
    /// 地址
    public var url: String?
    /// 用户信息
    public var user: LegacyUser?

    public init(id: Int? = nil, lastpost: Int? = nil, mainID: Int? = nil, replies: Int? = nil, timestamp: Int? = nil, title: String? = nil, url: String? = nil, user: LegacyUser? = nil) {
        self.id = id
        self.lastpost = lastpost
        self.mainID = mainID
        self.replies = replies
        self.timestamp = timestamp
        self.title = title
        self.url = url
        self.user = user
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: "id")
        self.lastpost = try values.decodeIfPresent(Int.self, forKey: "lastpost")
        self.mainID = try values.decodeIfPresent(Int.self, forKey: "main_id")
        self.replies = try values.decodeIfPresent(Int.self, forKey: "replies")
        self.timestamp = try values.decodeIfPresent(Int.self, forKey: "timestamp")
        self.title = try values.decodeIfPresent(String.self, forKey: "title")
        self.url = try values.decodeIfPresent(String.self, forKey: "url")
        self.user = try values.decodeIfPresent(LegacyUser.self, forKey: "user")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(id, forKey: "id")
        try values.encodeIfPresent(lastpost, forKey: "lastpost")
        try values.encodeIfPresent(mainID, forKey: "main_id")
        try values.encodeIfPresent(replies, forKey: "replies")
        try values.encodeIfPresent(timestamp, forKey: "timestamp")
        try values.encodeIfPresent(title, forKey: "title")
        try values.encodeIfPresent(url, forKey: "url")
        try values.encodeIfPresent(user, forKey: "user")
    }
}
