//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct UserEpisodeCollection: Codable, Hashable {
    /// Example:
    ///
    /// {
    ///   "airdate" : "",
    ///   "comment" : 0,
    ///   "desc" : "",
    ///   "disc" : 0,
    ///   "duration" : "",
    ///   "duration_seconds" : 1440,
    ///   "ep" : 6,
    ///   "id" : 8,
    ///   "name" : "蒼と白の境界線",
    ///   "name_cn" : "",
    ///   "sort" : 6,
    ///   "subject_id" : 15,
    ///   "type" : 0
    /// }
    public var episode: Episode
    /// EpisodeCollectionType
    ///
    /// - `0`: 未收藏
    /// - `1`: 想看
    /// - `2`: 看过
    /// - `3`: 抛弃
    public var type: Int

    public init(episode: Episode, type: Int) {
        self.episode = episode
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.episode = try values.decode(Episode.self, forKey: "episode")
        self.type = try values.decode(Int.self, forKey: "type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(episode, forKey: "episode")
        try values.encode(type, forKey: "type")
    }
}
