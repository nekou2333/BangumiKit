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
    /// Get Index By ID
    static public func getIndexByID(indexID: Int) -> Request<JellyfinAPI.Index> {
        Request(path: "/v0/indices/\(indexID)", method: "GET", id: "getIndexById")
    }
}
