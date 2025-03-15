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
    static public func getUserSubjectEpisodeCollection(subjectID: Int, parameters: GetUserSubjectEpisodeCollectionParameters? = nil) -> Request<GetUserSubjectEpisodeCollectionResponse> {
        Request(path: "/v0/users/-/collections/\(subjectID)/episodes", method: "GET", query: parameters?.asQuery, id: "getUserSubjectEpisodeCollection")
    }

    public struct GetUserSubjectEpisodeCollectionResponse: Decodable, Hashable {
        public var limit: Int
        public var offset: Int
        public var total: Int
        public var data: [JellyfinAPI.UserEpisodeCollection]?

        public init(limit: Int, offset: Int, total: Int, data: [JellyfinAPI.UserEpisodeCollection]? = nil) {
            self.limit = limit
            self.offset = offset
            self.total = total
            self.data = data
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.limit = try values.decode(Int.self, forKey: "limit")
            self.offset = try values.decode(Int.self, forKey: "offset")
            self.total = try values.decode(Int.self, forKey: "total")
            self.data = try values.decodeIfPresent([JellyfinAPI.UserEpisodeCollection].self, forKey: "data")
        }
    }

    public struct GetUserSubjectEpisodeCollectionParameters {
        public var offset: Int?
        public var limit: Int?
        /// EpType
        ///
        /// 本篇 = 0
        /// 特别篇 = 1
        /// OP = 2
        /// ED = 3
        /// 预告/宣传/广告 = 4
        /// MAD = 5
        /// 其他 = 6
        public var episodeType: Int?

        public init(offset: Int? = nil, limit: Int? = nil, episodeType: Int? = nil) {
            self.offset = offset
            self.limit = limit
            self.episodeType = episodeType
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(offset, forKey: "offset")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(episodeType, forKey: "episode_type")
            return encoder.items
        }
    }
}
