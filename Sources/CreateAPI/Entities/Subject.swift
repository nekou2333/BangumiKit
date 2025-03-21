// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct Subject: Codable, Hashable, Identifiable {
    public var collection: Collection
    /// Air date in `YYYY-MM-DD` format
    public var date: String?
    /// 由旧服务端从wiki中解析，对于书籍条目为`话数`
    public var eps: Int
    public var id: Int
    public var images: Images
    /// Example:
    ///
    /// [
    ///   {
    ///     "key" : "简体中文名",
    ///     "value" : "鲁路修·兰佩路基"
    ///   },
    ///   {
    ///     "key" : "别名",
    ///     "value" : [
    ///       {
    ///         "v" : "L.L."
    ///       },
    ///       {
    ///         "v" : "勒鲁什"
    ///       },
    ///       {
    ///         "v" : "鲁鲁修"
    ///       },
    ///       {
    ///         "v" : "ゼロ"
    ///       },
    ///       {
    ///         "v" : "Zero"
    ///       },
    ///       {
    ///         "k" : "英文名",
    ///         "v" : "Lelouch Lamperouge"
    ///       },
    ///       {
    ///         "k" : "第二中文名",
    ///         "v" : "鲁路修·冯·布里塔尼亚"
    ///       },
    ///       {
    ///         "k" : "英文名二",
    ///         "v" : "Lelouch Vie Britannia"
    ///       },
    ///       {
    ///         "k" : "日文名",
    ///         "v" : "ルルーシュ・ヴィ・ブリタニア"
    ///       }
    ///     ]
    ///   },
    ///   {
    ///     "key" : "性别",
    ///     "value" : "男"
    ///   },
    ///   {
    ///     "key" : "生日",
    ///     "value" : "12月5日"
    ///   },
    ///   {
    ///     "key" : "血型",
    ///     "value" : "A型"
    ///   },
    ///   {
    ///     "key" : "身高",
    ///     "value" : "178cm→181cm"
    ///   },
    ///   {
    ///     "key" : "体重",
    ///     "value" : "54kg"
    ///   },
    ///   {
    ///     "key" : "引用来源",
    ///     "value" : "Wikipedia"
    ///   }
    /// ]
    public var infobox: [WikiV0Item]?
    /// Locked
    public var isLocked: Bool
    /// 由维基人维护的 tag
    public var metaTags: [String]
    public var name: String
    public var nameCn: String
    /// Nsfw
    public var isNsfw: Bool
    /// TV, Web, 欧美剧, DLC...
    public var platform: String
    public var rating: Rating
    /// Series
    ///
    /// 是否为书籍系列的主条目
    public var isSeries: Bool
    public var summary: String
    public var tags: [SubjectTag]
    /// 数据库中的章节数量
    public var totalEpisodes: Int
    public var type: Int
    /// 书籍条目的册数，由旧服务端从wiki中解析
    public var volumes: Int

    public struct Collection: Codable, Hashable {
        public var collect: Int
        public var doing: Int
        public var dropped: Int
        public var onHold: Int
        public var wish: Int

        public init(collect: Int, doing: Int, dropped: Int, onHold: Int, wish: Int) {
            self.collect = collect
            self.doing = doing
            self.dropped = dropped
            self.onHold = onHold
            self.wish = wish
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.collect = try values.decode(Int.self, forKey: "collect")
            self.doing = try values.decode(Int.self, forKey: "doing")
            self.dropped = try values.decode(Int.self, forKey: "dropped")
            self.onHold = try values.decode(Int.self, forKey: "on_hold")
            self.wish = try values.decode(Int.self, forKey: "wish")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(collect, forKey: "collect")
            try values.encode(doing, forKey: "doing")
            try values.encode(dropped, forKey: "dropped")
            try values.encode(onHold, forKey: "on_hold")
            try values.encode(wish, forKey: "wish")
        }
    }

    public struct Rating: Codable, Hashable {
        public var count: Count
        public var rank: Int
        public var score: Double
        public var total: Int

        public struct Count: Codable, Hashable {
            public var _1: Int?
            public var _10: Int?
            public var _2: Int?
            public var _3: Int?
            public var _4: Int?
            public var _5: Int?
            public var _6: Int?
            public var _7: Int?
            public var _8: Int?
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

        public init(count: Count, rank: Int, score: Double, total: Int) {
            self.count = count
            self.rank = rank
            self.score = score
            self.total = total
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.count = try values.decode(Count.self, forKey: "count")
            self.rank = try values.decode(Int.self, forKey: "rank")
            self.score = try values.decode(Double.self, forKey: "score")
            self.total = try values.decode(Int.self, forKey: "total")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(count, forKey: "count")
            try values.encode(rank, forKey: "rank")
            try values.encode(score, forKey: "score")
            try values.encode(total, forKey: "total")
        }
    }

    public init(collection: Collection, date: String? = nil, eps: Int, id: Int, images: Images, infobox: [WikiV0Item]? = nil, isLocked: Bool, metaTags: [String], name: String, nameCn: String, isNsfw: Bool, platform: String, rating: Rating, isSeries: Bool, summary: String, tags: [SubjectTag], totalEpisodes: Int, type: Int, volumes: Int) {
        self.collection = collection
        self.date = date
        self.eps = eps
        self.id = id
        self.images = images
        self.infobox = infobox
        self.isLocked = isLocked
        self.metaTags = metaTags
        self.name = name
        self.nameCn = nameCn
        self.isNsfw = isNsfw
        self.platform = platform
        self.rating = rating
        self.isSeries = isSeries
        self.summary = summary
        self.tags = tags
        self.totalEpisodes = totalEpisodes
        self.type = type
        self.volumes = volumes
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.collection = try values.decode(Collection.self, forKey: "collection")
        self.date = try values.decodeIfPresent(String.self, forKey: "date")
        self.eps = try values.decode(Int.self, forKey: "eps")
        self.id = try values.decode(Int.self, forKey: "id")
        self.images = try values.decode(Images.self, forKey: "images")
        self.infobox = try values.decodeIfPresent([WikiV0Item].self, forKey: "infobox")
        self.isLocked = try values.decode(Bool.self, forKey: "locked")
        self.metaTags = try values.decode([String].self, forKey: "meta_tags")
        self.name = try values.decode(String.self, forKey: "name")
        self.nameCn = try values.decode(String.self, forKey: "name_cn")
        self.isNsfw = try values.decode(Bool.self, forKey: "nsfw")
        self.platform = try values.decode(String.self, forKey: "platform")
        self.rating = try values.decode(Rating.self, forKey: "rating")
        self.isSeries = try values.decode(Bool.self, forKey: "series")
        self.summary = try values.decode(String.self, forKey: "summary")
        self.tags = try values.decode([SubjectTag].self, forKey: "tags")
        self.totalEpisodes = try values.decode(Int.self, forKey: "total_episodes")
        self.type = try values.decode(Int.self, forKey: "type")
        self.volumes = try values.decode(Int.self, forKey: "volumes")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(collection, forKey: "collection")
        try values.encodeIfPresent(date, forKey: "date")
        try values.encode(eps, forKey: "eps")
        try values.encode(id, forKey: "id")
        try values.encode(images, forKey: "images")
        try values.encodeIfPresent(infobox, forKey: "infobox")
        try values.encode(isLocked, forKey: "locked")
        try values.encode(metaTags, forKey: "meta_tags")
        try values.encode(name, forKey: "name")
        try values.encode(nameCn, forKey: "name_cn")
        try values.encode(isNsfw, forKey: "nsfw")
        try values.encode(platform, forKey: "platform")
        try values.encode(rating, forKey: "rating")
        try values.encode(isSeries, forKey: "series")
        try values.encode(summary, forKey: "summary")
        try values.encode(tags, forKey: "tags")
        try values.encode(totalEpisodes, forKey: "total_episodes")
        try values.encode(type, forKey: "type")
        try values.encode(volumes, forKey: "volumes")
    }
}
