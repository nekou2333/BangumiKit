// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

public extension Paths.V0.Characters.WithCharacterID {
    var collect: Collect {
        Collect(path: path + "/collect")
    }

    struct Collect {
        /// Path: `/v0/characters/{character_id}/collect`
        public let path: String

        /// Collect character for current user
        ///
        /// 为当前用户收藏角色
        public var post: Request<Void> {
            Request(path: path, method: "POST", id: "collectCharacterByCharacterIdAndUserId")
        }

        /// Uncollect character for current user
        ///
        /// 为当前用户取消收藏角色
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "uncollectCharacterByCharacterIdAndUserId")
        }
    }
}
