// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Edit index's information
    static public func editIndexByID(indexID: Int, _ body: BangumiKit.IndexBasicInfo? = nil) -> Request<BangumiKit.Index> {
        Request(path: "/v0/indices/\(indexID)", method: "PUT", body: body, id: "editIndexById")
    }
}
