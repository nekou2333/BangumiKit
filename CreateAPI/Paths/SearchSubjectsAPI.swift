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
    /// 条目搜索
    ///
    /// ## 实验性 API， 本 schema 和实际的 API 行为都可能随时发生改动
    /// 
    /// 目前支持的筛选条件包括:
    /// - `type`: 条目类型，参照 `SubjectType` enum， `或`。
    /// - `tag`: 标签，可以多次出现。`且` 关系。
    /// - `airdate`: 播出日期/发售日期。`且` 关系。
    /// - `rating`: 用于搜索指定评分的条目。`且` 关系。
    /// - `rank`: 用于搜索指定排名的条目。`且` 关系。
    /// - `nsfw`: 使用 `include` 包含NSFW搜索结果。默认排除搜索NSFW条目。无权限情况下忽略此选项，不会返回NSFW条目。
    /// 
    /// 不同筛选条件之间为 `且`
    static public func searchSubjects(limit: Int? = nil, offset: Int? = nil, _ body: SearchSubjectsRequest? = nil) -> Request<JellyfinAPI.PagedSubject> {
        Request(path: "/v0/search/subjects", method: "POST", query: makeSearchSubjectsQuery(limit, offset), body: body, id: "searchSubjects")
    }

    private static func makeSearchSubjectsQuery(_ limit: Int?, _ offset: Int?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(limit, forKey: "limit")
        encoder.encode(offset, forKey: "offset")
        return encoder.items
    }

    public struct SearchSubjectsRequest: Encodable, Hashable {
        /// 不同条件之间是 `且` 的关系
        public var filter: Filter?
        public var keyword: String
        /// 排序规则
        /// 
        /// - `match` meilisearch 的默认排序，按照匹配程度
        /// - `heat` 收藏人数
        /// - `rank` 排名由高到低
        /// - `score` 评分
        ///
        /// Example: "rank"
        public var sort: Sort?

        /// 不同条件之间是 `且` 的关系
        public struct Filter: Encodable, Hashable {
            /// 播出日期/发售日期，日期必需为 `YYYY-MM-DD` 格式。多值之间为 `且` 关系。
            ///
            /// Example: [">=2020-07-01", "<2020-10-01"]
            public var airDate: [String]?
            /// 公共标签。多个值之间为 `且` 关系。可以用 `-` 排除标签。比如 `-科幻` 可以排除科幻标签。
            ///
            /// Example: ["童年", "原创"]
            public var metaTags: [String]?
            /// 无权限的用户会直接忽略此字段，不会返回R18条目。
            /// 
            /// 默认或者 `null` 会返回包含 R18 的所有搜索结果。
            /// 
            /// `true` 只会返回 R18 条目。
            /// 
            /// `false` 只会返回非 R18 条目。
            public var isNsfw: Bool?
            /// 用于搜索指定排名的条目，多值之间为 `且` 关系。
            ///
            /// Example: [">10", "<=18"]
            public var rank: [String]?
            /// 用于搜索指定评分的条目，多值之间为 `且` 关系。
            ///
            /// Example: [">=6", "<8"]
            public var rating: [String]?
            /// 标签，可以多次出现。多值之间为 `且` 关系。
            ///
            /// Example: ["童年", "原创"]
            public var tag: [String]?
            /// 条目类型，参照 `SubjectType` enum，多值之间为 `或` 的关系。
            public var type: [Int]?

            public init(airDate: [String]? = nil, metaTags: [String]? = nil, isNsfw: Bool? = nil, rank: [String]? = nil, rating: [String]? = nil, tag: [String]? = nil, type: [Int]? = nil) {
                self.airDate = airDate
                self.metaTags = metaTags
                self.isNsfw = isNsfw
                self.rank = rank
                self.rating = rating
                self.tag = tag
                self.type = type
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(airDate, forKey: "air_date")
                try values.encodeIfPresent(metaTags, forKey: "meta_tags")
                try values.encodeIfPresent(isNsfw, forKey: "nsfw")
                try values.encodeIfPresent(rank, forKey: "rank")
                try values.encodeIfPresent(rating, forKey: "rating")
                try values.encodeIfPresent(tag, forKey: "tag")
                try values.encodeIfPresent(type, forKey: "type")
            }
        }

        /// 排序规则
        /// 
        /// - `match` meilisearch 的默认排序，按照匹配程度
        /// - `heat` 收藏人数
        /// - `rank` 排名由高到低
        /// - `score` 评分
        ///
        /// Example: "rank"
        public enum Sort: String, Codable, CaseIterable {
            case match
            case heat
            case rank
            case score
        }

        public init(filter: Filter? = nil, keyword: String, sort: Sort? = nil) {
            self.filter = filter
            self.keyword = keyword
            self.sort = sort
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(filter, forKey: "filter")
            try values.encode(keyword, forKey: "keyword")
            try values.encodeIfPresent(sort, forKey: "sort")
        }
    }
}
