//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Get Person
    ///
    /// Cache with 60s
    static public func getPersonByID(personID: Int) -> Request<JellyfinAPI.PersonDetail> {
        Request(path: "/v0/persons/\(personID)", method: "GET", id: "getPersonById")
    }
}
