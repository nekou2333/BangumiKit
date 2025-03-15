// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct UserSubjectCollection: Codable, Hashable {
    /// Example: "看看"
    public var comment: String?
    public var epStatus: Int
    /// Private
    public var isPrivate: Bool
    public var rate: Int
    /// SlimSubject
    public var subject: SlimSubject?
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
    /// Example: ["柯南", "万年小学生", "推理", "青山刚昌", "TV"]
    public var tags: [String]
    /// CollectionType
    ///
    /// - `1`: 想看
    /// - `2`: 看过
    /// - `3`: 在看
    /// - `4`: 搁置
    /// - `5`: 抛弃
    public var type: Int
    /// 本时间并不代表条目的收藏时间。修改评分，评价，章节观看状态等收藏信息时未更新此时间是一个 bug。请不要依赖此特性
    ///
    /// Example: "2022-06-19T18:44:13.6140127+08:00"
    public var updatedAt: Date
    public var volStatus: Int

    public init(comment: String? = nil, epStatus: Int, isPrivate: Bool, rate: Int, subject: SlimSubject? = nil, subjectID: Int, subjectType: Int, tags: [String], type: Int, updatedAt: Date, volStatus: Int) {
        self.comment = comment
        self.epStatus = epStatus
        self.isPrivate = isPrivate
        self.rate = rate
        self.subject = subject
        self.subjectID = subjectID
        self.subjectType = subjectType
        self.tags = tags
        self.type = type
        self.updatedAt = updatedAt
        self.volStatus = volStatus
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.comment = try values.decodeIfPresent(String.self, forKey: "comment")
        self.epStatus = try values.decode(Int.self, forKey: "ep_status")
        self.isPrivate = try values.decode(Bool.self, forKey: "private")
        self.rate = try values.decode(Int.self, forKey: "rate")
        self.subject = try values.decodeIfPresent(SlimSubject.self, forKey: "subject")
        self.subjectID = try values.decode(Int.self, forKey: "subject_id")
        self.subjectType = try values.decode(Int.self, forKey: "subject_type")
        self.tags = try values.decode([String].self, forKey: "tags")
        self.type = try values.decode(Int.self, forKey: "type")
        self.updatedAt = try values.decode(Date.self, forKey: "updated_at")
        self.volStatus = try values.decode(Int.self, forKey: "vol_status")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(comment, forKey: "comment")
        try values.encode(epStatus, forKey: "ep_status")
        try values.encode(isPrivate, forKey: "private")
        try values.encode(rate, forKey: "rate")
        try values.encodeIfPresent(subject, forKey: "subject")
        try values.encode(subjectID, forKey: "subject_id")
        try values.encode(subjectType, forKey: "subject_type")
        try values.encode(tags, forKey: "tags")
        try values.encode(type, forKey: "type")
        try values.encode(updatedAt, forKey: "updated_at")
        try values.encode(volStatus, forKey: "vol_status")
    }
}
