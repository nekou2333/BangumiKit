//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct PersonDetail: Codable, Hashable, Identifiable {
    /// Parsed from wiki, maybe `null`
    public var birthDay: Int?
    /// Parsed from wiki, maybe `null`
    public var birthMon: Int?
    /// Parsed from wiki, maybe `null`
    public var birthYear: Int?
    /// Parsed from wiki, maybe null, `1, 2, 3, 4` for `A, B, AB, O`
    public var bloodType: Int?
    public var career: [PersonCareer]
    /// Parsed from wiki, maybe null
    public var gender: String?
    public var id: Int
    /// Object with some size of images, this object maybe `null`
    public var images: PersonImages?
    /// Server parsed infobox, a map from key to string or tuple
    /// null if server infobox is not valid
    public var infobox: [[String: AnyJSON]]?
    /// Currently it's latest user comment time, it will be replaced by wiki modified date in the future
    public var lastModified: Date
    /// Locked
    public var isLocked: Bool
    public var name: String
    public var stat: Stat
    public var summary: String
    /// `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
    public var type: Int

    public init(birthDay: Int? = nil, birthMon: Int? = nil, birthYear: Int? = nil, bloodType: Int? = nil, career: [PersonCareer], gender: String? = nil, id: Int, images: PersonImages? = nil, infobox: [[String: AnyJSON]]? = nil, lastModified: Date, isLocked: Bool, name: String, stat: Stat, summary: String, type: Int) {
        self.birthDay = birthDay
        self.birthMon = birthMon
        self.birthYear = birthYear
        self.bloodType = bloodType
        self.career = career
        self.gender = gender
        self.id = id
        self.images = images
        self.infobox = infobox
        self.lastModified = lastModified
        self.isLocked = isLocked
        self.name = name
        self.stat = stat
        self.summary = summary
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.birthDay = try values.decodeIfPresent(Int.self, forKey: "birth_day")
        self.birthMon = try values.decodeIfPresent(Int.self, forKey: "birth_mon")
        self.birthYear = try values.decodeIfPresent(Int.self, forKey: "birth_year")
        self.bloodType = try values.decodeIfPresent(Int.self, forKey: "blood_type")
        self.career = try values.decode([PersonCareer].self, forKey: "career")
        self.gender = try values.decodeIfPresent(String.self, forKey: "gender")
        self.id = try values.decode(Int.self, forKey: "id")
        self.images = try values.decodeIfPresent(PersonImages.self, forKey: "images")
        self.infobox = try values.decodeIfPresent([[String: AnyJSON]].self, forKey: "infobox")
        self.lastModified = try values.decode(Date.self, forKey: "last_modified")
        self.isLocked = try values.decode(Bool.self, forKey: "locked")
        self.name = try values.decode(String.self, forKey: "name")
        self.stat = try values.decode(Stat.self, forKey: "stat")
        self.summary = try values.decode(String.self, forKey: "summary")
        self.type = try values.decode(Int.self, forKey: "type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(birthDay, forKey: "birth_day")
        try values.encodeIfPresent(birthMon, forKey: "birth_mon")
        try values.encodeIfPresent(birthYear, forKey: "birth_year")
        try values.encodeIfPresent(bloodType, forKey: "blood_type")
        try values.encode(career, forKey: "career")
        try values.encodeIfPresent(gender, forKey: "gender")
        try values.encode(id, forKey: "id")
        try values.encodeIfPresent(images, forKey: "images")
        try values.encodeIfPresent(infobox, forKey: "infobox")
        try values.encode(lastModified, forKey: "last_modified")
        try values.encode(isLocked, forKey: "locked")
        try values.encode(name, forKey: "name")
        try values.encode(stat, forKey: "stat")
        try values.encode(summary, forKey: "summary")
        try values.encode(type, forKey: "type")
    }
}
