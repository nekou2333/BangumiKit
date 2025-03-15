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
    /// Collect person for current user
    ///
    /// 为当前用户收藏人物
    static public func collectPersonByPersonIDAndUserId(personID: Int) -> Request<Void> {
        Request(path: "/v0/persons/\(personID)/collect", method: "POST", id: "collectPersonByPersonIdAndUserId")
    }
}
