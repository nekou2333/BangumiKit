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
    /// 角色搜索
    ///
    /// ## 实验性 API， 本 schema 和实际的 API 行为都可能随时发生改动
    /// 
    /// 目前支持的筛选条件包括:
    /// - `nsfw`: 使用 `include` 包含NSFW搜索结果。默认排除搜索NSFW条目。无权限情况下忽略此选项，不会返回NSFW条目。
    static public func searchCharacters(limit: Int? = nil, offset: Int? = nil, _ body: SearchCharactersRequest? = nil) -> Request<JellyfinAPI.PagedCharacter> {
        Request(path: "/v0/search/characters", method: "POST", query: makeSearchCharactersQuery(limit, offset), body: body, id: "searchCharacters")
    }

    private static func makeSearchCharactersQuery(_ limit: Int?, _ offset: Int?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(limit, forKey: "limit")
        encoder.encode(offset, forKey: "offset")
        return encoder.items
    }

    public struct SearchCharactersRequest: Encodable, Hashable {
        /// 不同条件之间是 `且` 的关系
        public var filter: Filter?
        public var keyword: String

        /// 不同条件之间是 `且` 的关系
        public struct Filter: Encodable, Hashable {
            /// 无权限的用户会直接忽略此字段，不会返回 R18 角色。
            /// 
            /// 默认或者 `null` 会返回包含 R18 的所有搜索结果。
            /// 
            /// `true` 只会返回 R18 角色。
            /// 
            /// `false` 只会返回非 R18 角色。
            public var isNsfw: Bool?

            public init(isNsfw: Bool? = nil) {
                self.isNsfw = isNsfw
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(isNsfw, forKey: "nsfw")
            }
        }

        public init(filter: Filter? = nil, keyword: String) {
            self.filter = filter
            self.keyword = keyword
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(filter, forKey: "filter")
            try values.encode(keyword, forKey: "keyword")
        }
    }
}
