// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

public extension Paths.V0.Users.WithUsername.Collections.Minus {
    var persons: Persons {
        Persons(path: path + "/persons")
    }

    struct Persons {
        /// Path: `/v0/users/{username}/collections/-/persons`
        public let path: String

        /// 获取用户人物收藏列表
        public var get: Request<BangumiKit.PagedUserPersonCollection> {
            Request(path: path, method: "GET", id: "getUserPersonCollections")
        }
    }
}
