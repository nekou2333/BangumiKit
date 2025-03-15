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
    /// Get Index Subjects
    static public func getIndexSubjectsByIndexID(indexID: Int, parameters: GetIndexSubjectsByIndexIDParameters? = nil) -> Request<Void> {
        Request(path: "/v0/indices/\(indexID)/subjects", method: "GET", query: parameters?.asQuery, id: "getIndexSubjectsByIndexId")
    }

    public struct GetIndexSubjectsByIndexIDParameters {
        /// SubjectType
        ///
        /// 条目类型
        /// - `1` 为 书籍
        /// - `2` 为 动画
        /// - `3` 为 音乐
        /// - `4` 为 游戏
        /// - `6` 为 三次元
        /// 
        /// 没有 `5`
        public var type: Int?
        public var limit: Int?
        public var offset: Int?

        public init(type: Int? = nil, limit: Int? = nil, offset: Int? = nil) {
            self.type = type
            self.limit = limit
            self.offset = offset
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(type, forKey: "type")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(offset, forKey: "offset")
            return encoder.items
        }
    }
}
