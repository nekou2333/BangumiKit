//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// 虚拟角色
public struct LegacyCharacter: Codable, Hashable {
    /// 人物
    public var legacyMono: LegacyMono
    /// 声优列表
    public var actors: [LegacyMonoBase]?
    /// 人物信息
    public var info: LegacyMonoInfo?

    public init(legacyMono: LegacyMono, actors: [LegacyMonoBase]? = nil, info: LegacyMonoInfo? = nil) {
        self.legacyMono = legacyMono
        self.actors = actors
        self.info = info
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.legacyMono = try LegacyMono(from: decoder)
        self.actors = try values.decodeIfPresent([LegacyMonoBase].self, forKey: "actors")
        self.info = try values.decodeIfPresent(LegacyMonoInfo.self, forKey: "info")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(legacyMono, forKey: "legacyMono")
        try values.encodeIfPresent(actors, forKey: "actors")
        try values.encodeIfPresent(info, forKey: "info")
    }
}
