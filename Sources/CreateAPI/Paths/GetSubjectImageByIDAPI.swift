// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Get Subject Image
    static public func getSubjectImageByID(subjectID: Int, type: String) -> Request<Void> {
        Request(path: "/v0/subjects/\(subjectID)/image", method: "GET", query: [("type", type)], id: "getSubjectImageById")
    }
}
