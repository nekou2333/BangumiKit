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
    /// Get Episode Revisions
    static public func getEpisodeRevisions(parameters: GetEpisodeRevisionsParameters) -> Request<JellyfinAPI.PagedRevision> {
        Request(path: "/v0/revisions/episodes", method: "GET", query: parameters.asQuery, id: "getEpisodeRevisions")
    }

    public struct GetEpisodeRevisionsParameters {
        public var episodeID: Int
        public var limit: Int?
        public var offset: Int?

        public init(episodeID: Int, limit: Int? = nil, offset: Int? = nil) {
            self.episodeID = episodeID
            self.limit = limit
            self.offset = offset
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(episodeID, forKey: "episode_id")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(offset, forKey: "offset")
            return encoder.items
        }
    }
}
