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
    /// 更新章节收藏信息
    static public func putUserEpisodeCollection(episodeID: Int, type: Int) -> Request<Void> {
        Request(path: "/v0/users/-/collections/-/episodes/\(episodeID)", method: "PUT", body: ["type": type], id: "putUserEpisodeCollection")
    }
}
