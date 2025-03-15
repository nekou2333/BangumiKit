// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

public extension Paths.V0.Persons.WithPersonID {
    var characters: Characters {
        Characters(path: path + "/characters")
    }

    struct Characters {
        /// Path: `/v0/persons/{person_id}/characters`
        public let path: String

        /// Get person related characters
        public var get: Request<[BangumiKit.PersonCharacter]> {
            Request(path: path, method: "GET", id: "getRelatedCharactersByPersonId")
        }
    }
}
