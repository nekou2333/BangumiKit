// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Get Episode
    static public func getEpisodeByID(episodeID: Int) -> Request<JellyfinAPI.EpisodeDetail> {
        Request(path: "/v0/episodes/\(episodeID)", method: "GET", id: "getEpisodeById")
    }
}
