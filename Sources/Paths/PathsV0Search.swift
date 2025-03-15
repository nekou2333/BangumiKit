// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

public extension Paths.V0 {
    var search: Search {
        Search(path: path + "/search")
    }

    struct Search {
        /// Path: `/v0/search`
        public let path: String
    }
}
