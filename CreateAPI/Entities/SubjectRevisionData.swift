//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct SubjectRevisionData: Codable, Hashable {
    public var fieldEps: Int
    public var fieldInfobox: String
    public var fieldSummary: String
    public var name: String
    public var nameCn: String
    public var platform: Int
    public var subjectID: Int
    public var type: Int
    public var typeID: Int
    public var voteField: String

    public init(fieldEps: Int, fieldInfobox: String, fieldSummary: String, name: String, nameCn: String, platform: Int, subjectID: Int, type: Int, typeID: Int, voteField: String) {
        self.fieldEps = fieldEps
        self.fieldInfobox = fieldInfobox
        self.fieldSummary = fieldSummary
        self.name = name
        self.nameCn = nameCn
        self.platform = platform
        self.subjectID = subjectID
        self.type = type
        self.typeID = typeID
        self.voteField = voteField
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.fieldEps = try values.decode(Int.self, forKey: "field_eps")
        self.fieldInfobox = try values.decode(String.self, forKey: "field_infobox")
        self.fieldSummary = try values.decode(String.self, forKey: "field_summary")
        self.name = try values.decode(String.self, forKey: "name")
        self.nameCn = try values.decode(String.self, forKey: "name_cn")
        self.platform = try values.decode(Int.self, forKey: "platform")
        self.subjectID = try values.decode(Int.self, forKey: "subject_id")
        self.type = try values.decode(Int.self, forKey: "type")
        self.typeID = try values.decode(Int.self, forKey: "type_id")
        self.voteField = try values.decode(String.self, forKey: "vote_field")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(fieldEps, forKey: "field_eps")
        try values.encode(fieldInfobox, forKey: "field_infobox")
        try values.encode(fieldSummary, forKey: "field_summary")
        try values.encode(name, forKey: "name")
        try values.encode(nameCn, forKey: "name_cn")
        try values.encode(platform, forKey: "platform")
        try values.encode(subjectID, forKey: "subject_id")
        try values.encode(type, forKey: "type")
        try values.encode(typeID, forKey: "type_id")
        try values.encode(voteField, forKey: "vote_field")
    }
}
