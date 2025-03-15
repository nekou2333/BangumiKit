// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Get Subject Characters
    static public func getRelatedCharactersBySubjectID(subjectID: Int) -> Request<[JellyfinAPI.RelatedCharacter]> {
        Request(path: "/v0/subjects/\(subjectID)/characters", method: "GET", id: "getRelatedCharactersBySubjectId")
    }
}
