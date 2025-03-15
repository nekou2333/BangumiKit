//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct PersonRevisionDataItem: Codable, Hashable {
    /// RevisionExtra
    public var extra: RevisionExtra
    /// PersonRevisionProfession
    public var profession: PersonRevisionProfession
    /// Person Infobox
    public var prsnInfobox: String
    /// Person Name
    public var prsnName: String
    /// Person Summary
    public var prsnSummary: String

    public init(extra: RevisionExtra, profession: PersonRevisionProfession, prsnInfobox: String, prsnName: String, prsnSummary: String) {
        self.extra = extra
        self.profession = profession
        self.prsnInfobox = prsnInfobox
        self.prsnName = prsnName
        self.prsnSummary = prsnSummary
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.extra = try values.decode(RevisionExtra.self, forKey: "extra")
        self.profession = try values.decode(PersonRevisionProfession.self, forKey: "profession")
        self.prsnInfobox = try values.decode(String.self, forKey: "prsn_infobox")
        self.prsnName = try values.decode(String.self, forKey: "prsn_name")
        self.prsnSummary = try values.decode(String.self, forKey: "prsn_summary")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(extra, forKey: "extra")
        try values.encode(profession, forKey: "profession")
        try values.encode(prsnInfobox, forKey: "prsn_infobox")
        try values.encode(prsnName, forKey: "prsn_name")
        try values.encode(prsnSummary, forKey: "prsn_summary")
    }
}
