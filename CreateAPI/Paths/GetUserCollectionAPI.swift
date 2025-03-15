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
    /// 获取用户单个条目收藏
    ///
    /// 获取对应用户的收藏，查看私有收藏需要 access token
    static public func getUserCollection(username: String, subjectID: Int) -> Request<JellyfinAPI.UserSubjectCollection> {
        Request(path: "/v0/users/\(username)/collections/\(subjectID)", method: "GET", id: "getUserCollection")
    }
}
