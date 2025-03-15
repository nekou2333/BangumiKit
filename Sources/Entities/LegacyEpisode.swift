// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// 章节信息
public struct LegacyEpisode: Codable {
    /// 章节 ID
    ///
    /// Example: 1027
    public var id: Int?
    /// 章节地址
    ///
    /// Example: "https://bgm.tv/ep/1027"
    public var url: String?
    /// 章节类型 <br> 0 = 本篇 <br> 1 = 特别篇 <br> 2 = OP <br> 3 = ED <br> 4 = 预告/宣传/广告 <br> 5 = MAD <br> 6 = 其他
    public var type: Int?
    /// 集数
    public var sort: Int?
    /// 标题
    ///
    /// Example: "ちぃ 目覚める"
    public var name: String?
    /// 简体中文标题
    ///
    /// Example: "叽，觉醒了"
    public var nameCn: String?
    /// 时长
    ///
    /// Example: "24m"
    public var duration: String?
    /// 放送日期
    ///
    /// Example: "2002-04-03"
    public var airdate: String?
    /// 回复数量
    public var comment: Int?
    /// 简介
    public var desc: String?
    /// 放送状态 <br> Air = 已放送 <br> Today = 正在放送 <br> NA = 未放送
    ///
    /// Example: "Air"
    public var status: Status?

    /// 放送状态 <br> Air = 已放送 <br> Today = 正在放送 <br> NA = 未放送
    ///
    /// Example: "Air"
    public enum Status: String, Codable, CaseIterable {
        case air = "Air"
        case today = "Today"
        case na = "NA"
    }

    public init(
        id: Int? = nil,
        url: String? = nil,
        type: Int? = nil,
        sort: Int? = nil,
        name: String? = nil,
        nameCn: String? = nil,
        duration: String? = nil,
        airdate: String? = nil,
        comment: Int? = nil,
        desc: String? = nil,
        status: Status? = nil
    ) {
        self.id = id
        self.url = url
        self.type = type
        self.sort = sort
        self.name = name
        self.nameCn = nameCn
        self.duration = duration
        self.airdate = airdate
        self.comment = comment
        self.desc = desc
        self.status = status
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: "id")
        self.url = try values.decodeIfPresent(String.self, forKey: "url")
        self.type = try values.decodeIfPresent(Int.self, forKey: "type")
        self.sort = try values.decodeIfPresent(Int.self, forKey: "sort")
        self.name = try values.decodeIfPresent(String.self, forKey: "name")
        self.nameCn = try values.decodeIfPresent(String.self, forKey: "name_cn")
        self.duration = try values.decodeIfPresent(String.self, forKey: "duration")
        self.airdate = try values.decodeIfPresent(String.self, forKey: "airdate")
        self.comment = try values.decodeIfPresent(Int.self, forKey: "comment")
        self.desc = try values.decodeIfPresent(String.self, forKey: "desc")
        self.status = try values.decodeIfPresent(Status.self, forKey: "status")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(id, forKey: "id")
        try values.encodeIfPresent(url, forKey: "url")
        try values.encodeIfPresent(type, forKey: "type")
        try values.encodeIfPresent(sort, forKey: "sort")
        try values.encodeIfPresent(name, forKey: "name")
        try values.encodeIfPresent(nameCn, forKey: "name_cn")
        try values.encodeIfPresent(duration, forKey: "duration")
        try values.encodeIfPresent(airdate, forKey: "airdate")
        try values.encodeIfPresent(comment, forKey: "comment")
        try values.encodeIfPresent(desc, forKey: "desc")
        try values.encodeIfPresent(status, forKey: "status")
    }
}
