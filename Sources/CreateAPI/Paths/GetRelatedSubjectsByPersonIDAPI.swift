// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Get person related subjects
    static public func getRelatedSubjectsByPersonID(personID: Int) -> Request<[BangumiKit.V0RelatedSubject]> {
        Request(path: "/v0/persons/\(personID)/subjects", method: "GET", id: "getRelatedSubjectsByPersonId")
    }
}
