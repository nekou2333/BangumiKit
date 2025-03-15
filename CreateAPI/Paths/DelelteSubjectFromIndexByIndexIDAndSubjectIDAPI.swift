// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Delete a subject from a Index
    static public func delelteSubjectFromIndexByIndexIDAndSubjectID(indexID: Int, subjectID: Int) -> Request<Void> {
        Request(path: "/v0/indices/\(indexID)/subjects/\(subjectID)", method: "DELETE", id: "delelteSubjectFromIndexByIndexIdAndSubjectID")
    }
}
