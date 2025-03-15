// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

public extension Paths.V0.Users.Minus.Collections {
    func subjectID(_ subjectID: Int) -> WithSubjectID {
        WithSubjectID(path: "\(path)/\(subjectID)")
    }

    struct WithSubjectID {
        /// Path: `/v0/users/-/collections/{subject_id}`
        public let path: String

        /// 新增或修改用户单个条目收藏
        ///
        /// 修改条目收藏状态, 如果不存在则创建，如果存在则修改
        ///
        /// 由于直接修改剧集条目的完成度可能会引起意料之外效果，只能用于修改书籍类条目的完成度。
        ///
        /// 方法的所有请求体字段均可选
        public func post(_ body: BangumiKit.UserSubjectCollectionModifyPayload? = nil) -> Request<Void> {
            Request(path: path, method: "POST", body: body, id: "postUserCollection")
        }

        /// 修改用户单个收藏
        ///
        /// 修改条目收藏状态
        ///
        /// 由于直接修改剧集条目的完成度可能会引起意料之外效果，只能用于修改书籍类条目的完成度。
        ///
        /// PATCH 方法的所有请求体字段均可选
        public func patch(_ body: BangumiKit.UserSubjectCollectionModifyPayload? = nil) -> Request<Void> {
            Request(path: path, method: "PATCH", body: body, id: "patchUserCollection")
        }
    }
}
