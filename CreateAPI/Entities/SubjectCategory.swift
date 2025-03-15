//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct SubjectCategory: Codable, Hashable {
    /// SubjectBookCategory
    ///
    /// 书籍类型
    /// - `0` 为 其他
    /// - `1001` 为 漫画
    /// - `1002` 为 小说
    /// - `1003` 为 画集
    ///
    /// Example: 1001
    public var int: Int?
    /// SubjectAnimeCategory
    ///
    /// 动画类型
    /// - `0` 为 其他
    /// - `1` 为 TV
    /// - `2` 为 OVA
    /// - `3` 为 Movie
    /// - `5` 为 WEB
    public var int2: Int?
    /// SubjectGameCategory
    ///
    /// 游戏类型
    /// - `0` 为 其他
    /// - `4001` 为 游戏
    /// - `4002` 为 软件
    /// - `4003` 为 扩展包
    /// - `4005` 为 桌游
    ///
    /// Example: 4001
    public var int3: Int?
    /// SubjectRealCategory
    ///
    /// 电影类型
    /// - `0` 为 其他
    /// - `1` 为 日剧
    /// - `2` 为 欧美剧
    /// - `3` 为 华语剧
    /// - `6001` 为 电视剧
    /// - `6002` 为 电影
    /// - `6003` 为 演出
    /// - `6004` 为 综艺
    public var int4: Int?

    public init(int: Int? = nil, int2: Int? = nil, int3: Int? = nil, int4: Int? = nil) {
        self.int = int
        self.int2 = int2
        self.int3 = int3
        self.int4 = int4
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.int = try? container.decode(Int.self)
        self.int2 = try? container.decode(Int.self)
        self.int3 = try? container.decode(Int.self)
        self.int4 = try? container.decode(Int.self)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let value = int { try container.encode(value) }
        if let value = int2 { try container.encode(value) }
        if let value = int3 { try container.encode(value) }
        if let value = int4 { try container.encode(value) }
    }
}
