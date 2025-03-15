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
    /// 人物搜索
    ///
    /// ## 实验性 API， 本 schema 和实际的 API 行为都可能随时发生改动
    /// 
    /// 目前支持的筛选条件包括:
    /// - `career`: 职业，可以多次出现。`且` 关系。
    /// 
    /// 不同筛选条件之间为 `且`
    static public func searchPersons(limit: Int? = nil, offset: Int? = nil, _ body: SearchPersonsRequest? = nil) -> Request<JellyfinAPI.PagedPerson> {
        Request(path: "/v0/search/persons", method: "POST", query: makeSearchPersonsQuery(limit, offset), body: body, id: "searchPersons")
    }

    private static func makeSearchPersonsQuery(_ limit: Int?, _ offset: Int?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(limit, forKey: "limit")
        encoder.encode(offset, forKey: "offset")
        return encoder.items
    }

    public struct SearchPersonsRequest: Encodable, Hashable {
        /// 不同条件之间是 `且` 的关系
        public var filter: Filter?
        public var keyword: String

        /// 不同条件之间是 `且` 的关系
        public struct Filter: Encodable, Hashable {
            /// 职业，可以多次出现。多值之间为 `且` 关系。
            ///
            /// Example: ["artist", "director"]
            public var career: [String]?

            public init(career: [String]? = nil) {
                self.career = career
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(career, forKey: "career")
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
