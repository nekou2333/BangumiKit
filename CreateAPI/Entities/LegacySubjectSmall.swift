//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct LegacySubjectSmall: Codable, Hashable, Identifiable {
    /// 放送开始日期
    ///
    /// Example: "2002-04-02"
    public var airDate: String?
    /// 放送星期
    public var airWeekday: Int?
    /// 收藏人数
    public var collection: Collection?
    /// 话数
    ///
    /// Example: 27
    public var eps: Int?
    /// 话数
    ///
    /// Example: 27
    public var epsCount: Int?
    /// 条目 ID
    ///
    /// Example: 12
    public var id: Int?
    /// 封面
    public var images: Images?
    /// 条目名称
    ///
    /// Example: "ちょびっツ"
    public var name: String?
    /// 条目中文名称
    ///
    /// Example: "人形电脑天使心"
    public var nameCn: String?
    /// 排名
    ///
    /// Example: 573
    public var rank: Int?
    /// 评分
    public var rating: Rating?
    /// 剧情简介
    ///
    /// Example: "在不久的将来,电子技术飞速发展,电脑成为人们生活中不可缺少的一部分.主角的名字是本须和秀树,是个19岁的少年,由于考试失败,来到东京上补习班,过着贫穷潦倒的生活……\r\n到达东京的第一天,他很幸运的在垃圾堆捡到一个人型电脑,一直以来秀树都非常渴望拥有个人电脑.当他抱着她带返公寓后,却不知如何开机,在意想不到的地方找到开关并开启后,故事就此展开\r\n本须和秀树捡到了人型计算机〔唧〕。虽然不晓得她到底是不是〔Chobits〕，但她的身上似乎藏有极大的秘密。看到秀树为了钱而烦恼，唧出去找打工，没想到却找到了危险的工作！为了让秀树开心，唧开始到色情小屋打工。但她在遭到过度激烈的强迫要求之后失控。让周遭计算机因此而强制停摆。\r\n另一方面，秀树发现好友新保与补习班的清水老师有着不可告人的关系……"
    public var summary: String?
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
    /// 条目地址
    ///
    /// Example: "https://bgm.tv/subject/12"
    public var url: String?

    /// 收藏人数
    public struct Collection: Codable, Hashable {
        /// 做过
        ///
        /// Example: 3010
        public var collect: Int?
        /// 在做
        ///
        /// Example: 103
        public var doing: Int?
        /// 抛弃
        ///
        /// Example: 86
        public var dropped: Int?
        /// 搁置
        ///
        /// Example: 284
        public var onHold: Int?
        /// 想做
        ///
        /// Example: 608
        public var wish: Int?

        public init(collect: Int? = nil, doing: Int? = nil, dropped: Int? = nil, onHold: Int? = nil, wish: Int? = nil) {
            self.collect = collect
            self.doing = doing
            self.dropped = dropped
            self.onHold = onHold
            self.wish = wish
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.collect = try values.decodeIfPresent(Int.self, forKey: "collect")
            self.doing = try values.decodeIfPresent(Int.self, forKey: "doing")
            self.dropped = try values.decodeIfPresent(Int.self, forKey: "dropped")
            self.onHold = try values.decodeIfPresent(Int.self, forKey: "on_hold")
            self.wish = try values.decodeIfPresent(Int.self, forKey: "wish")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(collect, forKey: "collect")
            try values.encodeIfPresent(doing, forKey: "doing")
            try values.encodeIfPresent(dropped, forKey: "dropped")
            try values.encodeIfPresent(onHold, forKey: "on_hold")
            try values.encodeIfPresent(wish, forKey: "wish")
        }
    }

    /// 封面
    public struct Images: Codable, Hashable {
        /// Example: "https://lain.bgm.tv/pic/cover/c/c2/0a/12_24O6L.jpg"
        public var common: String?
        /// Example: "https://lain.bgm.tv/pic/cover/g/c2/0a/12_24O6L.jpg"
        public var grid: String?
        /// Example: "https://lain.bgm.tv/pic/cover/l/c2/0a/12_24O6L.jpg"
        public var large: String?
        /// Example: "https://lain.bgm.tv/pic/cover/m/c2/0a/12_24O6L.jpg"
        public var medium: String?
        /// Example: "https://lain.bgm.tv/pic/cover/s/c2/0a/12_24O6L.jpg"
        public var small: String?

        public init(common: String? = nil, grid: String? = nil, large: String? = nil, medium: String? = nil, small: String? = nil) {
            self.common = common
            self.grid = grid
            self.large = large
            self.medium = medium
            self.small = small
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.common = try values.decodeIfPresent(String.self, forKey: "common")
            self.grid = try values.decodeIfPresent(String.self, forKey: "grid")
            self.large = try values.decodeIfPresent(String.self, forKey: "large")
            self.medium = try values.decodeIfPresent(String.self, forKey: "medium")
            self.small = try values.decodeIfPresent(String.self, forKey: "small")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(common, forKey: "common")
            try values.encodeIfPresent(grid, forKey: "grid")
            try values.encodeIfPresent(large, forKey: "large")
            try values.encodeIfPresent(medium, forKey: "medium")
            try values.encodeIfPresent(small, forKey: "small")
        }
    }

    /// 评分
    public struct Rating: Codable, Hashable {
        /// 各分值评分人数
        public var count: Count?
        /// 评分
        ///
        /// Example: 7.6
        public var score: Double?
        /// 总评分人数
        ///
        /// Example: 2289
        public var total: Int?

        /// 各分值评分人数
        public struct Count: Codable, Hashable {
            public var _1: Int?
            /// Example: 130
            public var _10: Int?
            public var _2: Int?
            public var _3: Int?
            public var _4: Int?
            /// Example: 46
            public var _5: Int?
            /// Example: 267
            public var _6: Int?
            /// Example: 659
            public var _7: Int?
            /// Example: 885
            public var _8: Int?
            /// Example: 284
            public var _9: Int?

            public init(_1: Int? = nil, _10: Int? = nil, _2: Int? = nil, _3: Int? = nil, _4: Int? = nil, _5: Int? = nil, _6: Int? = nil, _7: Int? = nil, _8: Int? = nil, _9: Int? = nil) {
                self._1 = _1
                self._10 = _10
                self._2 = _2
                self._3 = _3
                self._4 = _4
                self._5 = _5
                self._6 = _6
                self._7 = _7
                self._8 = _8
                self._9 = _9
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self._1 = try values.decodeIfPresent(Int.self, forKey: "1")
                self._10 = try values.decodeIfPresent(Int.self, forKey: "10")
                self._2 = try values.decodeIfPresent(Int.self, forKey: "2")
                self._3 = try values.decodeIfPresent(Int.self, forKey: "3")
                self._4 = try values.decodeIfPresent(Int.self, forKey: "4")
                self._5 = try values.decodeIfPresent(Int.self, forKey: "5")
                self._6 = try values.decodeIfPresent(Int.self, forKey: "6")
                self._7 = try values.decodeIfPresent(Int.self, forKey: "7")
                self._8 = try values.decodeIfPresent(Int.self, forKey: "8")
                self._9 = try values.decodeIfPresent(Int.self, forKey: "9")
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(_1, forKey: "1")
                try values.encodeIfPresent(_10, forKey: "10")
                try values.encodeIfPresent(_2, forKey: "2")
                try values.encodeIfPresent(_3, forKey: "3")
                try values.encodeIfPresent(_4, forKey: "4")
                try values.encodeIfPresent(_5, forKey: "5")
                try values.encodeIfPresent(_6, forKey: "6")
                try values.encodeIfPresent(_7, forKey: "7")
                try values.encodeIfPresent(_8, forKey: "8")
                try values.encodeIfPresent(_9, forKey: "9")
            }
        }

        public init(count: Count? = nil, score: Double? = nil, total: Int? = nil) {
            self.count = count
            self.score = score
            self.total = total
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.count = try values.decodeIfPresent(Count.self, forKey: "count")
            self.score = try values.decodeIfPresent(Double.self, forKey: "score")
            self.total = try values.decodeIfPresent(Int.self, forKey: "total")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(count, forKey: "count")
            try values.encodeIfPresent(score, forKey: "score")
            try values.encodeIfPresent(total, forKey: "total")
        }
    }

    public init(airDate: String? = nil, airWeekday: Int? = nil, collection: Collection? = nil, eps: Int? = nil, epsCount: Int? = nil, id: Int? = nil, images: Images? = nil, name: String? = nil, nameCn: String? = nil, rank: Int? = nil, rating: Rating? = nil, summary: String? = nil, type: Int? = nil, url: String? = nil) {
        self.airDate = airDate
        self.airWeekday = airWeekday
        self.collection = collection
        self.eps = eps
        self.epsCount = epsCount
        self.id = id
        self.images = images
        self.name = name
        self.nameCn = nameCn
        self.rank = rank
        self.rating = rating
        self.summary = summary
        self.type = type
        self.url = url
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.airDate = try values.decodeIfPresent(String.self, forKey: "air_date")
        self.airWeekday = try values.decodeIfPresent(Int.self, forKey: "air_weekday")
        self.collection = try values.decodeIfPresent(Collection.self, forKey: "collection")
        self.eps = try values.decodeIfPresent(Int.self, forKey: "eps")
        self.epsCount = try values.decodeIfPresent(Int.self, forKey: "eps_count")
        self.id = try values.decodeIfPresent(Int.self, forKey: "id")
        self.images = try values.decodeIfPresent(Images.self, forKey: "images")
        self.name = try values.decodeIfPresent(String.self, forKey: "name")
        self.nameCn = try values.decodeIfPresent(String.self, forKey: "name_cn")
        self.rank = try values.decodeIfPresent(Int.self, forKey: "rank")
        self.rating = try values.decodeIfPresent(Rating.self, forKey: "rating")
        self.summary = try values.decodeIfPresent(String.self, forKey: "summary")
        self.type = try values.decodeIfPresent(Int.self, forKey: "type")
        self.url = try values.decodeIfPresent(String.self, forKey: "url")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(airDate, forKey: "air_date")
        try values.encodeIfPresent(airWeekday, forKey: "air_weekday")
        try values.encodeIfPresent(collection, forKey: "collection")
        try values.encodeIfPresent(eps, forKey: "eps")
        try values.encodeIfPresent(epsCount, forKey: "eps_count")
        try values.encodeIfPresent(id, forKey: "id")
        try values.encodeIfPresent(images, forKey: "images")
        try values.encodeIfPresent(name, forKey: "name")
        try values.encodeIfPresent(nameCn, forKey: "name_cn")
        try values.encodeIfPresent(rank, forKey: "rank")
        try values.encodeIfPresent(rating, forKey: "rating")
        try values.encodeIfPresent(summary, forKey: "summary")
        try values.encodeIfPresent(type, forKey: "type")
        try values.encodeIfPresent(url, forKey: "url")
    }
}
