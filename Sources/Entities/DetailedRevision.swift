// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct DetailedRevision: Codable {
    public var id: Int
    public var type: Int
    /// 意义同<a href="#model-Me">Me</a>
    public var creator: Creator?
    public var summary: String
    public var createdAt: Date
    /// 编辑修改内容，响应类型不固定
    public var data: [String: AnyJSON]?

    public init(id: Int, type: Int, creator: Creator? = nil, summary: String, createdAt: Date, data: [String: AnyJSON]? = nil) {
        self.id = id
        self.type = type
        self.creator = creator
        self.summary = summary
        self.createdAt = createdAt
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.type = try values.decode(Int.self, forKey: "type")
        self.creator = try values.decodeIfPresent(Creator.self, forKey: "creator")
        self.summary = try values.decode(String.self, forKey: "summary")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.data = try values.decodeIfPresent([String: AnyJSON].self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(type, forKey: "type")
        try values.encodeIfPresent(creator, forKey: "creator")
        try values.encode(summary, forKey: "summary")
        try values.encode(createdAt, forKey: "created_at")
        try values.encodeIfPresent(data, forKey: "data")
    }
}
