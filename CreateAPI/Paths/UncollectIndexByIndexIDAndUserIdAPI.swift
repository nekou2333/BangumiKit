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
    /// Uncollect index for current user
    ///
    /// 为当前用户取消收藏一条目录
    static public func uncollectIndexByIndexIDAndUserId(indexID: Int) -> Request<Void> {
        Request(path: "/v0/indices/\(indexID)/collect", method: "DELETE", id: "uncollectIndexByIndexIdAndUserId")
    }
}
