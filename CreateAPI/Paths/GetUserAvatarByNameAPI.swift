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
    /// Get User Avatar by name
    ///
    /// 获取用户头像，302 重定向至头像地址，设置了 username 之后无法使用 UID 查询。
    static public func getUserAvatarByName(username: String, type: String) -> Request<Void> {
        Request(path: "/v0/users/\(username)/avatar", method: "GET", query: [("type", type)], id: "getUserAvatarByName")
    }
}
