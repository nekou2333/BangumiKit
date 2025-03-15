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
    /// Edit index's information
    static public func editIndexByID(indexID: Int, _ body: JellyfinAPI.IndexBasicInfo? = nil) -> Request<JellyfinAPI.Index> {
        Request(path: "/v0/indices/\(indexID)", method: "PUT", body: body, id: "editIndexById")
    }
}
