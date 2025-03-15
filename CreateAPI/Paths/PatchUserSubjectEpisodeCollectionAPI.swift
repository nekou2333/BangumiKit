//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// 章节收藏信息
    ///
    /// 同时会重新计算条目的完成度
    static public func patchUserSubjectEpisodeCollection(subjectID: Int, _ body: PatchUserSubjectEpisodeCollectionRequest? = nil) -> Request<Void> {
        Request(path: "/v0/users/-/collections/\(subjectID)/episodes", method: "PATCH", body: body, id: "patchUserSubjectEpisodeCollection")
    }

    public struct PatchUserSubjectEpisodeCollectionRequest: Encodable, Hashable {
        /// Example: [1, 2, 8]
        public var episodeID: [Int]
        /// EpisodeCollectionType
        ///
        /// - `0`: 未收藏
        /// - `1`: 想看
        /// - `2`: 看过
        /// - `3`: 抛弃
        public var type: Int

        public init(episodeID: [Int], type: Int) {
            self.episodeID = episodeID
            self.type = type
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(episodeID, forKey: "episode_id")
            try values.encode(type, forKey: "type")
        }
    }
}
