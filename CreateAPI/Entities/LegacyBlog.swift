//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// 日志
public struct LegacyBlog: Codable, Hashable, Identifiable {
    /// 发布时间
    ///
    /// Example: "2013-1-2 16:41"
    public var dateline: String?
    /// ID
    public var id: Int?
    /// 图片
    public var image: String?
    /// 回复数
    public var replies: Int?
    /// 概览
    public var summary: String?
    /// 发布时间
    ///
    /// Example: 1357144903
    public var timestamp: Int?
    /// 标题
    public var title: String?
    /// 地址
    public var url: String?
    /// 用户信息
    public var user: LegacyUser?

    public init(dateline: String? = nil, id: Int? = nil, image: String? = nil, replies: Int? = nil, summary: String? = nil, timestamp: Int? = nil, title: String? = nil, url: String? = nil, user: LegacyUser? = nil) {
        self.dateline = dateline
        self.id = id
        self.image = image
        self.replies = replies
        self.summary = summary
        self.timestamp = timestamp
        self.title = title
        self.url = url
        self.user = user
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.dateline = try values.decodeIfPresent(String.self, forKey: "dateline")
        self.id = try values.decodeIfPresent(Int.self, forKey: "id")
        self.image = try values.decodeIfPresent(String.self, forKey: "image")
        self.replies = try values.decodeIfPresent(Int.self, forKey: "replies")
        self.summary = try values.decodeIfPresent(String.self, forKey: "summary")
        self.timestamp = try values.decodeIfPresent(Int.self, forKey: "timestamp")
        self.title = try values.decodeIfPresent(String.self, forKey: "title")
        self.url = try values.decodeIfPresent(String.self, forKey: "url")
        self.user = try values.decodeIfPresent(LegacyUser.self, forKey: "user")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(dateline, forKey: "dateline")
        try values.encodeIfPresent(id, forKey: "id")
        try values.encodeIfPresent(image, forKey: "image")
        try values.encodeIfPresent(replies, forKey: "replies")
        try values.encodeIfPresent(summary, forKey: "summary")
        try values.encodeIfPresent(timestamp, forKey: "timestamp")
        try values.encodeIfPresent(title, forKey: "title")
        try values.encodeIfPresent(url, forKey: "url")
        try values.encodeIfPresent(user, forKey: "user")
    }
}
