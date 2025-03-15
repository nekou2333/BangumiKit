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
    /// 获取用户收藏
    ///
    /// 获取对应用户的收藏，查看私有收藏需要access token。
    static public func getUserCollectionsByUsername(username: String, parameters: GetUserCollectionsByUsernameParameters? = nil) -> Request<JellyfinAPI.PagedUserCollection> {
        Request(path: "/v0/users/\(username)/collections", method: "GET", query: parameters?.asQuery, id: "getUserCollectionsByUsername")
    }

    public struct GetUserCollectionsByUsernameParameters {
        /// 条目类型
        /// - `1` 为 书籍
        /// - `2` 为 动画
        /// - `3` 为 音乐
        /// - `4` 为 游戏
        /// - `6` 为 三次元
        /// 
        /// 没有 `5`
        public var subjectType: Int?
        public var type: `Type`?
        public var limit: Int?
        public var offset: Int?

        public typealias `Type` = Int

        public init(subjectType: Int? = nil, type: `Type`? = nil, limit: Int? = nil, offset: Int? = nil) {
            self.subjectType = subjectType
            self.type = type
            self.limit = limit
            self.offset = offset
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(subjectType, forKey: "subject_type")
            encoder.encode(type, forKey: "type")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(offset, forKey: "offset")
            return encoder.items
        }
    }
}
