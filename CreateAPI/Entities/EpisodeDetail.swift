//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct EpisodeDetail: Codable, Hashable, Identifiable {
    public var airdate: String
    public var comment: Int
    /// 简介
    public var desc: String
    /// 音乐曲目的碟片数
    public var disc: Int
    public var duration: String
    /// 条目内的集数, 从`1`开始。非本篇剧集的此字段无意义
    public var ep: Double?
    public var id: Int
    public var name: String
    public var nameCn: String
    /// 同类条目的排序和集数
    public var sort: Double
    public var subjectID: Int
    /// EpType
    ///
    /// 本篇 = 0
    /// 特别篇 = 1
    /// OP = 2
    /// ED = 3
    /// 预告/宣传/广告 = 4
    /// MAD = 5
    /// 其他 = 6
    public var type: Int

    public init(airdate: String, comment: Int, desc: String, disc: Int, duration: String, ep: Double? = nil, id: Int, name: String, nameCn: String, sort: Double, subjectID: Int, type: Int) {
        self.airdate = airdate
        self.comment = comment
        self.desc = desc
        self.disc = disc
        self.duration = duration
        self.ep = ep
        self.id = id
        self.name = name
        self.nameCn = nameCn
        self.sort = sort
        self.subjectID = subjectID
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.airdate = try values.decode(String.self, forKey: "airdate")
        self.comment = try values.decode(Int.self, forKey: "comment")
        self.desc = try values.decode(String.self, forKey: "desc")
        self.disc = try values.decode(Int.self, forKey: "disc")
        self.duration = try values.decode(String.self, forKey: "duration")
        self.ep = try values.decodeIfPresent(Double.self, forKey: "ep")
        self.id = try values.decode(Int.self, forKey: "id")
        self.name = try values.decode(String.self, forKey: "name")
        self.nameCn = try values.decode(String.self, forKey: "name_cn")
        self.sort = try values.decode(Double.self, forKey: "sort")
        self.subjectID = try values.decode(Int.self, forKey: "subject_id")
        self.type = try values.decode(Int.self, forKey: "type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(airdate, forKey: "airdate")
        try values.encode(comment, forKey: "comment")
        try values.encode(desc, forKey: "desc")
        try values.encode(disc, forKey: "disc")
        try values.encode(duration, forKey: "duration")
        try values.encodeIfPresent(ep, forKey: "ep")
        try values.encode(id, forKey: "id")
        try values.encode(name, forKey: "name")
        try values.encode(nameCn, forKey: "name_cn")
        try values.encode(sort, forKey: "sort")
        try values.encode(subjectID, forKey: "subject_id")
        try values.encode(type, forKey: "type")
    }
}
