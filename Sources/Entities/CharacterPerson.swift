// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct CharacterPerson: Codable {
    public var id: Int
    public var name: String
    /// 角色，机体，舰船，组织...
    public var type: Int
    /// Object with some size of images, this object maybe `null`
    public var images: PersonImages?
    public var subjectID: Int
    /// 条目类型
    /// - `1` 为 书籍
    /// - `2` 为 动画
    /// - `3` 为 音乐
    /// - `4` 为 游戏
    /// - `6` 为 三次元
    ///
    /// 没有 `5`
    public var subjectType: Int
    public var subjectName: String
    public var subjectNameCn: String
    public var staff: String?

    public init(
        id: Int,
        name: String,
        type: Int,
        images: PersonImages? = nil,
        subjectID: Int,
        subjectType: Int,
        subjectName: String,
        subjectNameCn: String,
        staff: String? = nil
    ) {
        self.id = id
        self.name = name
        self.type = type
        self.images = images
        self.subjectID = subjectID
        self.subjectType = subjectType
        self.subjectName = subjectName
        self.subjectNameCn = subjectNameCn
        self.staff = staff
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.name = try values.decode(String.self, forKey: "name")
        self.type = try values.decode(Int.self, forKey: "type")
        self.images = try values.decodeIfPresent(PersonImages.self, forKey: "images")
        self.subjectID = try values.decode(Int.self, forKey: "subject_id")
        self.subjectType = try values.decode(Int.self, forKey: "subject_type")
        self.subjectName = try values.decode(String.self, forKey: "subject_name")
        self.subjectNameCn = try values.decode(String.self, forKey: "subject_name_cn")
        self.staff = try values.decodeIfPresent(String.self, forKey: "staff")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(name, forKey: "name")
        try values.encode(type, forKey: "type")
        try values.encodeIfPresent(images, forKey: "images")
        try values.encode(subjectID, forKey: "subject_id")
        try values.encode(subjectType, forKey: "subject_type")
        try values.encode(subjectName, forKey: "subject_name")
        try values.encode(subjectNameCn, forKey: "subject_name_cn")
        try values.encodeIfPresent(staff, forKey: "staff")
    }
}
