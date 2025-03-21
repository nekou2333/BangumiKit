// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Edit subject information in a index
    ///
    /// 如果条目不存在于目录，会创建该条目
    static public func editIndexSubjectsByIndexIDAndSubjectID(indexID: Int, subjectID: Int, _ body: BangumiKit.IndexSubjectEditInfo? = nil) -> Request<Void> {
        Request(path: "/v0/indices/\(indexID)/subjects/\(subjectID)", method: "PUT", body: body, id: "editIndexSubjectsByIndexIdAndSubjectID")
    }
}
