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
    /// 浏览条目
    ///
    /// 第一页会 cache 24h，之后会 cache 1h
    static public func getSubjects(parameters: GetSubjectsParameters) -> Request<JellyfinAPI.PagedSubject> {
        Request(path: "/v0/subjects", method: "GET", query: parameters.asQuery, id: "getSubjects")
    }

    public struct GetSubjectsParameters {
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
        public var type: Int
        public var cat: Cat?
        public var isSeries: Bool?
        public var platform: String?
        /// Sort Order
        public var sort: String?
        public var year: Int?
        public var month: Int?
        public var limit: Int?
        public var offset: Int?

        public struct Cat: Codable, Hashable {
            /// SubjectBookCategory
            ///
            /// 书籍类型
            /// - `0` 为 其他
            /// - `1001` 为 漫画
            /// - `1002` 为 小说
            /// - `1003` 为 画集
            ///
            /// Example: 1001
            public var int: Int?
            /// SubjectAnimeCategory
            ///
            /// 动画类型
            /// - `0` 为 其他
            /// - `1` 为 TV
            /// - `2` 为 OVA
            /// - `3` 为 Movie
            /// - `5` 为 WEB
            public var int2: Int?
            /// SubjectGameCategory
            ///
            /// 游戏类型
            /// - `0` 为 其他
            /// - `4001` 为 游戏
            /// - `4002` 为 软件
            /// - `4003` 为 扩展包
            /// - `4005` 为 桌游
            ///
            /// Example: 4001
            public var int3: Int?
            /// SubjectRealCategory
            ///
            /// 电影类型
            /// - `0` 为 其他
            /// - `1` 为 日剧
            /// - `2` 为 欧美剧
            /// - `3` 为 华语剧
            /// - `6001` 为 电视剧
            /// - `6002` 为 电影
            /// - `6003` 为 演出
            /// - `6004` 为 综艺
            public var int4: Int?

            public init(int: Int? = nil, int2: Int? = nil, int3: Int? = nil, int4: Int? = nil) {
                self.int = int
                self.int2 = int2
                self.int3 = int3
                self.int4 = int4
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(int, forKey: "int")
                encoder.encode(int2, forKey: "int2")
                encoder.encode(int3, forKey: "int3")
                encoder.encode(int4, forKey: "int4")
                return encoder.items
            }
        }

        public init(type: Int, cat: Cat? = nil, isSeries: Bool? = nil, platform: String? = nil, sort: String? = nil, year: Int? = nil, month: Int? = nil, limit: Int? = nil, offset: Int? = nil) {
            self.type = type
            self.cat = cat
            self.isSeries = isSeries
            self.platform = platform
            self.sort = sort
            self.year = year
            self.month = month
            self.limit = limit
            self.offset = offset
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(type, forKey: "type")
            encoder.encode(cat, forKey: "cat")
            encoder.encode(isSeries, forKey: "series")
            encoder.encode(platform, forKey: "platform")
            encoder.encode(sort, forKey: "sort")
            encoder.encode(year, forKey: "year")
            encoder.encode(month, forKey: "month")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(offset, forKey: "offset")
            return encoder.items
        }
    }
}
