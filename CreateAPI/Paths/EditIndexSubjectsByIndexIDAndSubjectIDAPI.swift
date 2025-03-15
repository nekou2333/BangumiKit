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
    /// Edit subject information in a index
    ///
    /// 如果条目不存在于目录，会创建该条目
    static public func editIndexSubjectsByIndexIDAndSubjectID(indexID: Int, subjectID: Int, _ body: JellyfinAPI.IndexSubjectEditInfo? = nil) -> Request<Void> {
        Request(path: "/v0/indices/\(indexID)/subjects/\(subjectID)", method: "PUT", body: body, id: "editIndexSubjectsByIndexIdAndSubjectID")
    }
}
