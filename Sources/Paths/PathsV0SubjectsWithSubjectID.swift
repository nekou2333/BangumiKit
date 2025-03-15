// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

public extension Paths.V0.Subjects {
    func subjectID(_ subjectID: Int) -> WithSubjectID {
        WithSubjectID(path: "\(path)/\(subjectID)")
    }

    struct WithSubjectID {
        /// Path: `/v0/subjects/{subject_id}`
        public let path: String

        /// 获取条目
        ///
        /// Cache with 300s
        public var get: Request<BangumiKit.Subject> {
            Request(path: path, method: "GET", id: "getSubjectById")
        }
    }
}
