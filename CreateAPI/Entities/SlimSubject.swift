//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct SlimSubject: Codable, Hashable, Identifiable {
    /// Total
    ///
    /// 收藏人数
    public var collectionTotal: Int
    /// Air date in `YYYY-MM-DD` format
    public var date: String?
    /// 由旧服务端从wiki中解析，对于书籍条目为`话数`
    public var eps: Int
    public var id: Int
    public var images: Images
    public var name: String
    public var nameCn: String
    /// 排名
    public var rank: Int
    /// 分数
    public var score: Double
    /// Summary
    ///
    /// 截短后的条目描述。
    public var shortSummary: String
    /// 前 10 个 tag
    public var tags: [SubjectTag]
    public var type: Int
    /// 书籍条目的册数，由旧服务端从wiki中解析
    public var volumes: Int

    public init(collectionTotal: Int, date: String? = nil, eps: Int, id: Int, images: Images, name: String, nameCn: String, rank: Int, score: Double, shortSummary: String, tags: [SubjectTag], type: Int, volumes: Int) {
        self.collectionTotal = collectionTotal
        self.date = date
        self.eps = eps
        self.id = id
        self.images = images
        self.name = name
        self.nameCn = nameCn
        self.rank = rank
        self.score = score
        self.shortSummary = shortSummary
        self.tags = tags
        self.type = type
        self.volumes = volumes
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.collectionTotal = try values.decode(Int.self, forKey: "collection_total")
        self.date = try values.decodeIfPresent(String.self, forKey: "date")
        self.eps = try values.decode(Int.self, forKey: "eps")
        self.id = try values.decode(Int.self, forKey: "id")
        self.images = try values.decode(Images.self, forKey: "images")
        self.name = try values.decode(String.self, forKey: "name")
        self.nameCn = try values.decode(String.self, forKey: "name_cn")
        self.rank = try values.decode(Int.self, forKey: "rank")
        self.score = try values.decode(Double.self, forKey: "score")
        self.shortSummary = try values.decode(String.self, forKey: "short_summary")
        self.tags = try values.decode([SubjectTag].self, forKey: "tags")
        self.type = try values.decode(Int.self, forKey: "type")
        self.volumes = try values.decode(Int.self, forKey: "volumes")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(collectionTotal, forKey: "collection_total")
        try values.encodeIfPresent(date, forKey: "date")
        try values.encode(eps, forKey: "eps")
        try values.encode(id, forKey: "id")
        try values.encode(images, forKey: "images")
        try values.encode(name, forKey: "name")
        try values.encode(nameCn, forKey: "name_cn")
        try values.encode(rank, forKey: "rank")
        try values.encode(score, forKey: "score")
        try values.encode(shortSummary, forKey: "short_summary")
        try values.encode(tags, forKey: "tags")
        try values.encode(type, forKey: "type")
        try values.encode(volumes, forKey: "volumes")
    }
}
