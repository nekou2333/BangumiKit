// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

public extension Paths.V0.Users.Minus.Collections.Minus.Episodes {
    func episodeID(_ episodeID: Int) -> WithEpisodeID {
        WithEpisodeID(path: "\(path)/\(episodeID)")
    }

    struct WithEpisodeID {
        /// Path: `/v0/users/-/collections/-/episodes/{episode_id}`
        public let path: String

        /// 章节收藏信息
        public var get: Request<BangumiKit.UserEpisodeCollection> {
            Request(path: path, method: "GET", id: "getUserEpisodeCollection")
        }

        /// 更新章节收藏信息
        public func put(type: Int) -> Request<Void> {
            Request(path: path, method: "PUT", body: ["type": type], id: "putUserEpisodeCollection")
        }
    }
}
