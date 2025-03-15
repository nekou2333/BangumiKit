//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// 人物
public struct LegacyMono: Codable, Hashable, Identifiable {
    /// 人物 ID
    public var id: Int?
    /// 肖像
    public var images: Images?
    /// 姓名
    public var name: String?
    /// 人物地址
    public var url: String?
    /// 收藏人数
    public var collects: Int?
    /// 回复数量
    public var comment: Int?
    /// 简体中文名
    public var nameCn: String?

    /// 肖像
    public struct Images: Codable, Hashable {
        /// Example: "https://lain.bgm.tv/pic/crt/g/ce/65/32_crt_XMJOj.jpg"
        public var grid: String?
        /// Example: "https://lain.bgm.tv/pic/crt/l/ce/65/32_crt_XMJOj.jpg"
        public var large: String?
        /// Example: "https://lain.bgm.tv/pic/crt/m/ce/65/32_crt_XMJOj.jpg"
        public var medium: String?
        /// Example: "https://lain.bgm.tv/pic/crt/s/ce/65/32_crt_XMJOj.jpg"
        public var small: String?

        public init(grid: String? = nil, large: String? = nil, medium: String? = nil, small: String? = nil) {
            self.grid = grid
            self.large = large
            self.medium = medium
            self.small = small
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.grid = try values.decodeIfPresent(String.self, forKey: "grid")
            self.large = try values.decodeIfPresent(String.self, forKey: "large")
            self.medium = try values.decodeIfPresent(String.self, forKey: "medium")
            self.small = try values.decodeIfPresent(String.self, forKey: "small")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(grid, forKey: "grid")
            try values.encodeIfPresent(large, forKey: "large")
            try values.encodeIfPresent(medium, forKey: "medium")
            try values.encodeIfPresent(small, forKey: "small")
        }
    }

    public init(id: Int? = nil, images: Images? = nil, name: String? = nil, url: String? = nil, collects: Int? = nil, comment: Int? = nil, nameCn: String? = nil) {
        self.id = id
        self.images = images
        self.name = name
        self.url = url
        self.collects = collects
        self.comment = comment
        self.nameCn = nameCn
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: "id")
        self.images = try values.decodeIfPresent(Images.self, forKey: "images")
        self.name = try values.decodeIfPresent(String.self, forKey: "name")
        self.url = try values.decodeIfPresent(String.self, forKey: "url")
        self.collects = try values.decodeIfPresent(Int.self, forKey: "collects")
        self.comment = try values.decodeIfPresent(Int.self, forKey: "comment")
        self.nameCn = try values.decodeIfPresent(String.self, forKey: "name_cn")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(id, forKey: "id")
        try values.encodeIfPresent(images, forKey: "images")
        try values.encodeIfPresent(name, forKey: "name")
        try values.encodeIfPresent(url, forKey: "url")
        try values.encodeIfPresent(collects, forKey: "collects")
        try values.encodeIfPresent(comment, forKey: "comment")
        try values.encodeIfPresent(nameCn, forKey: "name_cn")
    }
}
