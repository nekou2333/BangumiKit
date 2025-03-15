// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Uncollect index for current user
    ///
    /// 为当前用户取消收藏一条目录
    static public func uncollectIndexByIndexIDAndUserId(indexID: Int) -> Request<Void> {
        Request(path: "/v0/indices/\(indexID)/collect", method: "DELETE", id: "uncollectIndexByIndexIdAndUserId")
    }
}
