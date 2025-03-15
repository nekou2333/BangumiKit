//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// 实际的返回值可能包括文档未声明的 `url` 字段，此字段主要用于开发者从 api 响应直接转跳到网页。
/// 客户端开发者请不用依赖于此特性，此字段的值随时可能会改变。
///
/// Example:
///
/// {
///   "avatar" : {
///     "large" : "https:\/\/lain.bgm.tv\/pic\/user\/l\/000\/00\/00\/1.jpg?r=1391790456",
///     "medium" : "https:\/\/lain.bgm.tv\/pic\/user\/m\/000\/00\/00\/1.jpg?r=1391790456",
///     "small" : "https:\/\/lain.bgm.tv\/pic\/user\/s\/000\/00\/00\/1.jpg?r=1391790456"
///   },
///   "id" : 1,
///   "nickname" : "Sai🖖",
///   "sign" : "Awesome!",
///   "user_group" : 1,
///   "username" : "sai"
/// }
public struct User: Codable, Hashable, Identifiable {
    /// Example:
    ///
    /// {
    ///   "large" : "https:\/\/lain.bgm.tv\/pic\/user\/l\/000\/00\/00\/1.jpg?r=1391790456",
    ///   "medium" : "https:\/\/lain.bgm.tv\/pic\/user\/m\/000\/00\/00\/1.jpg?r=1391790456",
    ///   "small" : "https:\/\/lain.bgm.tv\/pic\/user\/s\/000\/00\/00\/1.jpg?r=1391790456"
    /// }
    public var avatar: Avatar
    public var id: Int
    public var nickname: String
    /// 个人签名
    public var sign: String
    /// 用户组 - 1 = 管理员 - 2 = Bangumi 管理猿 - 3 = 天窗管理猿 - 4 = 禁言用户 - 5 = 禁止访问用户 - 8 = 人物管理猿 - 9 = 维基条目管理猿 - 10 = 用户 - 11 = 维基人
    public var userGroup: Int
    /// 唯一用户名，初始与 UID 相同，可修改一次
    public var username: String

    public init(avatar: Avatar, id: Int, nickname: String, sign: String, userGroup: Int, username: String) {
        self.avatar = avatar
        self.id = id
        self.nickname = nickname
        self.sign = sign
        self.userGroup = userGroup
        self.username = username
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.avatar = try values.decode(Avatar.self, forKey: "avatar")
        self.id = try values.decode(Int.self, forKey: "id")
        self.nickname = try values.decode(String.self, forKey: "nickname")
        self.sign = try values.decode(String.self, forKey: "sign")
        self.userGroup = try values.decode(Int.self, forKey: "user_group")
        self.username = try values.decode(String.self, forKey: "username")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(avatar, forKey: "avatar")
        try values.encode(id, forKey: "id")
        try values.encode(nickname, forKey: "nickname")
        try values.encode(sign, forKey: "sign")
        try values.encode(userGroup, forKey: "user_group")
        try values.encode(username, forKey: "username")
    }
}
