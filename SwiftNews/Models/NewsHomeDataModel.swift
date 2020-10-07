

import Foundation


let NewsListApiKey = "https://www.reddit.com/r/swift/.json"

// MARK: - NewsHomeDataModel
struct NewsHomeDataModel: Codable {
    let kind: String?
    let data: NewsHomeDataModelData?
}

// MARK: NewsHomeDataModel convenience initializers and mutators

extension NewsHomeDataModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(NewsHomeDataModel.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        kind: String?? = nil,
        data: NewsHomeDataModelData?? = nil
    ) -> NewsHomeDataModel {
        return NewsHomeDataModel(
            kind: kind ?? self.kind,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - NewsHomeDataModelData
struct NewsHomeDataModelData: Codable {
    let modhash: String?
    let dist: Int?
    let children: [Child]?
    let after: String?
    let before: JSONNull?
}

// MARK: NewsHomeDataModelData convenience initializers and mutators

extension NewsHomeDataModelData {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(NewsHomeDataModelData.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        modhash: String?? = nil,
        dist: Int?? = nil,
        children: [Child]?? = nil,
        after: String?? = nil,
        before: JSONNull?? = nil
    ) -> NewsHomeDataModelData {
        return NewsHomeDataModelData(
            modhash: modhash ?? self.modhash,
            dist: dist ?? self.dist,
            children: children ?? self.children,
            after: after ?? self.after,
            before: before ?? self.before
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Child
struct Child: Codable {
    let kind: Kind?
    let data: ChildData?
}

// MARK: Child convenience initializers and mutators

extension Child {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Child.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        kind: Kind?? = nil,
        data: ChildData?? = nil
    ) -> Child {
        return Child(
            kind: kind ?? self.kind,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - ChildData
struct ChildData: Codable {
    let approvedAtUTC: JSONNull?
    let subreddit: Subreddit?
    let selftext, authorFullname: String?
    let saved: Bool?
    let modReasonTitle: JSONNull?
    let gilded: Int?
    let clicked: Bool?
    let title: String?
    let linkFlairRichtext: [JSONAny]?
    let subredditNamePrefixed: SubredditNamePrefixed?
    let hidden: Bool?
    let pwls: Int?
    let linkFlairCSSClass: String?
    let downs: Int?
    let thumbnailHeight: Int?
    let topAwardedType: JSONNull?
    let hideScore: Bool?
    let name: String?
    let quarantine: Bool?
    let linkFlairTextColor: FlairTextColor?
    let upvoteRatio: Double?
    let authorFlairBackgroundColor: String?
    let subredditType: SubredditType?
    let ups, totalAwardsReceived: Int?
    let mediaEmbed: MediaEmbed?
    let thumbnailWidth: Int?
    let authorFlairTemplateID: String?
    let isOriginalContent: Bool?
    let userReports: [JSONAny]?
    let secureMedia: Media?
    let isRedditMediaDomain, isMeta: Bool?
    let category: JSONNull?
    let secureMediaEmbed: MediaEmbed?
    let linkFlairText: String?
    let canModPost: Bool?
    let score: Int?
    let approvedBy: JSONNull?
    let authorPremium: Bool?
    let thumbnail: String?
    let edited: Bool?
    let authorFlairCSSClass: JSONNull?
    let authorFlairRichtext: [JSONAny]?
    let gildings: Gildings?
    let contentCategories: JSONNull?
    let isSelf: Bool?
    let modNote: JSONNull?
    let created: Int?
    let linkFlairType: AuthorFlairType?
    let wls: Int?
    let removedByCategory, bannedBy: JSONNull?
    let authorFlairType: AuthorFlairType?
    let domain: String?
    let allowLiveComments: Bool?
    let selftextHTML: String?
    let likes, suggestedSort, bannedAtUTC, viewCount: JSONNull?
    let archived, noFollow, isCrosspostable, pinned: Bool?
    let over18: Bool?
    let allAwardings: [AllAwarding]?
    let awarders: [JSONAny]?
    let mediaOnly, canGild, spoiler, locked: Bool?
    let authorFlairText: String?
    let treatmentTags: [JSONAny]?
    let visited: Bool?
    let removedBy, numReports, distinguished: JSONNull?
    let subredditID: SubredditID?
    let modReasonBy, removalReason: JSONNull?
    let linkFlairBackgroundColor: LinkFlairBackgroundColor?
    let id: String?
    let isRobotIndexable: Bool?
    let reportReasons: JSONNull?
    let author: String?
    let discussionType: JSONNull?
    let numComments: Int?
    let sendReplies: Bool?
    let whitelistStatus: WhitelistStatus?
    let contestMode: Bool?
    let modReports: [JSONAny]?
    let authorPatreonFlair: Bool?
    let authorFlairTextColor: FlairTextColor?
    let permalink: String?
    let parentWhitelistStatus: WhitelistStatus?
    let stickied: Bool?
    let url: String?
    let subredditSubscribers, createdUTC, numCrossposts: Int?
    let media: Media?
    let isVideo: Bool?
    let postHint: String?
    let urlOverriddenByDest: String?
    let preview: Preview?
    let linkFlairTemplateID: String?
    let mediaMetadata: MediaMetadata?
    let isGallery: Bool?
    let galleryData: GalleryData?
    let crosspostParentList: [CrosspostParentList]?
    let crosspostParent: String?

    enum CodingKeys: String, CodingKey {
        case approvedAtUTC = "approved_at_utc"
        case subreddit, selftext
        case authorFullname = "author_fullname"
        case saved
        case modReasonTitle = "mod_reason_title"
        case gilded, clicked, title
        case linkFlairRichtext = "link_flair_richtext"
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case hidden, pwls
        case linkFlairCSSClass = "link_flair_css_class"
        case downs
        case thumbnailHeight = "thumbnail_height"
        case topAwardedType = "top_awarded_type"
        case hideScore = "hide_score"
        case name, quarantine
        case linkFlairTextColor = "link_flair_text_color"
        case upvoteRatio = "upvote_ratio"
        case authorFlairBackgroundColor = "author_flair_background_color"
        case subredditType = "subreddit_type"
        case ups
        case totalAwardsReceived = "total_awards_received"
        case mediaEmbed = "media_embed"
        case thumbnailWidth = "thumbnail_width"
        case authorFlairTemplateID = "author_flair_template_id"
        case isOriginalContent = "is_original_content"
        case userReports = "user_reports"
        case secureMedia = "secure_media"
        case isRedditMediaDomain = "is_reddit_media_domain"
        case isMeta = "is_meta"
        case category
        case secureMediaEmbed = "secure_media_embed"
        case linkFlairText = "link_flair_text"
        case canModPost = "can_mod_post"
        case score
        case approvedBy = "approved_by"
        case authorPremium = "author_premium"
        case thumbnail, edited
        case authorFlairCSSClass = "author_flair_css_class"
        case authorFlairRichtext = "author_flair_richtext"
        case gildings
        case contentCategories = "content_categories"
        case isSelf = "is_self"
        case modNote = "mod_note"
        case created
        case linkFlairType = "link_flair_type"
        case wls
        case removedByCategory = "removed_by_category"
        case bannedBy = "banned_by"
        case authorFlairType = "author_flair_type"
        case domain
        case allowLiveComments = "allow_live_comments"
        case selftextHTML = "selftext_html"
        case likes
        case suggestedSort = "suggested_sort"
        case bannedAtUTC = "banned_at_utc"
        case viewCount = "view_count"
        case archived
        case noFollow = "no_follow"
        case isCrosspostable = "is_crosspostable"
        case pinned
        case over18 = "over_18"
        case allAwardings = "all_awardings"
        case awarders
        case mediaOnly = "media_only"
        case canGild = "can_gild"
        case spoiler, locked
        case authorFlairText = "author_flair_text"
        case treatmentTags = "treatment_tags"
        case visited
        case removedBy = "removed_by"
        case numReports = "num_reports"
        case distinguished
        case subredditID = "subreddit_id"
        case modReasonBy = "mod_reason_by"
        case removalReason = "removal_reason"
        case linkFlairBackgroundColor = "link_flair_background_color"
        case id
        case isRobotIndexable = "is_robot_indexable"
        case reportReasons = "report_reasons"
        case author
        case discussionType = "discussion_type"
        case numComments = "num_comments"
        case sendReplies = "send_replies"
        case whitelistStatus = "whitelist_status"
        case contestMode = "contest_mode"
        case modReports = "mod_reports"
        case authorPatreonFlair = "author_patreon_flair"
        case authorFlairTextColor = "author_flair_text_color"
        case permalink
        case parentWhitelistStatus = "parent_whitelist_status"
        case stickied, url
        case subredditSubscribers = "subreddit_subscribers"
        case createdUTC = "created_utc"
        case numCrossposts = "num_crossposts"
        case media
        case isVideo = "is_video"
        case postHint = "post_hint"
        case urlOverriddenByDest = "url_overridden_by_dest"
        case preview
        case linkFlairTemplateID = "link_flair_template_id"
        case mediaMetadata = "media_metadata"
        case isGallery = "is_gallery"
        case galleryData = "gallery_data"
        case crosspostParentList = "crosspost_parent_list"
        case crosspostParent = "crosspost_parent"
    }
}

// MARK: ChildData convenience initializers and mutators

extension ChildData {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ChildData.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        approvedAtUTC: JSONNull?? = nil,
        subreddit: Subreddit?? = nil,
        selftext: String?? = nil,
        authorFullname: String?? = nil,
        saved: Bool?? = nil,
        modReasonTitle: JSONNull?? = nil,
        gilded: Int?? = nil,
        clicked: Bool?? = nil,
        title: String?? = nil,
        linkFlairRichtext: [JSONAny]?? = nil,
        subredditNamePrefixed: SubredditNamePrefixed?? = nil,
        hidden: Bool?? = nil,
        pwls: Int?? = nil,
        linkFlairCSSClass: String?? = nil,
        downs: Int?? = nil,
        thumbnailHeight: Int?? = nil,
        topAwardedType: JSONNull?? = nil,
        hideScore: Bool?? = nil,
        name: String?? = nil,
        quarantine: Bool?? = nil,
        linkFlairTextColor: FlairTextColor?? = nil,
        upvoteRatio: Double?? = nil,
        authorFlairBackgroundColor: String?? = nil,
        subredditType: SubredditType?? = nil,
        ups: Int?? = nil,
        totalAwardsReceived: Int?? = nil,
        mediaEmbed: MediaEmbed?? = nil,
        thumbnailWidth: Int?? = nil,
        authorFlairTemplateID: String?? = nil,
        isOriginalContent: Bool?? = nil,
        userReports: [JSONAny]?? = nil,
        secureMedia: Media?? = nil,
        isRedditMediaDomain: Bool?? = nil,
        isMeta: Bool?? = nil,
        category: JSONNull?? = nil,
        secureMediaEmbed: MediaEmbed?? = nil,
        linkFlairText: String?? = nil,
        canModPost: Bool?? = nil,
        score: Int?? = nil,
        approvedBy: JSONNull?? = nil,
        authorPremium: Bool?? = nil,
        thumbnail: String?? = nil,
        edited: Bool?? = nil,
        authorFlairCSSClass: JSONNull?? = nil,
        authorFlairRichtext: [JSONAny]?? = nil,
        gildings: Gildings?? = nil,
        contentCategories: JSONNull?? = nil,
        isSelf: Bool?? = nil,
        modNote: JSONNull?? = nil,
        created: Int?? = nil,
        linkFlairType: AuthorFlairType?? = nil,
        wls: Int?? = nil,
        removedByCategory: JSONNull?? = nil,
        bannedBy: JSONNull?? = nil,
        authorFlairType: AuthorFlairType?? = nil,
        domain: String?? = nil,
        allowLiveComments: Bool?? = nil,
        selftextHTML: String?? = nil,
        likes: JSONNull?? = nil,
        suggestedSort: JSONNull?? = nil,
        bannedAtUTC: JSONNull?? = nil,
        viewCount: JSONNull?? = nil,
        archived: Bool?? = nil,
        noFollow: Bool?? = nil,
        isCrosspostable: Bool?? = nil,
        pinned: Bool?? = nil,
        over18: Bool?? = nil,
        allAwardings: [AllAwarding]?? = nil,
        awarders: [JSONAny]?? = nil,
        mediaOnly: Bool?? = nil,
        canGild: Bool?? = nil,
        spoiler: Bool?? = nil,
        locked: Bool?? = nil,
        authorFlairText: String?? = nil,
        treatmentTags: [JSONAny]?? = nil,
        visited: Bool?? = nil,
        removedBy: JSONNull?? = nil,
        numReports: JSONNull?? = nil,
        distinguished: JSONNull?? = nil,
        subredditID: SubredditID?? = nil,
        modReasonBy: JSONNull?? = nil,
        removalReason: JSONNull?? = nil,
        linkFlairBackgroundColor: LinkFlairBackgroundColor?? = nil,
        id: String?? = nil,
        isRobotIndexable: Bool?? = nil,
        reportReasons: JSONNull?? = nil,
        author: String?? = nil,
        discussionType: JSONNull?? = nil,
        numComments: Int?? = nil,
        sendReplies: Bool?? = nil,
        whitelistStatus: WhitelistStatus?? = nil,
        contestMode: Bool?? = nil,
        modReports: [JSONAny]?? = nil,
        authorPatreonFlair: Bool?? = nil,
        authorFlairTextColor: FlairTextColor?? = nil,
        permalink: String?? = nil,
        parentWhitelistStatus: WhitelistStatus?? = nil,
        stickied: Bool?? = nil,
        url: String?? = nil,
        subredditSubscribers: Int?? = nil,
        createdUTC: Int?? = nil,
        numCrossposts: Int?? = nil,
        media: Media?? = nil,
        isVideo: Bool?? = nil,
        postHint: String?? = nil,
        urlOverriddenByDest: String?? = nil,
        preview: Preview?? = nil,
        linkFlairTemplateID: String?? = nil,
        mediaMetadata: MediaMetadata?? = nil,
        isGallery: Bool?? = nil,
        galleryData: GalleryData?? = nil,
        crosspostParentList: [CrosspostParentList]?? = nil,
        crosspostParent: String?? = nil
    ) -> ChildData {
        return ChildData(
            approvedAtUTC: approvedAtUTC ?? self.approvedAtUTC,
            subreddit: subreddit ?? self.subreddit,
            selftext: selftext ?? self.selftext,
            authorFullname: authorFullname ?? self.authorFullname,
            saved: saved ?? self.saved,
            modReasonTitle: modReasonTitle ?? self.modReasonTitle,
            gilded: gilded ?? self.gilded,
            clicked: clicked ?? self.clicked,
            title: title ?? self.title,
            linkFlairRichtext: linkFlairRichtext ?? self.linkFlairRichtext,
            subredditNamePrefixed: subredditNamePrefixed ?? self.subredditNamePrefixed,
            hidden: hidden ?? self.hidden,
            pwls: pwls ?? self.pwls,
            linkFlairCSSClass: linkFlairCSSClass ?? self.linkFlairCSSClass,
            downs: downs ?? self.downs,
            thumbnailHeight: thumbnailHeight ?? self.thumbnailHeight,
            topAwardedType: topAwardedType ?? self.topAwardedType,
            hideScore: hideScore ?? self.hideScore,
            name: name ?? self.name,
            quarantine: quarantine ?? self.quarantine,
            linkFlairTextColor: linkFlairTextColor ?? self.linkFlairTextColor,
            upvoteRatio: upvoteRatio ?? self.upvoteRatio,
            authorFlairBackgroundColor: authorFlairBackgroundColor ?? self.authorFlairBackgroundColor,
            subredditType: subredditType ?? self.subredditType,
            ups: ups ?? self.ups,
            totalAwardsReceived: totalAwardsReceived ?? self.totalAwardsReceived,
            mediaEmbed: mediaEmbed ?? self.mediaEmbed,
            thumbnailWidth: thumbnailWidth ?? self.thumbnailWidth,
            authorFlairTemplateID: authorFlairTemplateID ?? self.authorFlairTemplateID,
            isOriginalContent: isOriginalContent ?? self.isOriginalContent,
            userReports: userReports ?? self.userReports,
            secureMedia: secureMedia ?? self.secureMedia,
            isRedditMediaDomain: isRedditMediaDomain ?? self.isRedditMediaDomain,
            isMeta: isMeta ?? self.isMeta,
            category: category ?? self.category,
            secureMediaEmbed: secureMediaEmbed ?? self.secureMediaEmbed,
            linkFlairText: linkFlairText ?? self.linkFlairText,
            canModPost: canModPost ?? self.canModPost,
            score: score ?? self.score,
            approvedBy: approvedBy ?? self.approvedBy,
            authorPremium: authorPremium ?? self.authorPremium,
            thumbnail: thumbnail ?? self.thumbnail,
            edited: edited ?? self.edited,
            authorFlairCSSClass: authorFlairCSSClass ?? self.authorFlairCSSClass,
            authorFlairRichtext: authorFlairRichtext ?? self.authorFlairRichtext,
            gildings: gildings ?? self.gildings,
            contentCategories: contentCategories ?? self.contentCategories,
            isSelf: isSelf ?? self.isSelf,
            modNote: modNote ?? self.modNote,
            created: created ?? self.created,
            linkFlairType: linkFlairType ?? self.linkFlairType,
            wls: wls ?? self.wls,
            removedByCategory: removedByCategory ?? self.removedByCategory,
            bannedBy: bannedBy ?? self.bannedBy,
            authorFlairType: authorFlairType ?? self.authorFlairType,
            domain: domain ?? self.domain,
            allowLiveComments: allowLiveComments ?? self.allowLiveComments,
            selftextHTML: selftextHTML ?? self.selftextHTML,
            likes: likes ?? self.likes,
            suggestedSort: suggestedSort ?? self.suggestedSort,
            bannedAtUTC: bannedAtUTC ?? self.bannedAtUTC,
            viewCount: viewCount ?? self.viewCount,
            archived: archived ?? self.archived,
            noFollow: noFollow ?? self.noFollow,
            isCrosspostable: isCrosspostable ?? self.isCrosspostable,
            pinned: pinned ?? self.pinned,
            over18: over18 ?? self.over18,
            allAwardings: allAwardings ?? self.allAwardings,
            awarders: awarders ?? self.awarders,
            mediaOnly: mediaOnly ?? self.mediaOnly,
            canGild: canGild ?? self.canGild,
            spoiler: spoiler ?? self.spoiler,
            locked: locked ?? self.locked,
            authorFlairText: authorFlairText ?? self.authorFlairText,
            treatmentTags: treatmentTags ?? self.treatmentTags,
            visited: visited ?? self.visited,
            removedBy: removedBy ?? self.removedBy,
            numReports: numReports ?? self.numReports,
            distinguished: distinguished ?? self.distinguished,
            subredditID: subredditID ?? self.subredditID,
            modReasonBy: modReasonBy ?? self.modReasonBy,
            removalReason: removalReason ?? self.removalReason,
            linkFlairBackgroundColor: linkFlairBackgroundColor ?? self.linkFlairBackgroundColor,
            id: id ?? self.id,
            isRobotIndexable: isRobotIndexable ?? self.isRobotIndexable,
            reportReasons: reportReasons ?? self.reportReasons,
            author: author ?? self.author,
            discussionType: discussionType ?? self.discussionType,
            numComments: numComments ?? self.numComments,
            sendReplies: sendReplies ?? self.sendReplies,
            whitelistStatus: whitelistStatus ?? self.whitelistStatus,
            contestMode: contestMode ?? self.contestMode,
            modReports: modReports ?? self.modReports,
            authorPatreonFlair: authorPatreonFlair ?? self.authorPatreonFlair,
            authorFlairTextColor: authorFlairTextColor ?? self.authorFlairTextColor,
            permalink: permalink ?? self.permalink,
            parentWhitelistStatus: parentWhitelistStatus ?? self.parentWhitelistStatus,
            stickied: stickied ?? self.stickied,
            url: url ?? self.url,
            subredditSubscribers: subredditSubscribers ?? self.subredditSubscribers,
            createdUTC: createdUTC ?? self.createdUTC,
            numCrossposts: numCrossposts ?? self.numCrossposts,
            media: media ?? self.media,
            isVideo: isVideo ?? self.isVideo,
            postHint: postHint ?? self.postHint,
            urlOverriddenByDest: urlOverriddenByDest ?? self.urlOverriddenByDest,
            preview: preview ?? self.preview,
            linkFlairTemplateID: linkFlairTemplateID ?? self.linkFlairTemplateID,
            mediaMetadata: mediaMetadata ?? self.mediaMetadata,
            isGallery: isGallery ?? self.isGallery,
            galleryData: galleryData ?? self.galleryData,
            crosspostParentList: crosspostParentList ?? self.crosspostParentList,
            crosspostParent: crosspostParent ?? self.crosspostParent
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - AllAwarding
struct AllAwarding: Codable {
    let giverCoinReward: Int?
    let subredditID: JSONNull?
    let isNew: Bool?
    let daysOfDripExtension, coinPrice: Int?
    let id: String?
    let pennyDonate: Int?
    let awardSubType: String?
    let coinReward: Int?
    let iconURL: String?
    let daysOfPremium: Int?
    let tiersByRequiredAwardings: JSONNull?
    let resizedIcons: [ResizedIcon]?
    let iconWidth, staticIconWidth: Int?
    let startDate: JSONNull?
    let isEnabled: Bool?
    let awardingsRequiredToGrantBenefits: JSONNull?
    let allAwardingDescription: String?
    let endDate: JSONNull?
    let subredditCoinReward, count, staticIconHeight: Int?
    let name: String?
    let resizedStaticIcons: [ResizedIcon]?
    let iconFormat: String?
    let iconHeight: Int?
    let pennyPrice: Int?
    let awardType: String?
    let staticIconURL: String?

    enum CodingKeys: String, CodingKey {
        case giverCoinReward = "giver_coin_reward"
        case subredditID = "subreddit_id"
        case isNew = "is_new"
        case daysOfDripExtension = "days_of_drip_extension"
        case coinPrice = "coin_price"
        case id
        case pennyDonate = "penny_donate"
        case awardSubType = "award_sub_type"
        case coinReward = "coin_reward"
        case iconURL = "icon_url"
        case daysOfPremium = "days_of_premium"
        case tiersByRequiredAwardings = "tiers_by_required_awardings"
        case resizedIcons = "resized_icons"
        case iconWidth = "icon_width"
        case staticIconWidth = "static_icon_width"
        case startDate = "start_date"
        case isEnabled = "is_enabled"
        case awardingsRequiredToGrantBenefits = "awardings_required_to_grant_benefits"
        case allAwardingDescription = "description"
        case endDate = "end_date"
        case subredditCoinReward = "subreddit_coin_reward"
        case count
        case staticIconHeight = "static_icon_height"
        case name
        case resizedStaticIcons = "resized_static_icons"
        case iconFormat = "icon_format"
        case iconHeight = "icon_height"
        case pennyPrice = "penny_price"
        case awardType = "award_type"
        case staticIconURL = "static_icon_url"
    }
}

// MARK: AllAwarding convenience initializers and mutators

extension AllAwarding {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AllAwarding.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        giverCoinReward: Int?? = nil,
        subredditID: JSONNull?? = nil,
        isNew: Bool?? = nil,
        daysOfDripExtension: Int?? = nil,
        coinPrice: Int?? = nil,
        id: String?? = nil,
        pennyDonate: Int?? = nil,
        awardSubType: String?? = nil,
        coinReward: Int?? = nil,
        iconURL: String?? = nil,
        daysOfPremium: Int?? = nil,
        tiersByRequiredAwardings: JSONNull?? = nil,
        resizedIcons: [ResizedIcon]?? = nil,
        iconWidth: Int?? = nil,
        staticIconWidth: Int?? = nil,
        startDate: JSONNull?? = nil,
        isEnabled: Bool?? = nil,
        awardingsRequiredToGrantBenefits: JSONNull?? = nil,
        allAwardingDescription: String?? = nil,
        endDate: JSONNull?? = nil,
        subredditCoinReward: Int?? = nil,
        count: Int?? = nil,
        staticIconHeight: Int?? = nil,
        name: String?? = nil,
        resizedStaticIcons: [ResizedIcon]?? = nil,
        iconFormat: String?? = nil,
        iconHeight: Int?? = nil,
        pennyPrice: Int?? = nil,
        awardType: String?? = nil,
        staticIconURL: String?? = nil
    ) -> AllAwarding {
        return AllAwarding(
            giverCoinReward: giverCoinReward ?? self.giverCoinReward,
            subredditID: subredditID ?? self.subredditID,
            isNew: isNew ?? self.isNew,
            daysOfDripExtension: daysOfDripExtension ?? self.daysOfDripExtension,
            coinPrice: coinPrice ?? self.coinPrice,
            id: id ?? self.id,
            pennyDonate: pennyDonate ?? self.pennyDonate,
            awardSubType: awardSubType ?? self.awardSubType,
            coinReward: coinReward ?? self.coinReward,
            iconURL: iconURL ?? self.iconURL,
            daysOfPremium: daysOfPremium ?? self.daysOfPremium,
            tiersByRequiredAwardings: tiersByRequiredAwardings ?? self.tiersByRequiredAwardings,
            resizedIcons: resizedIcons ?? self.resizedIcons,
            iconWidth: iconWidth ?? self.iconWidth,
            staticIconWidth: staticIconWidth ?? self.staticIconWidth,
            startDate: startDate ?? self.startDate,
            isEnabled: isEnabled ?? self.isEnabled,
            awardingsRequiredToGrantBenefits: awardingsRequiredToGrantBenefits ?? self.awardingsRequiredToGrantBenefits,
            allAwardingDescription: allAwardingDescription ?? self.allAwardingDescription,
            endDate: endDate ?? self.endDate,
            subredditCoinReward: subredditCoinReward ?? self.subredditCoinReward,
            count: count ?? self.count,
            staticIconHeight: staticIconHeight ?? self.staticIconHeight,
            name: name ?? self.name,
            resizedStaticIcons: resizedStaticIcons ?? self.resizedStaticIcons,
            iconFormat: iconFormat ?? self.iconFormat,
            iconHeight: iconHeight ?? self.iconHeight,
            pennyPrice: pennyPrice ?? self.pennyPrice,
            awardType: awardType ?? self.awardType,
            staticIconURL: staticIconURL ?? self.staticIconURL
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - ResizedIcon
struct ResizedIcon: Codable {
    let url: String?
    let width, height: Int?
}

// MARK: ResizedIcon convenience initializers and mutators

extension ResizedIcon {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ResizedIcon.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        url: String?? = nil,
        width: Int?? = nil,
        height: Int?? = nil
    ) -> ResizedIcon {
        return ResizedIcon(
            url: url ?? self.url,
            width: width ?? self.width,
            height: height ?? self.height
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum FlairTextColor: String, Codable {
    case dark = "dark"
    case light = "light"
}

enum AuthorFlairType: String, Codable {
    case text = "text"
}

// MARK: - CrosspostParentList
struct CrosspostParentList: Codable {
    let approvedAtUTC: JSONNull?
    let subreddit, selftext, authorFullname: String?
    let saved: Bool?
    let modReasonTitle: JSONNull?
    let gilded: Int?
    let clicked: Bool?
    let title: String?
    let linkFlairRichtext: [LinkFlairRichtext]?
    let subredditNamePrefixed: String?
    let hidden: Bool?
    let pwls: Int?
    let linkFlairCSSClass: String?
    let downs: Int?
    let thumbnailHeight, topAwardedType: JSONNull?
    let hideScore: Bool?
    let name: String?
    let quarantine: Bool?
    let linkFlairTextColor: FlairTextColor?
    let upvoteRatio: Double?
    let authorFlairBackgroundColor: JSONNull?
    let subredditType: SubredditType?
    let ups, totalAwardsReceived: Int?
    let mediaEmbed: Gildings?
    let thumbnailWidth, authorFlairTemplateID: JSONNull?
    let isOriginalContent: Bool?
    let userReports: [JSONAny]?
    let secureMedia: JSONNull?
    let isRedditMediaDomain, isMeta: Bool?
    let category: JSONNull?
    let secureMediaEmbed: Gildings?
    let linkFlairText: String?
    let canModPost: Bool?
    let score: Int?
    let approvedBy: JSONNull?
    let authorPremium: Bool?
    let thumbnail: String?
    let edited: Int?
    let authorFlairCSSClass: JSONNull?
    let authorFlairRichtext: [JSONAny]?
    let gildings: Gildings?
    let postHint: String?
    let contentCategories: JSONNull?
    let isSelf: Bool?
    let modNote: JSONNull?
    let created: Int?
    let linkFlairType: String?
    let wls: Int?
    let removedByCategory, bannedBy: JSONNull?
    let authorFlairType: AuthorFlairType?
    let domain: String?
    let allowLiveComments: Bool?
    let selftextHTML: String?
    let likes: JSONNull?
    let suggestedSort: String?
    let bannedAtUTC, viewCount: JSONNull?
    let archived, noFollow, isCrosspostable, pinned: Bool?
    let over18: Bool?
    let preview: Preview?
    let allAwardings, awarders: [JSONAny]?
    let mediaOnly: Bool?
    let linkFlairTemplateID: String?
    let canGild, spoiler, locked: Bool?
    let authorFlairText: JSONNull?
    let treatmentTags: [JSONAny]?
    let visited: Bool?
    let removedBy, numReports, distinguished: JSONNull?
    let subredditID: String?
    let modReasonBy, removalReason: JSONNull?
    let linkFlairBackgroundColor, id: String?
    let isRobotIndexable: Bool?
    let reportReasons: JSONNull?
    let author: String?
    let discussionType: JSONNull?
    let numComments: Int?
    let sendReplies: Bool?
    let whitelistStatus: WhitelistStatus?
    let contestMode: Bool?
    let modReports: [JSONAny]?
    let authorPatreonFlair: Bool?
    let authorFlairTextColor: JSONNull?
    let permalink: String?
    let parentWhitelistStatus: WhitelistStatus?
    let stickied: Bool?
    let url: String?
    let subredditSubscribers, createdUTC, numCrossposts: Int?
    let media: JSONNull?
    let isVideo: Bool?

    enum CodingKeys: String, CodingKey {
        case approvedAtUTC = "approved_at_utc"
        case subreddit, selftext
        case authorFullname = "author_fullname"
        case saved
        case modReasonTitle = "mod_reason_title"
        case gilded, clicked, title
        case linkFlairRichtext = "link_flair_richtext"
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case hidden, pwls
        case linkFlairCSSClass = "link_flair_css_class"
        case downs
        case thumbnailHeight = "thumbnail_height"
        case topAwardedType = "top_awarded_type"
        case hideScore = "hide_score"
        case name, quarantine
        case linkFlairTextColor = "link_flair_text_color"
        case upvoteRatio = "upvote_ratio"
        case authorFlairBackgroundColor = "author_flair_background_color"
        case subredditType = "subreddit_type"
        case ups
        case totalAwardsReceived = "total_awards_received"
        case mediaEmbed = "media_embed"
        case thumbnailWidth = "thumbnail_width"
        case authorFlairTemplateID = "author_flair_template_id"
        case isOriginalContent = "is_original_content"
        case userReports = "user_reports"
        case secureMedia = "secure_media"
        case isRedditMediaDomain = "is_reddit_media_domain"
        case isMeta = "is_meta"
        case category
        case secureMediaEmbed = "secure_media_embed"
        case linkFlairText = "link_flair_text"
        case canModPost = "can_mod_post"
        case score
        case approvedBy = "approved_by"
        case authorPremium = "author_premium"
        case thumbnail, edited
        case authorFlairCSSClass = "author_flair_css_class"
        case authorFlairRichtext = "author_flair_richtext"
        case gildings
        case postHint = "post_hint"
        case contentCategories = "content_categories"
        case isSelf = "is_self"
        case modNote = "mod_note"
        case created
        case linkFlairType = "link_flair_type"
        case wls
        case removedByCategory = "removed_by_category"
        case bannedBy = "banned_by"
        case authorFlairType = "author_flair_type"
        case domain
        case allowLiveComments = "allow_live_comments"
        case selftextHTML = "selftext_html"
        case likes
        case suggestedSort = "suggested_sort"
        case bannedAtUTC = "banned_at_utc"
        case viewCount = "view_count"
        case archived
        case noFollow = "no_follow"
        case isCrosspostable = "is_crosspostable"
        case pinned
        case over18 = "over_18"
        case preview
        case allAwardings = "all_awardings"
        case awarders
        case mediaOnly = "media_only"
        case linkFlairTemplateID = "link_flair_template_id"
        case canGild = "can_gild"
        case spoiler, locked
        case authorFlairText = "author_flair_text"
        case treatmentTags = "treatment_tags"
        case visited
        case removedBy = "removed_by"
        case numReports = "num_reports"
        case distinguished
        case subredditID = "subreddit_id"
        case modReasonBy = "mod_reason_by"
        case removalReason = "removal_reason"
        case linkFlairBackgroundColor = "link_flair_background_color"
        case id
        case isRobotIndexable = "is_robot_indexable"
        case reportReasons = "report_reasons"
        case author
        case discussionType = "discussion_type"
        case numComments = "num_comments"
        case sendReplies = "send_replies"
        case whitelistStatus = "whitelist_status"
        case contestMode = "contest_mode"
        case modReports = "mod_reports"
        case authorPatreonFlair = "author_patreon_flair"
        case authorFlairTextColor = "author_flair_text_color"
        case permalink
        case parentWhitelistStatus = "parent_whitelist_status"
        case stickied, url
        case subredditSubscribers = "subreddit_subscribers"
        case createdUTC = "created_utc"
        case numCrossposts = "num_crossposts"
        case media
        case isVideo = "is_video"
    }
}

// MARK: CrosspostParentList convenience initializers and mutators

extension CrosspostParentList {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CrosspostParentList.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        approvedAtUTC: JSONNull?? = nil,
        subreddit: String?? = nil,
        selftext: String?? = nil,
        authorFullname: String?? = nil,
        saved: Bool?? = nil,
        modReasonTitle: JSONNull?? = nil,
        gilded: Int?? = nil,
        clicked: Bool?? = nil,
        title: String?? = nil,
        linkFlairRichtext: [LinkFlairRichtext]?? = nil,
        subredditNamePrefixed: String?? = nil,
        hidden: Bool?? = nil,
        pwls: Int?? = nil,
        linkFlairCSSClass: String?? = nil,
        downs: Int?? = nil,
        thumbnailHeight: JSONNull?? = nil,
        topAwardedType: JSONNull?? = nil,
        hideScore: Bool?? = nil,
        name: String?? = nil,
        quarantine: Bool?? = nil,
        linkFlairTextColor: FlairTextColor?? = nil,
        upvoteRatio: Double?? = nil,
        authorFlairBackgroundColor: JSONNull?? = nil,
        subredditType: SubredditType?? = nil,
        ups: Int?? = nil,
        totalAwardsReceived: Int?? = nil,
        mediaEmbed: Gildings?? = nil,
        thumbnailWidth: JSONNull?? = nil,
        authorFlairTemplateID: JSONNull?? = nil,
        isOriginalContent: Bool?? = nil,
        userReports: [JSONAny]?? = nil,
        secureMedia: JSONNull?? = nil,
        isRedditMediaDomain: Bool?? = nil,
        isMeta: Bool?? = nil,
        category: JSONNull?? = nil,
        secureMediaEmbed: Gildings?? = nil,
        linkFlairText: String?? = nil,
        canModPost: Bool?? = nil,
        score: Int?? = nil,
        approvedBy: JSONNull?? = nil,
        authorPremium: Bool?? = nil,
        thumbnail: String?? = nil,
        edited: Int?? = nil,
        authorFlairCSSClass: JSONNull?? = nil,
        authorFlairRichtext: [JSONAny]?? = nil,
        gildings: Gildings?? = nil,
        postHint: String?? = nil,
        contentCategories: JSONNull?? = nil,
        isSelf: Bool?? = nil,
        modNote: JSONNull?? = nil,
        created: Int?? = nil,
        linkFlairType: String?? = nil,
        wls: Int?? = nil,
        removedByCategory: JSONNull?? = nil,
        bannedBy: JSONNull?? = nil,
        authorFlairType: AuthorFlairType?? = nil,
        domain: String?? = nil,
        allowLiveComments: Bool?? = nil,
        selftextHTML: String?? = nil,
        likes: JSONNull?? = nil,
        suggestedSort: String?? = nil,
        bannedAtUTC: JSONNull?? = nil,
        viewCount: JSONNull?? = nil,
        archived: Bool?? = nil,
        noFollow: Bool?? = nil,
        isCrosspostable: Bool?? = nil,
        pinned: Bool?? = nil,
        over18: Bool?? = nil,
        preview: Preview?? = nil,
        allAwardings: [JSONAny]?? = nil,
        awarders: [JSONAny]?? = nil,
        mediaOnly: Bool?? = nil,
        linkFlairTemplateID: String?? = nil,
        canGild: Bool?? = nil,
        spoiler: Bool?? = nil,
        locked: Bool?? = nil,
        authorFlairText: JSONNull?? = nil,
        treatmentTags: [JSONAny]?? = nil,
        visited: Bool?? = nil,
        removedBy: JSONNull?? = nil,
        numReports: JSONNull?? = nil,
        distinguished: JSONNull?? = nil,
        subredditID: String?? = nil,
        modReasonBy: JSONNull?? = nil,
        removalReason: JSONNull?? = nil,
        linkFlairBackgroundColor: String?? = nil,
        id: String?? = nil,
        isRobotIndexable: Bool?? = nil,
        reportReasons: JSONNull?? = nil,
        author: String?? = nil,
        discussionType: JSONNull?? = nil,
        numComments: Int?? = nil,
        sendReplies: Bool?? = nil,
        whitelistStatus: WhitelistStatus?? = nil,
        contestMode: Bool?? = nil,
        modReports: [JSONAny]?? = nil,
        authorPatreonFlair: Bool?? = nil,
        authorFlairTextColor: JSONNull?? = nil,
        permalink: String?? = nil,
        parentWhitelistStatus: WhitelistStatus?? = nil,
        stickied: Bool?? = nil,
        url: String?? = nil,
        subredditSubscribers: Int?? = nil,
        createdUTC: Int?? = nil,
        numCrossposts: Int?? = nil,
        media: JSONNull?? = nil,
        isVideo: Bool?? = nil
    ) -> CrosspostParentList {
        return CrosspostParentList(
            approvedAtUTC: approvedAtUTC ?? self.approvedAtUTC,
            subreddit: subreddit ?? self.subreddit,
            selftext: selftext ?? self.selftext,
            authorFullname: authorFullname ?? self.authorFullname,
            saved: saved ?? self.saved,
            modReasonTitle: modReasonTitle ?? self.modReasonTitle,
            gilded: gilded ?? self.gilded,
            clicked: clicked ?? self.clicked,
            title: title ?? self.title,
            linkFlairRichtext: linkFlairRichtext ?? self.linkFlairRichtext,
            subredditNamePrefixed: subredditNamePrefixed ?? self.subredditNamePrefixed,
            hidden: hidden ?? self.hidden,
            pwls: pwls ?? self.pwls,
            linkFlairCSSClass: linkFlairCSSClass ?? self.linkFlairCSSClass,
            downs: downs ?? self.downs,
            thumbnailHeight: thumbnailHeight ?? self.thumbnailHeight,
            topAwardedType: topAwardedType ?? self.topAwardedType,
            hideScore: hideScore ?? self.hideScore,
            name: name ?? self.name,
            quarantine: quarantine ?? self.quarantine,
            linkFlairTextColor: linkFlairTextColor ?? self.linkFlairTextColor,
            upvoteRatio: upvoteRatio ?? self.upvoteRatio,
            authorFlairBackgroundColor: authorFlairBackgroundColor ?? self.authorFlairBackgroundColor,
            subredditType: subredditType ?? self.subredditType,
            ups: ups ?? self.ups,
            totalAwardsReceived: totalAwardsReceived ?? self.totalAwardsReceived,
            mediaEmbed: mediaEmbed ?? self.mediaEmbed,
            thumbnailWidth: thumbnailWidth ?? self.thumbnailWidth,
            authorFlairTemplateID: authorFlairTemplateID ?? self.authorFlairTemplateID,
            isOriginalContent: isOriginalContent ?? self.isOriginalContent,
            userReports: userReports ?? self.userReports,
            secureMedia: secureMedia ?? self.secureMedia,
            isRedditMediaDomain: isRedditMediaDomain ?? self.isRedditMediaDomain,
            isMeta: isMeta ?? self.isMeta,
            category: category ?? self.category,
            secureMediaEmbed: secureMediaEmbed ?? self.secureMediaEmbed,
            linkFlairText: linkFlairText ?? self.linkFlairText,
            canModPost: canModPost ?? self.canModPost,
            score: score ?? self.score,
            approvedBy: approvedBy ?? self.approvedBy,
            authorPremium: authorPremium ?? self.authorPremium,
            thumbnail: thumbnail ?? self.thumbnail,
            edited: edited ?? self.edited,
            authorFlairCSSClass: authorFlairCSSClass ?? self.authorFlairCSSClass,
            authorFlairRichtext: authorFlairRichtext ?? self.authorFlairRichtext,
            gildings: gildings ?? self.gildings,
            postHint: postHint ?? self.postHint,
            contentCategories: contentCategories ?? self.contentCategories,
            isSelf: isSelf ?? self.isSelf,
            modNote: modNote ?? self.modNote,
            created: created ?? self.created,
            linkFlairType: linkFlairType ?? self.linkFlairType,
            wls: wls ?? self.wls,
            removedByCategory: removedByCategory ?? self.removedByCategory,
            bannedBy: bannedBy ?? self.bannedBy,
            authorFlairType: authorFlairType ?? self.authorFlairType,
            domain: domain ?? self.domain,
            allowLiveComments: allowLiveComments ?? self.allowLiveComments,
            selftextHTML: selftextHTML ?? self.selftextHTML,
            likes: likes ?? self.likes,
            suggestedSort: suggestedSort ?? self.suggestedSort,
            bannedAtUTC: bannedAtUTC ?? self.bannedAtUTC,
            viewCount: viewCount ?? self.viewCount,
            archived: archived ?? self.archived,
            noFollow: noFollow ?? self.noFollow,
            isCrosspostable: isCrosspostable ?? self.isCrosspostable,
            pinned: pinned ?? self.pinned,
            over18: over18 ?? self.over18,
            preview: preview ?? self.preview,
            allAwardings: allAwardings ?? self.allAwardings,
            awarders: awarders ?? self.awarders,
            mediaOnly: mediaOnly ?? self.mediaOnly,
            linkFlairTemplateID: linkFlairTemplateID ?? self.linkFlairTemplateID,
            canGild: canGild ?? self.canGild,
            spoiler: spoiler ?? self.spoiler,
            locked: locked ?? self.locked,
            authorFlairText: authorFlairText ?? self.authorFlairText,
            treatmentTags: treatmentTags ?? self.treatmentTags,
            visited: visited ?? self.visited,
            removedBy: removedBy ?? self.removedBy,
            numReports: numReports ?? self.numReports,
            distinguished: distinguished ?? self.distinguished,
            subredditID: subredditID ?? self.subredditID,
            modReasonBy: modReasonBy ?? self.modReasonBy,
            removalReason: removalReason ?? self.removalReason,
            linkFlairBackgroundColor: linkFlairBackgroundColor ?? self.linkFlairBackgroundColor,
            id: id ?? self.id,
            isRobotIndexable: isRobotIndexable ?? self.isRobotIndexable,
            reportReasons: reportReasons ?? self.reportReasons,
            author: author ?? self.author,
            discussionType: discussionType ?? self.discussionType,
            numComments: numComments ?? self.numComments,
            sendReplies: sendReplies ?? self.sendReplies,
            whitelistStatus: whitelistStatus ?? self.whitelistStatus,
            contestMode: contestMode ?? self.contestMode,
            modReports: modReports ?? self.modReports,
            authorPatreonFlair: authorPatreonFlair ?? self.authorPatreonFlair,
            authorFlairTextColor: authorFlairTextColor ?? self.authorFlairTextColor,
            permalink: permalink ?? self.permalink,
            parentWhitelistStatus: parentWhitelistStatus ?? self.parentWhitelistStatus,
            stickied: stickied ?? self.stickied,
            url: url ?? self.url,
            subredditSubscribers: subredditSubscribers ?? self.subredditSubscribers,
            createdUTC: createdUTC ?? self.createdUTC,
            numCrossposts: numCrossposts ?? self.numCrossposts,
            media: media ?? self.media,
            isVideo: isVideo ?? self.isVideo
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Gildings
struct Gildings: Codable {
}

// MARK: Gildings convenience initializers and mutators

extension Gildings {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Gildings.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
    ) -> Gildings {
        return Gildings(
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - LinkFlairRichtext
struct LinkFlairRichtext: Codable {
    let e: AuthorFlairType?
    let t: String?
}

// MARK: LinkFlairRichtext convenience initializers and mutators

extension LinkFlairRichtext {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(LinkFlairRichtext.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        e: AuthorFlairType?? = nil,
        t: String?? = nil
    ) -> LinkFlairRichtext {
        return LinkFlairRichtext(
            e: e ?? self.e,
            t: t ?? self.t
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum WhitelistStatus: String, Codable {
    case allAds = "all_ads"
}

// MARK: - Preview
struct Preview: Codable {
    let images: [Image]?
    let enabled: Bool?
}

// MARK: Preview convenience initializers and mutators

extension Preview {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Preview.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        images: [Image]?? = nil,
        enabled: Bool?? = nil
    ) -> Preview {
        return Preview(
            images: images ?? self.images,
            enabled: enabled ?? self.enabled
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Image
struct Image: Codable {
    let source: ResizedIcon?
    let resolutions: [ResizedIcon]?
    let variants: Gildings?
    let id: String?
}

// MARK: Image convenience initializers and mutators

extension Image {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Image.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        source: ResizedIcon?? = nil,
        resolutions: [ResizedIcon]?? = nil,
        variants: Gildings?? = nil,
        id: String?? = nil
    ) -> Image {
        return Image(
            source: source ?? self.source,
            resolutions: resolutions ?? self.resolutions,
            variants: variants ?? self.variants,
            id: id ?? self.id
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum SubredditType: String, Codable {
    case subredditTypePublic = "public"
}

// MARK: - GalleryData
struct GalleryData: Codable {
    let items: [Item]?
}

// MARK: GalleryData convenience initializers and mutators

extension GalleryData {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GalleryData.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        items: [Item]?? = nil
    ) -> GalleryData {
        return GalleryData(
            items: items ?? self.items
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Item
struct Item: Codable {
    let mediaID: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case mediaID = "media_id"
        case id
    }
}

// MARK: Item convenience initializers and mutators

extension Item {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Item.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        mediaID: String?? = nil,
        id: Int?? = nil
    ) -> Item {
        return Item(
            mediaID: mediaID ?? self.mediaID,
            id: id ?? self.id
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum LinkFlairBackgroundColor: String, Codable {
    case b52F3B = "#b52f3b"
    case cc5289 = "#cc5289"
    case empty = ""
    case the0079D3 = "#0079d3"
    case the349E48 = "#349e48"
}

// MARK: - Media
struct Media: Codable {
    let type: String?
    let oembed: Oembed?
    let redditVideo: RedditVideo?

    enum CodingKeys: String, CodingKey {
        case type, oembed
        case redditVideo = "reddit_video"
    }
}

// MARK: Media convenience initializers and mutators

extension Media {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Media.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        type: String?? = nil,
        oembed: Oembed?? = nil,
        redditVideo: RedditVideo?? = nil
    ) -> Media {
        return Media(
            type: type ?? self.type,
            oembed: oembed ?? self.oembed,
            redditVideo: redditVideo ?? self.redditVideo
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Oembed
struct Oembed: Codable {
    let providerURL: String?
    let version, title, type: String?
    let thumbnailWidth, height, width: Int?
    let html, authorName, providerName: String?
    let thumbnailURL: String?
    let thumbnailHeight: Int?
    let authorURL: String?

    enum CodingKeys: String, CodingKey {
        case providerURL = "provider_url"
        case version, title, type
        case thumbnailWidth = "thumbnail_width"
        case height, width, html
        case authorName = "author_name"
        case providerName = "provider_name"
        case thumbnailURL = "thumbnail_url"
        case thumbnailHeight = "thumbnail_height"
        case authorURL = "author_url"
    }
}

// MARK: Oembed convenience initializers and mutators

extension Oembed {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Oembed.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        providerURL: String?? = nil,
        version: String?? = nil,
        title: String?? = nil,
        type: String?? = nil,
        thumbnailWidth: Int?? = nil,
        height: Int?? = nil,
        width: Int?? = nil,
        html: String?? = nil,
        authorName: String?? = nil,
        providerName: String?? = nil,
        thumbnailURL: String?? = nil,
        thumbnailHeight: Int?? = nil,
        authorURL: String?? = nil
    ) -> Oembed {
        return Oembed(
            providerURL: providerURL ?? self.providerURL,
            version: version ?? self.version,
            title: title ?? self.title,
            type: type ?? self.type,
            thumbnailWidth: thumbnailWidth ?? self.thumbnailWidth,
            height: height ?? self.height,
            width: width ?? self.width,
            html: html ?? self.html,
            authorName: authorName ?? self.authorName,
            providerName: providerName ?? self.providerName,
            thumbnailURL: thumbnailURL ?? self.thumbnailURL,
            thumbnailHeight: thumbnailHeight ?? self.thumbnailHeight,
            authorURL: authorURL ?? self.authorURL
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - RedditVideo
struct RedditVideo: Codable {
    let fallbackURL: String?
    let height, width: Int?
    let scrubberMediaURL: String?
    let dashURL: String?
    let duration: Int?
    let hlsURL: String?
    let isGIF: Bool?
    let transcodingStatus: String?

    enum CodingKeys: String, CodingKey {
        case fallbackURL = "fallback_url"
        case height, width
        case scrubberMediaURL = "scrubber_media_url"
        case dashURL = "dash_url"
        case duration
        case hlsURL = "hls_url"
        case isGIF = "is_gif"
        case transcodingStatus = "transcoding_status"
    }
}

// MARK: RedditVideo convenience initializers and mutators

extension RedditVideo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RedditVideo.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        fallbackURL: String?? = nil,
        height: Int?? = nil,
        width: Int?? = nil,
        scrubberMediaURL: String?? = nil,
        dashURL: String?? = nil,
        duration: Int?? = nil,
        hlsURL: String?? = nil,
        isGIF: Bool?? = nil,
        transcodingStatus: String?? = nil
    ) -> RedditVideo {
        return RedditVideo(
            fallbackURL: fallbackURL ?? self.fallbackURL,
            height: height ?? self.height,
            width: width ?? self.width,
            scrubberMediaURL: scrubberMediaURL ?? self.scrubberMediaURL,
            dashURL: dashURL ?? self.dashURL,
            duration: duration ?? self.duration,
            hlsURL: hlsURL ?? self.hlsURL,
            isGIF: isGIF ?? self.isGIF,
            transcodingStatus: transcodingStatus ?? self.transcodingStatus
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - MediaEmbed
struct MediaEmbed: Codable {
    let content: String?
    let width: Int?
    let scrolling: Bool?
    let height: Int?
    let mediaDomainURL: String?

    enum CodingKeys: String, CodingKey {
        case content, width, scrolling, height
        case mediaDomainURL = "media_domain_url"
    }
}

// MARK: MediaEmbed convenience initializers and mutators

extension MediaEmbed {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MediaEmbed.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        content: String?? = nil,
        width: Int?? = nil,
        scrolling: Bool?? = nil,
        height: Int?? = nil,
        mediaDomainURL: String?? = nil
    ) -> MediaEmbed {
        return MediaEmbed(
            content: content ?? self.content,
            width: width ?? self.width,
            scrolling: scrolling ?? self.scrolling,
            height: height ?? self.height,
            mediaDomainURL: mediaDomainURL ?? self.mediaDomainURL
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - MediaMetadata
struct MediaMetadata: Codable {
    let uxy1Qocivlr51: Uxy1Qocivlr51?
    let v2Netmt2Cjr51, the3Fyf3Ov3Cjr51: Cjr51?

    enum CodingKeys: String, CodingKey {
        case uxy1Qocivlr51 = "uxy1qocivlr51"
        case v2Netmt2Cjr51 = "v2netmt2cjr51"
        case the3Fyf3Ov3Cjr51 = "3fyf3ov3cjr51"
    }
}

// MARK: MediaMetadata convenience initializers and mutators

extension MediaMetadata {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MediaMetadata.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        uxy1Qocivlr51: Uxy1Qocivlr51?? = nil,
        v2Netmt2Cjr51: Cjr51?? = nil,
        the3Fyf3Ov3Cjr51: Cjr51?? = nil
    ) -> MediaMetadata {
        return MediaMetadata(
            uxy1Qocivlr51: uxy1Qocivlr51 ?? self.uxy1Qocivlr51,
            v2Netmt2Cjr51: v2Netmt2Cjr51 ?? self.v2Netmt2Cjr51,
            the3Fyf3Ov3Cjr51: the3Fyf3Ov3Cjr51 ?? self.the3Fyf3Ov3Cjr51
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Cjr51
struct Cjr51: Codable {
    let status, e, m: String?
    let p: [SElement]?
    let s: SElement?
    let id: String?
}

// MARK: Cjr51 convenience initializers and mutators

extension Cjr51 {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Cjr51.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        status: String?? = nil,
        e: String?? = nil,
        m: String?? = nil,
        p: [SElement]?? = nil,
        s: SElement?? = nil,
        id: String?? = nil
    ) -> Cjr51 {
        return Cjr51(
            status: status ?? self.status,
            e: e ?? self.e,
            m: m ?? self.m,
            p: p ?? self.p,
            s: s ?? self.s,
            id: id ?? self.id
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - SElement
struct SElement: Codable {
    let y, x: Int?
    let u: String?
}

// MARK: SElement convenience initializers and mutators

extension SElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SElement.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        y: Int?? = nil,
        x: Int?? = nil,
        u: String?? = nil
    ) -> SElement {
        return SElement(
            y: y ?? self.y,
            x: x ?? self.x,
            u: u ?? self.u
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Uxy1Qocivlr51
struct Uxy1Qocivlr51: Codable {
    let status, e, m: String?
    let p: [SElement]?
    let s: PurpleS?
    let id: String?
}

// MARK: Uxy1Qocivlr51 convenience initializers and mutators

extension Uxy1Qocivlr51 {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Uxy1Qocivlr51.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        status: String?? = nil,
        e: String?? = nil,
        m: String?? = nil,
        p: [SElement]?? = nil,
        s: PurpleS?? = nil,
        id: String?? = nil
    ) -> Uxy1Qocivlr51 {
        return Uxy1Qocivlr51(
            status: status ?? self.status,
            e: e ?? self.e,
            m: m ?? self.m,
            p: p ?? self.p,
            s: s ?? self.s,
            id: id ?? self.id
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - PurpleS
struct PurpleS: Codable {
    let y: Int?
    let gif, mp4: String?
    let x: Int?
}

// MARK: PurpleS convenience initializers and mutators

extension PurpleS {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PurpleS.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        y: Int?? = nil,
        gif: String?? = nil,
        mp4: String?? = nil,
        x: Int?? = nil
    ) -> PurpleS {
        return PurpleS(
            y: y ?? self.y,
            gif: gif ?? self.gif,
            mp4: mp4 ?? self.mp4,
            x: x ?? self.x
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Subreddit: String, Codable {
    case swift = "swift"
}

enum SubredditID: String, Codable {
    case t52Z6Zi = "t5_2z6zi"
}

enum SubredditNamePrefixed: String, Codable {
    case rSwift = "r/swift"
}

enum Kind: String, Codable {
    case t3 = "t3"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

