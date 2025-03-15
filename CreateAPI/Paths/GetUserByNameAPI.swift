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
    /// Get User by name
    ///
    /// 获取用户信息
    static public func getUserByName(username: String) -> Request<JellyfinAPI.User> {
        Request(path: "/v0/users/\(username)", method: "GET", id: "getUserByName")
    }
}
