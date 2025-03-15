// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// 获取用户单个人物收藏信息
    static public func getUserPersonCollection(username: String, personID: Int) -> Request<BangumiKit.UserPersonCollection> {
        Request(path: "/v0/users/\(username)/collections/-/persons/\(personID)", method: "GET", id: "getUserPersonCollection")
    }
}
