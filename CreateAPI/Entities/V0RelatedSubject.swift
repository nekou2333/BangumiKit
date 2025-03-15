//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// RelatedSubject
public struct V0RelatedSubject: Codable, Hashable, Identifiable {
    public var id: Int
    public var image: String?
    public var name: String
    public var nameCn: String
    public var staff: String
    /// SubjectType
    ///
    /// 条目类型
    /// - `1` 为 书籍
    /// - `2` 为 动画
    /// - `3` 为 音乐
    /// - `4` 为 游戏
    /// - `6` 为 三次元
    /// 
    /// 没有 `5`
    public var type: Int

    public init(id: Int, image: String? = nil, name: String, nameCn: String, staff: String, type: Int) {
        self.id = id
        self.image = image
        self.name = name
        self.nameCn = nameCn
        self.staff = staff
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.image = try values.decodeIfPresent(String.self, forKey: "image")
        self.name = try values.decode(String.self, forKey: "name")
        self.nameCn = try values.decode(String.self, forKey: "name_cn")
        self.staff = try values.decode(String.self, forKey: "staff")
        self.type = try values.decode(Int.self, forKey: "type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encodeIfPresent(image, forKey: "image")
        try values.encode(name, forKey: "name")
        try values.encode(nameCn, forKey: "name_cn")
        try values.encode(staff, forKey: "staff")
        try values.encode(type, forKey: "type")
    }
}
