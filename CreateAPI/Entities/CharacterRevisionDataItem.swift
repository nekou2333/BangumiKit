//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct CharacterRevisionDataItem: Codable, Hashable {
    /// RevisionExtra
    public var extra: RevisionExtra
    /// Character Infobox
    public var infobox: String
    /// Character Name
    public var name: String
    /// Character Summary
    public var summary: String

    public init(extra: RevisionExtra, infobox: String, name: String, summary: String) {
        self.extra = extra
        self.infobox = infobox
        self.name = name
        self.summary = summary
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.extra = try values.decode(RevisionExtra.self, forKey: "extra")
        self.infobox = try values.decode(String.self, forKey: "infobox")
        self.name = try values.decode(String.self, forKey: "name")
        self.summary = try values.decode(String.self, forKey: "summary")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(extra, forKey: "extra")
        try values.encode(infobox, forKey: "infobox")
        try values.encode(name, forKey: "name")
        try values.encode(summary, forKey: "summary")
    }
}
