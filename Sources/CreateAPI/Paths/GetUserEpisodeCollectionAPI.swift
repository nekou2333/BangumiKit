// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// 章节收藏信息
    static public func getUserEpisodeCollection(episodeID: Int) -> Request<BangumiKit.UserEpisodeCollection> {
        Request(path: "/v0/users/-/collections/-/episodes/\(episodeID)", method: "GET", id: "getUserEpisodeCollection")
    }
}
