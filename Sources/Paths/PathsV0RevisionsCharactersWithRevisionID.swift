// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

public extension Paths.V0.Revisions.Characters {
    func revisionID(_ revisionID: Int) -> WithRevisionID {
        WithRevisionID(path: "\(path)/\(revisionID)")
    }

    struct WithRevisionID {
        /// Path: `/v0/revisions/characters/{revision_id}`
        public let path: String

        /// Get Character Revision
        public var get: Request<BangumiKit.CharacterRevision> {
            Request(path: path, method: "GET", id: "getCharacterRevisionByRevisionId")
        }
    }
}
