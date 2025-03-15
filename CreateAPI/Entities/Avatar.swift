// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Example:
///
/// {
///   "large" : "https:\/\/lain.bgm.tv\/pic\/user\/l\/000\/00\/00\/1.jpg?r=1391790456",
///   "medium" : "https:\/\/lain.bgm.tv\/pic\/user\/m\/000\/00\/00\/1.jpg?r=1391790456",
///   "small" : "https:\/\/lain.bgm.tv\/pic\/user\/s\/000\/00\/00\/1.jpg?r=1391790456"
/// }
public struct Avatar: Codable, Hashable {
    public var large: String
    public var medium: String
    public var small: String

    public init(large: String, medium: String, small: String) {
        self.large = large
        self.medium = medium
        self.small = small
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.large = try values.decode(String.self, forKey: "large")
        self.medium = try values.decode(String.self, forKey: "medium")
        self.small = try values.decode(String.self, forKey: "small")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(large, forKey: "large")
        try values.encode(medium, forKey: "medium")
        try values.encode(small, forKey: "small")
    }
}
