CREATE TABLE "attestation_challenge" ("id" character varying(32) NOT NULL, "userId" character varying(32) NOT NULL, "challenge" character varying(64) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "registrationChallenge" boolean NOT NULL DEFAULT false, CONSTRAINT "PK_d0ba6786e093f1bcb497572a6b5" PRIMARY KEY ("id", "userId"))
;
CREATE TABLE "meta" ("id" character varying(32) NOT NULL, "name" character varying(128), "description" character varying(1024), "maintainerName" character varying(128), "maintainerEmail" character varying(128), "announcements" jsonb NOT NULL DEFAULT '[]', "disableRegistration" boolean NOT NULL DEFAULT false, "disableLocalTimeline" boolean NOT NULL DEFAULT false, "disableGlobalTimeline" boolean NOT NULL DEFAULT false, "enableEmojiReaction" boolean NOT NULL DEFAULT true, "useStarForReactionFallback" boolean NOT NULL DEFAULT false, "langs" character varying(64) array NOT NULL DEFAULT '{}'::varchar[], "hiddenTags" character varying(256) array NOT NULL DEFAULT '{}'::varchar[], "blockedHosts" character varying(256) array NOT NULL DEFAULT '{}'::varchar[], "mascotImageUrl" character varying(512) DEFAULT '/assets/ai.png', "bannerUrl" character varying(512), "errorImageUrl" character varying(512) DEFAULT 'https://xn--931a.moe/aiart/yubitun.png', "iconUrl" character varying(512), "cacheRemoteFiles" boolean NOT NULL DEFAULT true, "proxyAccount" character varying(128), "enableRecaptcha" boolean NOT NULL DEFAULT false, "recaptchaSiteKey" character varying(64), "recaptchaSecretKey" character varying(64), "localDriveCapacityMb" integer NOT NULL DEFAULT 1024, "remoteDriveCapacityMb" integer NOT NULL DEFAULT 32, "maxNoteTextLength" integer NOT NULL DEFAULT 500, "summalyProxy" character varying(128), "enableEmail" boolean NOT NULL DEFAULT false, "email" character varying(128), "smtpSecure" boolean NOT NULL DEFAULT false, "smtpHost" character varying(128), "smtpPort" integer, "smtpUser" character varying(128), "smtpPass" character varying(128), "enableServiceWorker" boolean NOT NULL DEFAULT false, "swPublicKey" character varying(128), "swPrivateKey" character varying(128), "enableTwitterIntegration" boolean NOT NULL DEFAULT false, "twitterConsumerKey" character varying(128), "twitterConsumerSecret" character varying(128), "enableGithubIntegration" boolean NOT NULL DEFAULT false, "githubClientId" character varying(128), "githubClientSecret" character varying(128), "enableDiscordIntegration" boolean NOT NULL DEFAULT false, "discordClientId" character varying(128), "discordClientSecret" character varying(128), CONSTRAINT "PK_c4c17a6c2bd7651338b60fc590b" PRIMARY KEY ("id"))
;
ALTER TABLE "meta" ADD "pinnedUsers" character varying(256) array NOT NULL DEFAULT '{}'::varchar[]
;
ALTER TABLE "meta" ADD "pinnedPages" character varying(512) array NOT NULL DEFAULT '{"/featured", "/channels", "/explore", "/pages", "/about-misskey"}'::varchar[]
;
CREATE TABLE "muting" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "muteeId" character varying(32) NOT NULL, "muterId" character varying(32) NOT NULL, CONSTRAINT "PK_2e92d06c8b5c602eeb27ca9ba48" PRIMARY KEY ("id"))
;
ALTER TABLE "meta" ADD "pinnedClipId" character varying(32)
;
ALTER TABLE "meta" ADD "themeColor" character varying(512)
;
ALTER TABLE "meta" ADD "backgroundImageUrl" character varying(512)
;
CREATE TABLE "user" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE, "lastFetchedAt" TIMESTAMP WITH TIME ZONE, "username" character varying(128) NOT NULL, "usernameLower" character varying(128) NOT NULL, "name" character varying(128), "followersCount" integer NOT NULL DEFAULT 0, "followingCount" integer NOT NULL DEFAULT 0, "notesCount" integer NOT NULL DEFAULT 0, "avatarId" character varying(32), "bannerId" character varying(32), "tags" character varying(128) array NOT NULL DEFAULT '{}'::varchar[], "avatarUrl" character varying(512), "bannerUrl" character varying(512), "avatarColor" character varying(32), "bannerColor" character varying(32), "isSuspended" boolean NOT NULL DEFAULT false, "isSilenced" boolean NOT NULL DEFAULT false, "isLocked" boolean NOT NULL DEFAULT false, "isBot" boolean NOT NULL DEFAULT false, "isCat" boolean NOT NULL DEFAULT false, "isAdmin" boolean NOT NULL DEFAULT false, "isModerator" boolean NOT NULL DEFAULT false, "isVerified" boolean NOT NULL DEFAULT false, "emojis" character varying(128) array NOT NULL DEFAULT '{}'::varchar[], "host" character varying(128), "inbox" character varying(512), "sharedInbox" character varying(512), "featured" character varying(512), "uri" character varying(512), "token" character(16), CONSTRAINT "UQ_a854e557b1b14814750c7c7b0c9" UNIQUE ("token"), CONSTRAINT "REL_58f5c71eaab331645112cf8cfa" UNIQUE ("avatarId"), CONSTRAINT "REL_afc64b53f8db3707ceb34eb28e" UNIQUE ("bannerId"), CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY ("id"))
;
ALTER TABLE "meta" ADD "logoImageUrl" character varying(512)
;
ALTER TABLE "meta" ADD "proxyAccountId" character varying(32)
;
ALTER TABLE "meta" ADD "emailRequiredForSignup" boolean NOT NULL DEFAULT false
;
ALTER TABLE "meta" ADD "enableHcaptcha" boolean NOT NULL DEFAULT false
;
ALTER TABLE "meta" ADD "hcaptchaSiteKey" character varying(64)
;
ALTER TABLE "meta" ADD "hcaptchaSecretKey" character varying(64)
;
CREATE TYPE "public"."meta_sensitivemediadetection_enum" AS ENUM('none', 'all', 'local', 'remote')
;
ALTER TABLE "meta" ADD "sensitiveMediaDetection" "public"."meta_sensitivemediadetection_enum" NOT NULL DEFAULT 'none'
;
CREATE TYPE "public"."meta_sensitivemediadetectionsensitivity_enum" AS ENUM('medium', 'low', 'high', 'veryLow', 'veryHigh')
;
ALTER TABLE "meta" ADD "sensitiveMediaDetectionSensitivity" "public"."meta_sensitivemediadetectionsensitivity_enum" NOT NULL DEFAULT 'medium'
;
ALTER TABLE "meta" ADD "setSensitiveFlagAutomatically" boolean NOT NULL DEFAULT false
;
ALTER TABLE "meta" ADD "enableSensitiveMediaDetectionForVideos" boolean NOT NULL DEFAULT false
;
ALTER TABLE "meta" ADD "deeplAuthKey" character varying(128)
;
ALTER TABLE "meta" ADD "ToSUrl" character varying(512)
;
ALTER TABLE "meta" ADD "repositoryUrl" character varying(512) NOT NULL DEFAULT 'https://github.com/misskey-dev/misskey'
;
ALTER TABLE "meta" ADD "feedbackUrl" character varying(512) DEFAULT 'https://github.com/misskey-dev/misskey/issues/new'
;
ALTER TABLE "meta" ADD "defaultLightTheme" character varying(8192)
;
ALTER TABLE "meta" ADD "defaultDarkTheme" character varying(8192)
;
ALTER TABLE "meta" ADD "useObjectStorage" boolean NOT NULL DEFAULT false
;
ALTER TABLE "meta" ADD "objectStorageBucket" character varying(512)
;
ALTER TABLE "meta" ADD "objectStoragePrefix" character varying(512)
;
ALTER TABLE "meta" ADD "objectStorageBaseUrl" character varying(512)
;
ALTER TABLE "meta" ADD "objectStorageEndpoint" character varying(512)
;
ALTER TABLE "meta" ADD "objectStorageRegion" character varying(512)
;
ALTER TABLE "meta" ADD "objectStorageAccessKey" character varying(512)
;
ALTER TABLE "meta" ADD "objectStorageSecretKey" character varying(512)
;
ALTER TABLE "meta" ADD "objectStoragePort" integer
;
ALTER TABLE "meta" ADD "objectStorageUseSSL" boolean NOT NULL DEFAULT true
;
ALTER TABLE "meta" ADD "objectStorageUseProxy" boolean NOT NULL DEFAULT true
;
ALTER TABLE "meta" ADD "objectStorageSetPublicRead" boolean NOT NULL DEFAULT false
;
ALTER TABLE "meta" ADD "objectStorageS3ForcePathStyle" boolean NOT NULL DEFAULT true
;
ALTER TABLE "meta" ADD "enableIpLogging" boolean NOT NULL DEFAULT false
;
ALTER TABLE "meta" ADD "enableActiveEmailValidation" boolean NOT NULL DEFAULT true
;
ALTER TABLE "muting" ADD "expiresAt" TIMESTAMP WITH TIME ZONE
;
ALTER TABLE "user" ADD "lastActiveDate" TIMESTAMP WITH TIME ZONE DEFAULT NULL
;
ALTER TABLE "user" ADD "hideOnlineStatus" boolean NOT NULL DEFAULT false
;
ALTER TABLE "user" ADD "isExplorable" boolean NOT NULL DEFAULT true
;
ALTER TABLE "user" ADD "isDeleted" boolean NOT NULL DEFAULT false
;
ALTER TABLE "user" ADD "followersUri" varchar(512) DEFAULT NULL
;
ALTER TABLE "user" ADD "showTimelineReplies" boolean NOT NULL DEFAULT false
;
ALTER TABLE "user" ADD "driveCapacityOverrideMb" integer
;
ALTER TABLE "meta" ADD "deeplIsPro" boolean NOT NULL DEFAULT false
;
CREATE TABLE "emoji" ("id" character varying(32) NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE, "name" character varying(128) NOT NULL, "host" character varying(128), "url" character varying(512) NOT NULL, "uri" character varying(512), "type" character varying(64), "aliases" character varying(128) array NOT NULL DEFAULT '{}'::varchar[], CONSTRAINT "PK_df74ce05e24999ee01ea0bc50a3" PRIMARY KEY ("id"))
;
ALTER TABLE "emoji" ADD "category" character varying(128)
;
ALTER TABLE "emoji" RENAME COLUMN "url" TO "originalUrl"
;
ALTER TABLE "emoji" ADD "publicUrl" character varying(512) NOT NULL DEFAULT ''
;
CREATE TABLE "following" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "followeeId" character varying(32) NOT NULL, "followerId" character varying(32) NOT NULL, "followerHost" character varying(128), "followerInbox" character varying(512), "followerSharedInbox" character varying(512), "followeeHost" character varying(128), "followeeInbox" character varying(512), "followeeSharedInbox" character varying(512), CONSTRAINT "PK_c76c6e044bdf76ecf8bfb82a645" PRIMARY KEY ("id"))
;
CREATE TABLE "instance" ("id" character varying(32) NOT NULL, "caughtAt" TIMESTAMP WITH TIME ZONE NOT NULL, "host" character varying(128) NOT NULL, "system" character varying(64), "usersCount" integer NOT NULL DEFAULT 0, "notesCount" integer NOT NULL DEFAULT 0, "followingCount" integer NOT NULL DEFAULT 0, "followersCount" integer NOT NULL DEFAULT 0, "driveUsage" integer NOT NULL DEFAULT 0, "driveFiles" integer NOT NULL DEFAULT 0, "latestRequestSentAt" TIMESTAMP WITH TIME ZONE, "latestStatus" integer, "latestRequestReceivedAt" TIMESTAMP WITH TIME ZONE, "lastCommunicatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, "isNotResponding" boolean NOT NULL DEFAULT false, "isMarkedAsClosed" boolean NOT NULL DEFAULT false, CONSTRAINT "PK_eaf60e4a0c399c9935413e06474" PRIMARY KEY ("id"))
;
ALTER TABLE "instance" ADD "isSuspended" boolean NOT NULL DEFAULT false
;
CREATE TABLE "ad" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "expiresAt" TIMESTAMP WITH TIME ZONE NOT NULL, "place" character varying(32) NOT NULL, "priority" character varying(32) NOT NULL, "url" character varying(1024) NOT NULL, "imageUrl" character varying(1024) NOT NULL, "memo" character varying(8192) NOT NULL, CONSTRAINT "PK_0193d5ef09746e88e9ea92c634d" PRIMARY KEY ("id")); COMMENT ON COLUMN "ad"."createdAt" IS 'The created date of the Ad.'; COMMENT ON COLUMN "ad"."expiresAt" IS 'The expired date of the Ad.'
;
ALTER TABLE "ad" ADD "ratio" integer NOT NULL DEFAULT '1'
;
CREATE TABLE "used_username" ("username" character varying(128) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, CONSTRAINT "PK_78fd79d2d24c6ac2f4cc9a31a5d" PRIMARY KEY ("username"))
;
CREATE TABLE "user_keypair" ("userId" character varying(32) NOT NULL, "publicKey" character varying(4096) NOT NULL, "privateKey" character varying(4096) NOT NULL, CONSTRAINT "REL_f4853eb41ab722fe05f81cedeb" UNIQUE ("userId"), CONSTRAINT "PK_f4853eb41ab722fe05f81cedeb6" PRIMARY KEY ("userId"))
;
CREATE TABLE "user_profile" ("userId" character varying(32) NOT NULL, "location" character varying(128), "birthday" character(10), "description" character varying(1024), "fields" jsonb NOT NULL DEFAULT '[]', "url" character varying(512), "email" character varying(128), "emailVerifyCode" character varying(128), "emailVerified" boolean NOT NULL DEFAULT false, "twoFactorTempSecret" character varying(128), "twoFactorSecret" character varying(128), "twoFactorEnabled" boolean NOT NULL DEFAULT false, "password" character varying(128), "clientData" jsonb NOT NULL DEFAULT '{}', "autoWatch" boolean NOT NULL DEFAULT false, "autoAcceptFollowed" boolean NOT NULL DEFAULT false, "alwaysMarkNsfw" boolean NOT NULL DEFAULT false, "carefulBot" boolean NOT NULL DEFAULT false, "twitter" boolean NOT NULL DEFAULT false, "twitterAccessToken" character varying(64) DEFAULT null, "twitterAccessTokenSecret" character varying(64) DEFAULT null, "twitterUserId" character varying(64) DEFAULT null, "twitterScreenName" character varying(64) DEFAULT null, "github" boolean NOT NULL DEFAULT false, "githubAccessToken" character varying(64) DEFAULT null, "githubId" integer DEFAULT null, "githubLogin" character varying(64) DEFAULT null, "discord" boolean NOT NULL DEFAULT false, "discordAccessToken" character varying(64) DEFAULT null, "discordRefreshToken" character varying(64) DEFAULT null, "discordExpiresDate" integer DEFAULT null, "discordId" character varying(64) DEFAULT null, "discordUsername" character varying(64) DEFAULT null, "discordDiscriminator" character varying(64) DEFAULT null, "userHost" character varying(128), CONSTRAINT "REL_51cb79b5555effaf7d69ba1cff" UNIQUE ("userId"), CONSTRAINT "PK_51cb79b5555effaf7d69ba1cff9" PRIMARY KEY ("userId"))
;

