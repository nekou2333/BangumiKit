// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// 获取条目
    ///
    /// Cache with 300s
    static public func getSubjectByID(subjectID: Int) -> Request<JellyfinAPI.Subject> {
        Request(path: "/v0/subjects/\(subjectID)", method: "GET", id: "getSubjectById")
    }
}
