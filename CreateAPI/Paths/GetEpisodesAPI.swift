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
    /// Get Episodes
    static public func getEpisodes(parameters: GetEpisodesParameters) -> Request<JellyfinAPI.PagedEpisode> {
        Request(path: "/v0/episodes", method: "GET", query: parameters.asQuery, id: "getEpisodes")
    }

    public struct GetEpisodesParameters {
        /// 条目 ID
        public var subjectID: Int
        /// 参照章节的`type`
        public var type: `Type`?
        public var limit: Int?
        public var offset: Int?

        public typealias `Type` = Int

        public init(subjectID: Int, type: `Type`? = nil, limit: Int? = nil, offset: Int? = nil) {
            self.subjectID = subjectID
            self.type = type
            self.limit = limit
            self.offset = offset
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(subjectID, forKey: "subject_id")
            encoder.encode(type, forKey: "type")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(offset, forKey: "offset")
            return encoder.items
        }
    }
}
