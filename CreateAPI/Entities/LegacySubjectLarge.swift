//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct LegacySubjectLarge: Codable, Hashable {
    public var legacySubjectMedium: LegacySubjectMedium
    /// 评论日志
    public var blog: [LegacyBlog]?
    /// 章节列表
    public var eps: [LegacyEpisode]?
    /// 讨论版
    public var topic: [LegacyTopic]?

    public init(legacySubjectMedium: LegacySubjectMedium, blog: [LegacyBlog]? = nil, eps: [LegacyEpisode]? = nil, topic: [LegacyTopic]? = nil) {
        self.legacySubjectMedium = legacySubjectMedium
        self.blog = blog
        self.eps = eps
        self.topic = topic
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.legacySubjectMedium = try LegacySubjectMedium(from: decoder)
        self.blog = try values.decodeIfPresent([LegacyBlog].self, forKey: "blog")
        self.eps = try values.decodeIfPresent([LegacyEpisode].self, forKey: "eps")
        self.topic = try values.decodeIfPresent([LegacyTopic].self, forKey: "topic")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(legacySubjectMedium, forKey: "legacySubjectMedium")
        try values.encodeIfPresent(blog, forKey: "blog")
        try values.encodeIfPresent(eps, forKey: "eps")
        try values.encodeIfPresent(topic, forKey: "topic")
    }
}
