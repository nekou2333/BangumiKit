//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// 新增或修改条目的内容，同名字段意义同<a href="#model-Subject">Subject</a>
public struct IndexBasicInfo: Codable, Hashable {
    public var description: String?
    public var title: String?

    public init(description: String? = nil, title: String? = nil) {
        self.description = description
        self.title = title
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.description = try values.decodeIfPresent(String.self, forKey: "description")
        self.title = try values.decodeIfPresent(String.self, forKey: "title")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(description, forKey: "description")
        try values.encodeIfPresent(title, forKey: "title")
    }
}
