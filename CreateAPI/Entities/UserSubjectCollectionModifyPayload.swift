//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// 所有的字段均可选
public struct UserSubjectCollectionModifyPayload: Codable, Hashable {
    /// 评价
    public var comment: String?
    /// 只能用于修改书籍条目进度
    public var epStatus: Int?
    /// 仅自己可见
    public var isPrivate: Bool?
    /// 评分，`0` 表示删除评分
    public var rate: Int?
    /// 标签
    ///
    /// 不传或者 `null` 都会被忽略，传 `[]` 则会删除所有 tag。
    public var tags: [String]?
    /// 修改条目收藏类型
    public var type: Int?
    /// 只能用于修改书籍条目进度
    public var volStatus: Int?

    public init(comment: String? = nil, epStatus: Int? = nil, isPrivate: Bool? = nil, rate: Int? = nil, tags: [String]? = nil, type: Int? = nil, volStatus: Int? = nil) {
        self.comment = comment
        self.epStatus = epStatus
        self.isPrivate = isPrivate
        self.rate = rate
        self.tags = tags
        self.type = type
        self.volStatus = volStatus
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.comment = try values.decodeIfPresent(String.self, forKey: "comment")
        self.epStatus = try values.decodeIfPresent(Int.self, forKey: "ep_status")
        self.isPrivate = try values.decodeIfPresent(Bool.self, forKey: "private")
        self.rate = try values.decodeIfPresent(Int.self, forKey: "rate")
        self.tags = try values.decodeIfPresent([String].self, forKey: "tags")
        self.type = try values.decodeIfPresent(Int.self, forKey: "type")
        self.volStatus = try values.decodeIfPresent(Int.self, forKey: "vol_status")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(comment, forKey: "comment")
        try values.encodeIfPresent(epStatus, forKey: "ep_status")
        try values.encodeIfPresent(isPrivate, forKey: "private")
        try values.encodeIfPresent(rate, forKey: "rate")
        try values.encodeIfPresent(tags, forKey: "tags")
        try values.encodeIfPresent(type, forKey: "type")
        try values.encodeIfPresent(volStatus, forKey: "vol_status")
    }
}
