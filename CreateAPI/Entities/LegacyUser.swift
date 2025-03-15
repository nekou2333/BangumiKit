//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// 用户信息
public struct LegacyUser: Codable, Hashable, Identifiable {
    /// 头像地址
    public var avatar: Avatar?
    /// 用户 id
    public var id: Int?
    /// 昵称
    ///
    /// Example: "Sai"
    public var nickname: String?
    /// 签名
    ///
    /// Example: "Awesome!"
    public var sign: String?
    /// 用户主页地址
    ///
    /// Example: "https://bgm.tv/user/sai"
    public var url: String?
    /// 用户组 <br> 1 = 管理员 <br> 2 = Bangumi 管理猿 <br> 3 = 天窗管理猿 <br> 4 = 禁言用户 <br> 5 = 禁止访问用户 <br> 8 = 人物管理猿 <br> 9 = 维基条目管理猿 <br> 10 = 用户 <br> 11 = 维基人
    ///
    /// Example: 11
    public var usergroup: Int?
    /// 用户名
    ///
    /// Example: "sai"
    public var username: String?

    /// 头像地址
    public struct Avatar: Codable, Hashable {
        /// Example: "https://lain.bgm.tv/pic/user/l/000/00/00/1.jpg?r=1391790456"
        public var large: String?
        /// Example: "https://lain.bgm.tv/pic/user/m/000/00/00/1.jpg?r=1391790456"
        public var medium: String?
        /// Example: "https://lain.bgm.tv/pic/user/s/000/00/00/1.jpg?r=1391790456"
        public var small: String?

        public init(large: String? = nil, medium: String? = nil, small: String? = nil) {
            self.large = large
            self.medium = medium
            self.small = small
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.large = try values.decodeIfPresent(String.self, forKey: "large")
            self.medium = try values.decodeIfPresent(String.self, forKey: "medium")
            self.small = try values.decodeIfPresent(String.self, forKey: "small")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(large, forKey: "large")
            try values.encodeIfPresent(medium, forKey: "medium")
            try values.encodeIfPresent(small, forKey: "small")
        }
    }

    public init(avatar: Avatar? = nil, id: Int? = nil, nickname: String? = nil, sign: String? = nil, url: String? = nil, usergroup: Int? = nil, username: String? = nil) {
        self.avatar = avatar
        self.id = id
        self.nickname = nickname
        self.sign = sign
        self.url = url
        self.usergroup = usergroup
        self.username = username
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.avatar = try values.decodeIfPresent(Avatar.self, forKey: "avatar")
        self.id = try values.decodeIfPresent(Int.self, forKey: "id")
        self.nickname = try values.decodeIfPresent(String.self, forKey: "nickname")
        self.sign = try values.decodeIfPresent(String.self, forKey: "sign")
        self.url = try values.decodeIfPresent(String.self, forKey: "url")
        self.usergroup = try values.decodeIfPresent(Int.self, forKey: "usergroup")
        self.username = try values.decodeIfPresent(String.self, forKey: "username")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(avatar, forKey: "avatar")
        try values.encodeIfPresent(id, forKey: "id")
        try values.encodeIfPresent(nickname, forKey: "nickname")
        try values.encodeIfPresent(sign, forKey: "sign")
        try values.encodeIfPresent(url, forKey: "url")
        try values.encodeIfPresent(usergroup, forKey: "usergroup")
        try values.encodeIfPresent(username, forKey: "username")
    }
}
