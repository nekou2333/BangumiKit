//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Get User
    ///
    /// 返回当前 Access Token 对应的用户信息
    static public var getMyself: Request<GetMyselfResponse> {
        Request(path: "/v0/me", method: "GET", id: "getMyself")
    }

    public struct GetMyselfResponse: Decodable, Hashable, Identifiable {
        /// Example:
        ///
        /// {
        ///   "large" : "https:\/\/lain.bgm.tv\/pic\/user\/l\/000\/00\/00\/1.jpg?r=1391790456",
        ///   "medium" : "https:\/\/lain.bgm.tv\/pic\/user\/m\/000\/00\/00\/1.jpg?r=1391790456",
        ///   "small" : "https:\/\/lain.bgm.tv\/pic\/user\/s\/000\/00\/00\/1.jpg?r=1391790456"
        /// }
        public var avatar: JellyfinAPI.Avatar
        public var id: Int
        public var nickname: String
        /// 个人签名
        public var sign: String
        /// 用户组 - 1 = 管理员 - 2 = Bangumi 管理猿 - 3 = 天窗管理猿 - 4 = 禁言用户 - 5 = 禁止访问用户 - 8 = 人物管理猿 - 9 = 维基条目管理猿 - 10 = 用户 - 11 = 维基人
        public var userGroup: Int
        /// 唯一用户名，初始与 UID 相同，可修改一次
        public var username: String
        public var email: AnyJSON
        public var regTime: AnyJSON
        /// 用户设置的时区偏移，以小时为单位。比如 GMT+8（shanghai/beijing）为 8
        public var timeOffset: Int?

        public init(avatar: JellyfinAPI.Avatar, id: Int, nickname: String, sign: String, userGroup: Int, username: String, email: AnyJSON, regTime: AnyJSON, timeOffset: Int? = nil) {
            self.avatar = avatar
            self.id = id
            self.nickname = nickname
            self.sign = sign
            self.userGroup = userGroup
            self.username = username
            self.email = email
            self.regTime = regTime
            self.timeOffset = timeOffset
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.avatar = try values.decode(JellyfinAPI.Avatar.self, forKey: "avatar")
            self.id = try values.decode(Int.self, forKey: "id")
            self.nickname = try values.decode(String.self, forKey: "nickname")
            self.sign = try values.decode(String.self, forKey: "sign")
            self.userGroup = try values.decode(Int.self, forKey: "user_group")
            self.username = try values.decode(String.self, forKey: "username")
            self.email = try values.decode(AnyJSON.self, forKey: "email")
            self.regTime = try values.decode(AnyJSON.self, forKey: "reg_time")
            self.timeOffset = try values.decodeIfPresent(Int.self, forKey: "time_offset")
        }
    }
}
