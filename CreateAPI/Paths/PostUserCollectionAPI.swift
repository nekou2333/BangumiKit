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
    /// 新增或修改用户单个条目收藏
    ///
    /// 修改条目收藏状态, 如果不存在则创建，如果存在则修改
    /// 
    /// 由于直接修改剧集条目的完成度可能会引起意料之外效果，只能用于修改书籍类条目的完成度。
    /// 
    /// 方法的所有请求体字段均可选
    static public func postUserCollection(subjectID: Int, _ body: JellyfinAPI.UserSubjectCollectionModifyPayload? = nil) -> Request<Void> {
        Request(path: "/v0/users/-/collections/\(subjectID)", method: "POST", body: body, id: "postUserCollection")
    }
}