ALTER TABLE "user_profile" ADD "lang" character varying(32)
;
ALTER TABLE "user_profile" ADD "emailNotificationTypes" jsonb NOT NULL DEFAULT '["follow","receiveFollowRequest","groupInvited"]'
;
ALTER TABLE "user_profile" ADD "publicReactions" boolean NOT NULL DEFAULT false
;
CREATE TYPE "public"."user_profile_ffvisibility_enum" AS ENUM('public', 'followers', 'private')
;
ALTER TABLE "user_profile" ADD "ffVisibility" "public"."user_profile_ffvisibility_enum" NOT NULL DEFAULT 'public'
;
ALTER TABLE "user_profile" ADD "securityKeysAvailable" boolean NOT NULL DEFAULT false
;
ALTER TABLE "user_profile" ADD COLUMN "usePasswordLessLogin" boolean DEFAULT false NOT NULL
;
ALTER TABLE "user_profile" ADD "moderationNote" character varying(8192) NOT NULL DEFAULT ''
;
ALTER TABLE "user_profile" ADD "room" jsonb NOT NULL DEFAULT '{}'
;
ALTER TABLE "user_profile" ADD "noCrawle" boolean NOT NULL DEFAULT false
;
COMMENT ON COLUMN "user_profile"."noCrawle" IS 'Whether reject index by crawler.'
;
ALTER TABLE "user_profile" ADD "autoSensitive" boolean NOT NULL DEFAULT false
;
ALTER TABLE "user_profile" ADD "injectFeaturedNote" boolean NOT NULL DEFAULT true
;
ALTER TABLE "user_profile" ADD "receiveAnnouncementEmail" boolean NOT NULL DEFAULT true
;
ALTER TABLE "user_profile" ADD "pinnedPageId" character varying(32)
;
ALTER TABLE "user_profile" ADD "integrations" jsonb NOT NULL DEFAULT '{}'
;
ALTER TABLE "user_profile" ADD "mutedWords" jsonb NOT NULL DEFAULT '[]'
ALTER TABLE "user_profile" ADD "mutedInstances" jsonb NOT NULL DEFAULT '[]'
;
COMMENT ON COLUMN "user_profile"."mutedInstances" IS 'List of instances muted by the user.'
;
CREATE TYPE "user_profile_mutingnotificationtypes_enum" AS ENUM('follow', 'mention', 'reply', 'renote', 'quote', 'reaction', 'pollVote', 'receiveFollowRequest', 'followRequestAccepted', 'groupInvited', 'app')
;
ALTER TABLE "user_profile" ADD "mutingNotificationTypes" "user_profile_mutingnotificationtypes_enum" array NOT NULL DEFAULT '{}'
;
ALTER TABLE "user_profile" ADD "enableWordMute" boolean NOT NULL DEFAULT false
;
CREATE TABLE "user_note_pining" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "userId" character varying(32) NOT NULL, "noteId" character varying(32) NOT NULL, CONSTRAINT "PK_a6a2dad4ae000abce2ea9d9b103" PRIMARY KEY ("id"))
;
CREATE TYPE "note_visibility_enum" AS ENUM('public', 'home', 'followers', 'specified')
;
CREATE TABLE "note" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "replyId" character varying(32), "renoteId" character varying(32), "text" text, "name" character varying(256), "cw" character varying(512), "appId" character varying(32), "userId" character varying(32) NOT NULL, "viaMobile" boolean NOT NULL DEFAULT false, "localOnly" boolean NOT NULL DEFAULT false, "renoteCount" smallint NOT NULL DEFAULT 0, "repliesCount" smallint NOT NULL DEFAULT 0, "reactions" jsonb NOT NULL DEFAULT '{}', "visibility" "note_visibility_enum" NOT NULL, "uri" character varying(512), "score" integer NOT NULL DEFAULT 0, "fileIds" character varying(32) array NOT NULL DEFAULT '{}'::varchar[], "attachedFileTypes" character varying(256) array NOT NULL DEFAULT '{}'::varchar[], "visibleUserIds" character varying(32) array NOT NULL DEFAULT '{}'::varchar[], "mentions" character varying(32) array NOT NULL DEFAULT '{}'::varchar[], "mentionedRemoteUsers" text NOT NULL DEFAULT '[]', "emojis" character varying(128) array NOT NULL DEFAULT '{}'::varchar[], "tags" character varying(128) array NOT NULL DEFAULT '{}'::varchar[], "hasPoll" boolean NOT NULL DEFAULT false, "geo" jsonb DEFAULT null, "userHost" character varying(128), "replyUserId" character varying(32), "replyUserHost" character varying(128), "renoteUserId" character varying(32), "renoteUserHost" character varying(128), CONSTRAINT "PK_96d0c172a4fba276b1bbed43058" PRIMARY KEY ("id"))
;
ALTER TABLE "note" ADD "threadId" character varying(256)
;
ALTER TABLE "note" ADD "url" character varying(512)
;
ALTER TABLE "note" ADD "channelId" character varying(32) DEFAULT null
;
CREATE TABLE "signin" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "userId" character varying(32) NOT NULL, "ip" character varying(128) NOT NULL, "headers" jsonb NOT NULL, "success" boolean NOT NULL, CONSTRAINT "PK_9e96ddc025712616fc492b3b588" PRIMARY KEY ("id"))
;
CREATE TABLE "drive_file" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "userId" character varying(32), "userHost" character varying(128), "md5" character varying(32) NOT NULL, "name" character varying(256) NOT NULL, "type" character varying(128) NOT NULL, "size" integer NOT NULL, "comment" character varying(512), "properties" jsonb NOT NULL DEFAULT '{}', "storedInternal" boolean NOT NULL, "url" character varying(512) NOT NULL, "thumbnailUrl" character varying(512), "webpublicUrl" character varying(512), "accessKey" character varying(256), "thumbnailAccessKey" character varying(256), "webpublicAccessKey" character varying(256), "uri" character varying(512), "src" character varying(512), "folderId" character varying(32), "isSensitive" boolean NOT NULL DEFAULT false, "isLink" boolean NOT NULL DEFAULT false, CONSTRAINT "PK_43ddaaaf18c9e68029b7cbb032e" PRIMARY KEY ("id"))
;

