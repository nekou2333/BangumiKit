//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// 同名字段意义同<a href="#model-Subject">Subject</a>
public struct IndexSubject: Codable, Hashable, Identifiable {
    public var addedAt: Date
    public var comment: String
    public var date: String?
    public var id: Int
    public var images: Images?
    /// Example:
    ///
    /// [
    ///   {
    ///     "key" : "简体中文名",
    ///     "value" : "鲁路修·兰佩路基"
    ///   },
    ///   {
    ///     "key" : "别名",
    ///     "value" : [
    ///       {
    ///         "v" : "L.L."
    ///       },
    ///       {
    ///         "v" : "勒鲁什"
    ///       },
    ///       {
    ///         "v" : "鲁鲁修"
    ///       },
    ///       {
    ///         "v" : "ゼロ"
    ///       },
    ///       {
    ///         "v" : "Zero"
    ///       },
    ///       {
    ///         "k" : "英文名",
    ///         "v" : "Lelouch Lamperouge"
    ///       },
    ///       {
    ///         "k" : "第二中文名",
    ///         "v" : "鲁路修·冯·布里塔尼亚"
    ///       },
    ///       {
    ///         "k" : "英文名二",
    ///         "v" : "Lelouch Vie Britannia"
    ///       },
    ///       {
    ///         "k" : "日文名",
    ///         "v" : "ルルーシュ・ヴィ・ブリタニア"
    ///       }
    ///     ]
    ///   },
    ///   {
    ///     "key" : "性别",
    ///     "value" : "男"
    ///   },
    ///   {
    ///     "key" : "生日",
    ///     "value" : "12月5日"
    ///   },
    ///   {
    ///     "key" : "血型",
    ///     "value" : "A型"
    ///   },
    ///   {
    ///     "key" : "身高",
    ///     "value" : "178cm→181cm"
    ///   },
    ///   {
    ///     "key" : "体重",
    ///     "value" : "54kg"
    ///   },
    ///   {
    ///     "key" : "引用来源",
    ///     "value" : "Wikipedia"
    ///   }
    /// ]
    public var infobox: [WikiV0Item]?
    public var name: String
    public var type: Int

    public init(addedAt: Date, comment: String, date: String? = nil, id: Int, images: Images? = nil, infobox: [WikiV0Item]? = nil, name: String, type: Int) {
        self.addedAt = addedAt
        self.comment = comment
        self.date = date
        self.id = id
        self.images = images
        self.infobox = infobox
        self.name = name
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.addedAt = try values.decode(Date.self, forKey: "added_at")
        self.comment = try values.decode(String.self, forKey: "comment")
        self.date = try values.decodeIfPresent(String.self, forKey: "date")
        self.id = try values.decode(Int.self, forKey: "id")
        self.images = try values.decodeIfPresent(Images.self, forKey: "images")
        self.infobox = try values.decodeIfPresent([WikiV0Item].self, forKey: "infobox")
        self.name = try values.decode(String.self, forKey: "name")
        self.type = try values.decode(Int.self, forKey: "type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(addedAt, forKey: "added_at")
        try values.encode(comment, forKey: "comment")
        try values.encodeIfPresent(date, forKey: "date")
        try values.encode(id, forKey: "id")
        try values.encodeIfPresent(images, forKey: "images")
        try values.encodeIfPresent(infobox, forKey: "infobox")
        try values.encode(name, forKey: "name")
        try values.encode(type, forKey: "type")
    }
}
