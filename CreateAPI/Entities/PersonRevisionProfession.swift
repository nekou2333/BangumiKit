//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct PersonRevisionProfession: Codable, Hashable {
    public var actor: String?
    public var artist: String?
    public var illustrator: String?
    public var mangaka: String?
    public var producer: String?
    public var seiyu: String?
    public var writer: String?

    public init(actor: String? = nil, artist: String? = nil, illustrator: String? = nil, mangaka: String? = nil, producer: String? = nil, seiyu: String? = nil, writer: String? = nil) {
        self.actor = actor
        self.artist = artist
        self.illustrator = illustrator
        self.mangaka = mangaka
        self.producer = producer
        self.seiyu = seiyu
        self.writer = writer
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.actor = try values.decodeIfPresent(String.self, forKey: "actor")
        self.artist = try values.decodeIfPresent(String.self, forKey: "artist")
        self.illustrator = try values.decodeIfPresent(String.self, forKey: "illustrator")
        self.mangaka = try values.decodeIfPresent(String.self, forKey: "mangaka")
        self.producer = try values.decodeIfPresent(String.self, forKey: "producer")
        self.seiyu = try values.decodeIfPresent(String.self, forKey: "seiyu")
        self.writer = try values.decodeIfPresent(String.self, forKey: "writer")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(actor, forKey: "actor")
        try values.encodeIfPresent(artist, forKey: "artist")
        try values.encodeIfPresent(illustrator, forKey: "illustrator")
        try values.encodeIfPresent(mangaka, forKey: "mangaka")
        try values.encodeIfPresent(producer, forKey: "producer")
        try values.encodeIfPresent(seiyu, forKey: "seiyu")
        try values.encodeIfPresent(writer, forKey: "writer")
    }
}
