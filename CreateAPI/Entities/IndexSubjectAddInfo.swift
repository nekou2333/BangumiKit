// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// IndexBasicInfo
///
/// 新增某条目到目录的请求信息
public struct IndexSubjectAddInfo: Codable, Hashable {
    public var comment: String?
    /// 排序条件，越小越靠前
    public var sort: Int?
    public var subjectID: Int?

    public init(comment: String? = nil, sort: Int? = nil, subjectID: Int? = nil) {
        self.comment = comment
        self.sort = sort
        self.subjectID = subjectID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.comment = try values.decodeIfPresent(String.self, forKey: "comment")
        self.sort = try values.decodeIfPresent(Int.self, forKey: "sort")
        self.subjectID = try values.decodeIfPresent(Int.self, forKey: "subject_id")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(comment, forKey: "comment")
        try values.encodeIfPresent(sort, forKey: "sort")
        try values.encodeIfPresent(subjectID, forKey: "subject_id")
    }
}
