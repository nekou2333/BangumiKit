//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct CharacterPerson: Codable, Hashable, Identifiable {
    public var id: Int
    /// Object with some size of images, this object maybe `null`
    public var images: PersonImages?
    public var name: String
    public var staff: String?
    public var subjectID: Int
    public var subjectName: String
    public var subjectNameCn: String
    /// 条目类型
    /// - `1` 为 书籍
    /// - `2` 为 动画
    /// - `3` 为 音乐
    /// - `4` 为 游戏
    /// - `6` 为 三次元
    /// 
    /// 没有 `5`
    public var subjectType: Int
    /// 角色，机体，舰船，组织...
    public var type: Int

    public init(id: Int, images: PersonImages? = nil, name: String, staff: String? = nil, subjectID: Int, subjectName: String, subjectNameCn: String, subjectType: Int, type: Int) {
        self.id = id
        self.images = images
        self.name = name
        self.staff = staff
        self.subjectID = subjectID
        self.subjectName = subjectName
        self.subjectNameCn = subjectNameCn
        self.subjectType = subjectType
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.images = try values.decodeIfPresent(PersonImages.self, forKey: "images")
        self.name = try values.decode(String.self, forKey: "name")
        self.staff = try values.decodeIfPresent(String.self, forKey: "staff")
        self.subjectID = try values.decode(Int.self, forKey: "subject_id")
        self.subjectName = try values.decode(String.self, forKey: "subject_name")
        self.subjectNameCn = try values.decode(String.self, forKey: "subject_name_cn")
        self.subjectType = try values.decode(Int.self, forKey: "subject_type")
        self.type = try values.decode(Int.self, forKey: "type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encodeIfPresent(images, forKey: "images")
        try values.encode(name, forKey: "name")
        try values.encodeIfPresent(staff, forKey: "staff")
        try values.encode(subjectID, forKey: "subject_id")
        try values.encode(subjectName, forKey: "subject_name")
        try values.encode(subjectNameCn, forKey: "subject_name_cn")
        try values.encode(subjectType, forKey: "subject_type")
        try values.encode(type, forKey: "type")
    }
}
