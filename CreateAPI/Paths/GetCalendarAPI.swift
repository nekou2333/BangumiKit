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
    /// 每日放送
    static public var getCalendar: Request<[GetCalendarResponseItem]> {
        Request(path: "/calendar", method: "GET", id: "getCalendar")
    }

    public struct GetCalendarResponseItem: Decodable, Hashable {
        public var items: [JellyfinAPI.LegacySubjectSmall]?
        public var weekday: Weekday?

        public struct Weekday: Decodable, Hashable, Identifiable {
            /// Example: "星期一"
            public var cn: String?
            /// Example: "Mon"
            public var en: String?
            public var id: Int?
            /// Example: "月耀日"
            public var ja: String?

            public init(cn: String? = nil, en: String? = nil, id: Int? = nil, ja: String? = nil) {
                self.cn = cn
                self.en = en
                self.id = id
                self.ja = ja
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.cn = try values.decodeIfPresent(String.self, forKey: "cn")
                self.en = try values.decodeIfPresent(String.self, forKey: "en")
                self.id = try values.decodeIfPresent(Int.self, forKey: "id")
                self.ja = try values.decodeIfPresent(String.self, forKey: "ja")
            }
        }

        public init(items: [JellyfinAPI.LegacySubjectSmall]? = nil, weekday: Weekday? = nil) {
            self.items = items
            self.weekday = weekday
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.items = try values.decodeIfPresent([JellyfinAPI.LegacySubjectSmall].self, forKey: "items")
            self.weekday = try values.decodeIfPresent(Weekday.self, forKey: "weekday")
        }
    }
}
