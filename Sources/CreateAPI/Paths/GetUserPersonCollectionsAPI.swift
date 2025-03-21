// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// 获取用户人物收藏列表
    static public func getUserPersonCollections(username: String) -> Request<BangumiKit.PagedUserPersonCollection> {
        Request(path: "/v0/users/\(username)/collections/-/persons", method: "GET", id: "getUserPersonCollections")
    }
}
