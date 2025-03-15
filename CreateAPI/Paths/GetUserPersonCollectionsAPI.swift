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
    /// 获取用户人物收藏列表
    static public func getUserPersonCollections(username: String) -> Request<JellyfinAPI.PagedUserPersonCollection> {
        Request(path: "/v0/users/\(username)/collections/-/persons", method: "GET", id: "getUserPersonCollections")
    }
}