ALTER TABLE "drive_file" ADD "blurhash" character varying(128)
;
ALTER TABLE "drive_file" ADD "webpublicType" character varying(128)
;
ALTER TABLE "drive_file" ADD "maybeSensitive" boolean NOT NULL DEFAULT false
;
ALTER TABLE "drive_file" ADD "maybePorn" boolean NOT NULL DEFAULT false
;
ALTER TABLE "drive_file" ADD "requestHeaders" jsonb DEFAULT '{}'
;
ALTER TABLE "drive_file" ADD "requestIp" character varying(128)
;
CREATE TABLE "note_unread" ("id" character varying(32) NOT NULL, "userId" character varying(32) NOT NULL, "noteId" character varying(32) NOT NULL, "noteUserId" character varying(32) NOT NULL, "isSpecified" boolean NOT NULL, CONSTRAINT "PK_1904eda61a784f57e6e51fa9c1f" PRIMARY KEY ("id"))
;
CREATE TABLE "announcement_read" ("id" character varying(32) NOT NULL, "userId" character varying(32) NOT NULL, "announcementId" character varying(32) NOT NULL, CONSTRAINT "PK_4b90ad1f42681d97b2683890c5e" PRIMARY KEY ("id"))
;
ALTER TABLE "announcement_read" ADD "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL
;
CREATE TYPE "antenna_src_enum" AS ENUM('home', 'all', 'list')
;
CREATE TABLE "antenna" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "userId" character varying(32) NOT NULL, "name" character varying(128) NOT NULL, "src" "antenna_src_enum" NOT NULL, "userListId" character varying(32), "keywords" jsonb NOT NULL DEFAULT '[]', "withFile" boolean NOT NULL, "expression" character varying(2048), "notify" boolean NOT NULL, "hasNewNote" boolean NOT NULL DEFAULT false, CONSTRAINT "PK_c170b99775e1dccca947c9f2d5f" PRIMARY KEY ("id"))
;
ALTER TABLE "antenna" ADD "userGroupJoiningId" character varying(32)
;
ALTER TABLE "antenna" ADD "users" character varying array NOT NULL DEFAULT '{}'
;
ALTER TABLE "antenna" ADD "excludeKeywords" jsonb NOT NULL DEFAULT '[]'
;
ALTER TABLE "antenna" ADD "caseSensitive" boolean NOT NULL DEFAULT false
;
ALTER TABLE "antenna" ADD "withReplies" boolean NOT NULL DEFAULT false
;
CREATE TABLE "channel_following" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "followeeId" character varying(32) NOT NULL, "followerId" character varying(32) NOT NULL, CONSTRAINT "PK_8b104be7f7415113f2a02cd5bdd" PRIMARY KEY ("id"))
;
ALTER TABLE "note_unread" ADD "isMentioned" boolean NOT NULL
;
CREATE TABLE "follow_request" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "followeeId" character varying(32) NOT NULL, "followerId" character varying(32) NOT NULL, "requestId" character varying(128), "followerHost" character varying(128), "followerInbox" character varying(512), "followerSharedInbox" character varying(512), "followeeHost" character varying(128), "followeeInbox" character varying(512), "followeeSharedInbox" character varying(512), CONSTRAINT "PK_53a9aa3725f7a3deb150b39dbfc" PRIMARY KEY ("id"))
;
CREATE TABLE "announcement" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "text" character varying(8192) NOT NULL, "title" character varying(256) NOT NULL, "imageUrl" character varying(1024), CONSTRAINT "PK_e0ef0550174fd1099a308fd18a0" PRIMARY KEY ("id"))
;
CREATE TABLE "user_group_joining" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "userId" character varying(32) NOT NULL, "userGroupId" character varying(32) NOT NULL, CONSTRAINT "PK_15f2425885253c5507e1599cfe7" PRIMARY KEY ("id"))
;
CREATE TABLE "notification" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "notifieeId" character varying(32) NOT NULL, "notifierId" character varying(32) NOT NULL, "type" character varying(32) NOT NULL, "isRead" boolean NOT NULL DEFAULT false, "noteId" character varying(32), "reaction" character varying(128), "choice" integer, CONSTRAINT "PK_705b6c7cdf9b2c2ff7ac7872cb7" PRIMARY KEY ("id"))
;
CREATE TABLE "messaging_message" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "userId" character varying(32) NOT NULL, "recipientId" character varying(32) NOT NULL, "text" character varying(4096), "isRead" boolean NOT NULL DEFAULT false, "fileId" character varying(32), CONSTRAINT "PK_db398fd79dc95d0eb8c30456eaa" PRIMARY KEY ("id"))
;
ALTER TABLE "notification" ADD "followRequestId" character varying(32)
;
CREATE TABLE "__chart_day__hashtag" ("id" SERIAL NOT NULL, "date" integer NOT NULL, "group" character varying(128) NOT NULL, "___local_users" character varying array NOT NULL, "___remote_users" character varying array NOT NULL, CONSTRAINT "UQ_8f589cf056ff51f09d6096f6450" UNIQUE ("date", "group"), CONSTRAINT "PK_13d5a3b089344e5557f8e0980b4" PRIMARY KEY ("id"))
;
CREATE TABLE "channel" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "lastNotedAt" TIMESTAMP WITH TIME ZONE, "userId" character varying(32) NOT NULL, "name" character varying(128) NOT NULL, "description" character varying(2048), "bannerId" character varying(32), "notesCount" integer NOT NULL DEFAULT 0, "usersCount" integer NOT NULL DEFAULT 0, CONSTRAINT "PK_590f33ee6ee7d76437acf362e39" PRIMARY KEY ("id"))
;
CREATE TABLE "__chart_day__notes" ("id" SERIAL NOT NULL, "date" integer NOT NULL, "___local_total" bigint NOT NULL, "___local_inc" bigint NOT NULL, "___local_dec" bigint NOT NULL, "___local_diffs_normal" bigint NOT NULL, "___local_diffs_reply" bigint NOT NULL, "___local_diffs_renote" bigint NOT NULL, "___remote_total" bigint NOT NULL, "___remote_inc" bigint NOT NULL, "___remote_dec" bigint NOT NULL, "___remote_diffs_normal" bigint NOT NULL, "___remote_diffs_reply" bigint NOT NULL, "___remote_diffs_renote" bigint NOT NULL, CONSTRAINT "UQ_1a527b423ad0858a1af5a056d43" UNIQUE ("date"), CONSTRAINT "PK_1fa4139e1f338272b758d05e090" PRIMARY KEY ("id"))
;
CREATE TABLE "registry_item" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, "userId" character varying(32) NOT NULL, "key" character varying(1024) NOT NULL, "scope" character varying(1024) array NOT NULL DEFAULT '{}'::varchar[], "domain" character varying(512), CONSTRAINT "PK_64b3f7e6008b4d89b826cd3af95" PRIMARY KEY ("id"))
;
COMMENT ON COLUMN "registry_item"."createdAt" IS 'The created date of the RegistryItem.'
;
COMMENT ON COLUMN "registry_item"."updatedAt" IS 'The updated date of the RegistryItem.'
;
COMMENT ON COLUMN "registry_item"."userId" IS 'The owner ID.'
;
COMMENT ON COLUMN "registry_item"."key" IS 'The key of the RegistryItem.'
;
ALTER TABLE "registry_item" ADD "value" jsonb NOT NULL DEFAULT '{}'
;
CREATE TABLE "blocking" ("id" character varying(32) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "blockeeId" character varying(32) NOT NULL, "blockerId" character varying(32) NOT NULL, CONSTRAINT "PK_e5d9a541cc1965ee7e048ea09dd" PRIMARY KEY ("id"))
;
ALTER TABLE "notification" ADD "userGroupInvitationId" character varying(32)
;
ALTER TABLE "notification" ADD "customBody" character varying(2048)
;
ALTER TABLE "notification" ADD "customHeader" character varying(256)
;
ALTER TABLE "notification" ADD "customIcon" character varying(1024)
;
ALTER TABLE "notification" ADD "appAccessTokenId" character varying(32)
;
ALTER TABLE "notification" ALTER COLUMN "notifierId" DROP NOT NULL
;
CREATE TABLE "muted_note" ("id" character varying(32) NOT NULL, "noteId" character varying(32) NOT NULL, "userId" character varying(32) NOT NULL, CONSTRAINT "PK_897e2eff1c0b9b64e55ca1418a4" PRIMARY KEY ("id"))
;

