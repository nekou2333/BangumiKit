//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// 意义同<a href="#model-Me">Me</a>
public struct Creator: Codable, Hashable {
    public var nickname: String
    public var username: String

    public init(nickname: String, username: String) {
        self.nickname = nickname
        self.username = username
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.nickname = try values.decode(String.self, forKey: "nickname")
        self.username = try values.decode(String.self, forKey: "username")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(nickname, forKey: "nickname")
        try values.encode(username, forKey: "username")
    }
}
