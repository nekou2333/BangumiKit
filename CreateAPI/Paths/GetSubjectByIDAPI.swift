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
    /// 获取条目
    ///
    /// Cache with 300s
    static public func getSubjectByID(subjectID: Int) -> Request<JellyfinAPI.Subject> {
        Request(path: "/v0/subjects/\(subjectID)", method: "GET", id: "getSubjectById")
    }
}
