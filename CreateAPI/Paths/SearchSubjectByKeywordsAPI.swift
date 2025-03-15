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
    static public func searchSubjectByKeywords(keywords: String, parameters: SearchSubjectByKeywordsParameters? = nil) -> Request<SearchSubjectByKeywordsResponse> {
        Request(path: "/search/subject/\(keywords)", method: "GET", query: parameters?.asQuery, id: "searchSubjectByKeywords")
    }

    public enum SearchSubjectByKeywordsResponse: Decodable, Hashable {
        case a(A)
        case b(B)
        case c(C)

        public struct A: Decodable, Hashable {
            /// 结果列表
            public var list: [JellyfinAPI.LegacySubjectSmall]?
            /// 总条数
            public var results: Int?

            public init(list: [JellyfinAPI.LegacySubjectSmall]? = nil, results: Int? = nil) {
                self.list = list
                self.results = results
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.list = try values.decodeIfPresent([JellyfinAPI.LegacySubjectSmall].self, forKey: "list")
                self.results = try values.decodeIfPresent(Int.self, forKey: "results")
            }
        }

        public struct B: Decodable, Hashable {
            /// 结果列表
            public var list: [JellyfinAPI.LegacySubjectMedium]?
            /// 总条数
            public var results: Int?

            public init(list: [JellyfinAPI.LegacySubjectMedium]? = nil, results: Int? = nil) {
                self.list = list
                self.results = results
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.list = try values.decodeIfPresent([JellyfinAPI.LegacySubjectMedium].self, forKey: "list")
                self.results = try values.decodeIfPresent(Int.self, forKey: "results")
            }
        }

        public struct C: Decodable, Hashable {
            /// 结果列表
            public var list: [JellyfinAPI.LegacySubjectLarge]?
            /// 总条数
            public var results: Int?

            public init(list: [JellyfinAPI.LegacySubjectLarge]? = nil, results: Int? = nil) {
                self.list = list
                self.results = results
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.list = try values.decodeIfPresent([JellyfinAPI.LegacySubjectLarge].self, forKey: "list")
                self.results = try values.decodeIfPresent(Int.self, forKey: "results")
            }
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(A.self) {
                self = .a(value)
            } else if let value = try? container.decode(B.self) {
                self = .b(value)
            } else if let value = try? container.decode(C.self) {
                self = .c(value)
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Data could not be decoded as any of the expected types (A, B, C)."
                )
            }
        }
    }

    public struct SearchSubjectByKeywordsParameters {
        /// 条目类型 <br> 1 = book <br> 2 = anime <br> 3 = music <br> 4 = game <br> 6 = real
        public var type: Int?
        /// 返回数据大小
        public var responseGroup: ResponseGroup?
        public var start: Int?
        public var maxResults: Int?

        /// 返回数据大小
        public enum ResponseGroup: String, Codable, CaseIterable {
            case small
            case medium
            case large
        }

        public init(type: Int? = nil, responseGroup: ResponseGroup? = nil, start: Int? = nil, maxResults: Int? = nil) {
            self.type = type
            self.responseGroup = responseGroup
            self.start = start
            self.maxResults = maxResults
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(type, forKey: "type")
            encoder.encode(responseGroup, forKey: "responseGroup")
            encoder.encode(start, forKey: "start")
            encoder.encode(maxResults, forKey: "max_results")
            return encoder.items
        }
    }
}
