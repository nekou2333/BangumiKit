//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// 人物信息
public struct LegacyMonoInfo: Codable, Hashable {
    /// 别名（另外添加出来的 key 为 0 开始的数字）
    public var alias: Alias?
    /// 生日
    ///
    /// Example: "4月13日"
    public var birth: String?
    /// 声优
    public var cv: String?
    /// 性别
    ///
    /// Example: "女"
    public var gender: String?
    /// 身高
    ///
    /// Example: "152cm"
    public var height: String?
    /// 简体中文名
    public var nameCn: String?
    /// 引用来源
    public var source: Source?

    /// 别名（另外添加出来的 key 为 0 开始的数字）
    public struct Alias: Codable, Hashable {
        /// 日文名
        public var jp: String?
        /// 纯假名
        public var kana: String?
        /// 昵称
        public var nick: String?
        /// 罗马字
        public var romaji: String?
        /// 第二中文名
        public var zh: String?

        public init(jp: String? = nil, kana: String? = nil, nick: String? = nil, romaji: String? = nil, zh: String? = nil) {
            self.jp = jp
            self.kana = kana
            self.nick = nick
            self.romaji = romaji
            self.zh = zh
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.jp = try values.decodeIfPresent(String.self, forKey: "jp")
            self.kana = try values.decodeIfPresent(String.self, forKey: "kana")
            self.nick = try values.decodeIfPresent(String.self, forKey: "nick")
            self.romaji = try values.decodeIfPresent(String.self, forKey: "romaji")
            self.zh = try values.decodeIfPresent(String.self, forKey: "zh")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(jp, forKey: "jp")
            try values.encodeIfPresent(kana, forKey: "kana")
            try values.encodeIfPresent(nick, forKey: "nick")
            try values.encodeIfPresent(romaji, forKey: "romaji")
            try values.encodeIfPresent(zh, forKey: "zh")
        }
    }

    /// 引用来源
    public enum Source: Codable, Hashable {
        case string(String)
        case strings([String])

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(String.self) {
                self = .string(value)
            } else if let value = try? container.decode([String].self) {
                self = .strings(value)
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Data could not be decoded as any of the expected types (String, [String])."
                )
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let value): try container.encode(value)
            case .strings(let value): try container.encode(value)
            }
        }
    }

    public init(alias: Alias? = nil, birth: String? = nil, cv: String? = nil, gender: String? = nil, height: String? = nil, nameCn: String? = nil, source: Source? = nil) {
        self.alias = alias
        self.birth = birth
        self.cv = cv
        self.gender = gender
        self.height = height
        self.nameCn = nameCn
        self.source = source
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.alias = try values.decodeIfPresent(Alias.self, forKey: "alias")
        self.birth = try values.decodeIfPresent(String.self, forKey: "birth")
        self.cv = try values.decodeIfPresent(String.self, forKey: "cv")
        self.gender = try values.decodeIfPresent(String.self, forKey: "gender")
        self.height = try values.decodeIfPresent(String.self, forKey: "height")
        self.nameCn = try values.decodeIfPresent(String.self, forKey: "name_cn")
        self.source = try values.decodeIfPresent(Source.self, forKey: "source")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(alias, forKey: "alias")
        try values.encodeIfPresent(birth, forKey: "birth")
        try values.encodeIfPresent(cv, forKey: "cv")
        try values.encodeIfPresent(gender, forKey: "gender")
        try values.encodeIfPresent(height, forKey: "height")
        try values.encodeIfPresent(nameCn, forKey: "name_cn")
        try values.encodeIfPresent(source, forKey: "source")
    }
}
