// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Get Character Revision
    static public func getCharacterRevisionByRevisionID(revisionID: Int) -> Request<BangumiKit.CharacterRevision> {
        Request(path: "/v0/revisions/characters/\(revisionID)", method: "GET", id: "getCharacterRevisionByRevisionId")
    }
}
