//
//  URLConfig.h
//  YCZB
//
//  Created by Liu on 15/1/30.
//  Copyright (c) 2015年 Liu. All rights reserved.
//

#ifndef YCZB_URLConfig_h
#define YCZB_URLConfig_h

#define MDDomain  @"120.55.205.185"//@"120.55.205.185"//@"121.40.97.52"//@"192.168.1.115"//
#define MDDuanKou 80//80//5222
#define MDyu @"laile"

//支付宝

//合作身份者id，以2088开头的16位纯数字
#define YC_aliPayPartnerID @"2088311017622492"
//收款支付宝账号
#define YC_aliPaySellerID  @"hanjin@hapinvion.com"
//商户私钥，自助生成
#define YC_aliPayPartnerPrivKey @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBANzGeNTAbm9uPiet54AVJlOGmkpEYw1CTYqLGSqcNa6Ea8z+ogdJhEQJQBMrPr/+CzfhpH9SlDWEZvXKjS8YlAHLEp277Pm553O3UoxUP8Zw1WlSUrfV4WCuty7bwtzIoZumwZ5VZFqtbgiOVpfbORjArW900RZ8X6X979KTiJS9AgMBAAECgYBIk1YVWkzzhKIaGSkJCerXemAuGd0V9r3W1XModsGO5Skq8moBS0GXvBK8OnMeWj0F2b9hu5vNHAFcu4E+Ai5k68s5rpSjw93MrhsEcJBTJ2hb6GQ7I6RFPvY0zLDj2cWpaX+E5hiBDDjMMx+u6O6EU9JbyOrCEOBwmcIhiRHyYQJBAP/VNZrP3sYe1DXPcNFi8cIPmxVOEF/ZRq6VF5ih3goBwJU8Em5LZkIWEvHbKU1zk7/Z0d6pcx6FSE87kD3JzPcCQQDc62YckhkLh8jn/eV5TMTPhu5D3Ga50T2cLsjNYBv96tI828k+3rE/+UX8iv9rfCoxIiQPL2XRm5ui4lMfbILrAkBMeejfUXpv0TFwsIUyIpjQgSfD86UTcfkeITV/jAu7BBEUy3NbAzEbWkvpfrFXFNC7Dhsdq5vdKMyX2t9giR27AkEAx0PIudKJpp3WeHLJzgyRpQJ23Vzqh4aVRM/qLV0YQoLRGTXBouSpCiQknXMeievX/rNlxRCijVsHGfd8tGZi+wJAfRZNMdHoY/GmGFaBfwmLRE/mKIqZLsWS4tFkgaXMvnR810ja/luRLkmBjHr8OOQNQzAslZEhY0hfdqsFMgVDlg=="

////订单回调地址，2.4.。。。
#define payCallBack @"http://www.hapinvion.com:89/callbackalipay"//101.227.244.200


#pragma mark 接口名称
//http://www.lailem.com/
//////本地
//#define InterFaceURL @"http://192.168.1.115:8080/LaiLeApp/"
//#define ImageUrlInter @"http://192.168.1.115:8080/LaiLeApp/file/"
////网页
//#define InterWebURL @" http://192.168.1.115:8686/LaiLeWeb/"
//#define InterNewErweiURL @"http://192.168.1.115:8686/LaiLeWeb/"


////服务器
//#define InterFaceURL @"http://121.40.97.52:8080/LaiLeApp/"
////////#define ImageUrlInter @"http://121.40.97.52:8080/LaiLeApp/file/"
////////http://laile-test.oss-cn-hangzhou.aliyuncs.com/
//#define ImageUrlInter @"http://laile-test.oss-cn-hangzhou.aliyuncs.com/"
////网页
//#define InterWebURL @"http://121.40.97.52:8080/LaiLeWeb/"
//#define InterNewErweiURL @"http://121.40.97.52:8080/LaiLeWeb/"


////正式服务器
#define InterFaceURL @"http://app.lailem.com/LaiLeApp/"
#define ImageUrlInter @"http://file.lailem.com/"

//二维码头
//m,./
//#define InterErweiMaURL @"http://121.40.97.52:8080/LaiLeWeb/web/"

//新的页面链接（网页，分享，邀请）
#define InterNewErweiURL @"http://m.lailem.com/"
#define InterWebURL @"http://m.lailem.com/"
//




#pragma mark - 个人中心 -

#define url_Login @"user/login" //登陆
#define url_Register @"user/register" //注册
#define url_Weixin_Login @"user/thirdLogin" //第三方登录。微信
#define url_Send_authCode @"user/authCode" //取验证码
#define url_changePhone(userID) [NSString stringWithFormat:@"user/%@/authCode/changePhone", userID]//@"user/:id/authCode/changePhone" //取变更手机号时的验证码
#define url_Verify_authCode @"verify/authCode" //验证验证码
#define url_ChangePersonInfo(userID) [NSString stringWithFormat:@"user/%@/changePersonInfo", userID]//@"user/:id/changePersonInfo" //修改个人信息
#define url_ForgetPassword @"user/forgetPassword" //忘记密码
#define url_ChangeThePassword(userID) [NSString stringWithFormat:@"user/%@/updatePassword", userID]//修改密码

#define url_BanfDingPhone(userID)[NSString stringWithFormat:@"user/%@/bindingPhone", userID]//绑定手机号

#define url_ChangPhone(userID) [NSString stringWithFormat:@"user/%@/changPhone", userID]//@"user/:id/changPhone" //变更手机号
#define url_SetUsername(userID) [NSString stringWithFormat:@"user/%@/setUsername", userID]//设置用户名
#define url_My_Schedule(userID) [NSString stringWithFormat:@"user/%@/schedule", userID]//@"user/:id/schedule" //我的日程（待完善）
#define url_ChangeHead(userID) [NSString stringWithFormat:@"user/%@/changeHead", userID]//修改个人头像
#define url_Addblacklist(userID) [NSString stringWithFormat:@"user/%@/blacklist/add", userID]//加入黑名单
#define url_SetPermission(userID) [NSString stringWithFormat:@"user/%@/setPermission", userID]//权限控制接口-待完善
#define url_SubmitPosition(userID) [NSString stringWithFormat:@"user/%@/submitPosition", userID]//提交个人位置的接口
#define url_Blacklist(userID) [NSString stringWithFormat:@"user/%@/blacklist", userID]//取黑名单接口
#define url_Removeblacklist(userID) [NSString stringWithFormat:@"user/%@/blacklist/remove", userID]//移除黑名单
#define url_SetRemark(userID) [NSString stringWithFormat:@"user/%@/setRemark", userID]//设置备注名
#define url_MycollectList(userID) [NSString stringWithFormat:@"user/%@/collect", userID]//我的收藏列表
#define url_Deletecollect(userID,collectID) [NSString stringWithFormat:@"user/%@/delete/collect/%@", userID,collectID]//删除收藏
#define url_Collect(userID,collectID) [NSString stringWithFormat:@"user/%@/collect/%@", userID,collectID]//收藏或取消收藏

#pragma mark - 其它 -
#define url_Feedback @"user/feedback" //反馈意见
#define url_FeedbackBtype @"getFeedback/btype" //获取反馈类型的大类目列表
#define url_FeedbackStype(itemID) [NSString stringWithFormat:@"getFeedback/stype/%@", itemID] //获取反馈类型的小类目列表
#define url_Remarks(userID) [NSString stringWithFormat:@"user/%@/remarks", userID]//移除黑名单


//系统配置
#define url_sys_set_version @"common/config/version" //系统配置的版本号
#define url_sys_common_infor @"common/config"  //系统公共配置

//活动和群组
#define url_Near_acty_list @"activity/near"  //获取附近的活动列表
#define url_QUNzun_acty_list(groupid) [NSString stringWithFormat:@"group/%@/activity",groupid] //获取群组的活动列表
#define url_Near_Group_List @"group/near/nofold" //获取附近的群组列表
#define url_create_group @"/group/new"   //新建群组
#define url_groupDetails(userID) [NSString stringWithFormat:@"group/%@/", userID] //群组详情
#define url_groupverifyWay(userID,groupId) [NSString stringWithFormat:@"user/%@/group/%@/verifyWay",userID,groupId] //群组验证方式
#define url_groupApply(userID,groupId) [NSString stringWithFormat:@"user/%@/group/%@/apply",userID,groupId] //申请入Group
#define url_groupMember(groupId) [NSString stringWithFormat:@"group/%@/member",groupId] //取group成员接口
#define url_groupOtherInfo(memberId) [NSString stringWithFormat:@"other/user/%@",memberId] //获取Group成员个信息
#define url_groupSetVerifyWay(userID,groupId) [NSString stringWithFormat:@"user/%@/group/%@/setVerifyWay",userID,groupId] //设置group验证方式
#define url_groupChangGroupInfo(userID,groupId) [NSString stringWithFormat:@"user/%@/group/%@/changGroupInfo",userID,groupId] //修改group资料
#define url_groupSetTag(userID,groupId) [NSString stringWithFormat:@"user/%@/group/%@/setTag",userID,groupId] //设置群标签
#define url_groupSetPic(userID,groupId) [NSString stringWithFormat:@"user/%@/group/%@/setPic",userID,groupId] //设置group图片
#define url_groupQuit(userID,groupId) [NSString stringWithFormat:@"user/%@/group/%@/quit",userID,groupId] //退群或取消报名
#define url_groupjiesaola(userID,groupId) [NSString stringWithFormat:@"user/%@/group/%@/disband",userID,groupId] //解散群
#define url_groupApplyVerify(userID) [NSString stringWithFormat:@"user/%@/group/applyVerify",userID] //申请验证接口
#define url_groupGetout(userID,groupId) [NSString stringWithFormat:@"user/%@/group/%@/getout",userID,groupId] //踢人接口
#define url_AcTy_details    @"activity/"  //活动详情
#define url_AcTy_Schedule(userID,actyid)   [NSString stringWithFormat:@"user/%@/group/%@/schedule", userID, actyid] //获取群组或活动的日程
#define url_DianZan_Like(userID,LikeID) [NSString stringWithFormat:@"user/%@/like/%@", userID,LikeID]//点赞或取消点赞
#define url_Publish_Dynamic(userID)     [NSString stringWithFormat:@"user/%@/public/dynamic", userID]//发表动态
#define url_Publish_Notice(userID)     [NSString stringWithFormat:@"user/%@/public/notice", userID]//发表通知
#define url_groupNumId(groupNum) [NSString stringWithFormat:@"group/%@/no",groupNum]//根据Group号获取GroupId

//动态
#define url_groupDynamic(groupId) [NSString stringWithFormat:@"group/%@/dynamic",groupId] //取group动态列表
#define url_groupNotice(groupId) [NSString stringWithFormat:@"group/%@/notice",groupId] //取Group通知列表
#define url_publicNotice(userID) [NSString stringWithFormat:@"user/%@/public/notice", userID] //发表通知
#define url_comment_ActyOrUser(userID,CommentID) [NSString stringWithFormat:@"user/%@/comment/%@", userID,CommentID]//评论接口
#define url_Dynamic_details    @"dynamic/"  //活动详情
#define url_get_CommentList(objid)    [NSString stringWithFormat:@"comment/%@",objid] //获取评论列表
#define url_get_DianzanList(objiid)   [NSString stringWithFormat:@"like/%@",objiid] //获取点赞列表
#define url_delete_Dynamic(userID,DYID) [NSString stringWithFormat:@"user/%@/dynamic/del/%@", userID,DYID]//删除动态接口
#define url_get_member_group(actyid)   [NSString stringWithFormat:@"group/%@/member",actyid]//获取成员列表接口
#define url_vote_Choose(userID,voteID) [NSString stringWithFormat:@"user/%@/vote/%@", userID,voteID]//投票接口
#define url_vote_memberList(voteID)    [NSString stringWithFormat:@"vote/%@/voter", voteID]//投票人列表接口
#define url_AcceptInvite_Group(userID,inviteId) [NSString stringWithFormat:@"user/%@/group/%@/acceptInvite", userID,inviteId]//邀请接口
#define url_Get_GroupInvite(userID,GroupId) [NSString stringWithFormat:@"user/%@/group/%@/inviteCode", userID,GroupId]//获取邀请码接口

#define url_Create_NewActyVote(userId)  [NSString stringWithFormat:@"user/%@/voteGroup/new", userId]//创建新的vote活动

#define url_yaoqinLianjie   @"groupInvitationshowInvitaInfo.do?inviteCode="

#define url_SynChor_GroupActy(userId) [NSString stringWithFormat:@"user/%@/synchro/group", userId]//同步用户群或活动列表接口
#define url_GroupACtInfro_List(userID,groupID) [NSString stringWithFormat:@"user/%@/group/%@/brief", userID,groupID]//用户群或活动的信心简介

#define url_MY_DynaMic_LIst(userid)   [NSString stringWithFormat:@"user/%@/dynamic", userid]//获取动态列表接口

#define url_Cancellation_R(userid)    [NSString stringWithFormat:@"user/%@/emptyDeviceNo", userid]//注销接口

#define url_vote_activity     @"vote/activity/"      //投票活动详情

//图片素材
#define url_rand_pic @"picMaterial/randomOne"  //随机获取一张图片
#define url_SuCai_pic @"picMaterial/type" //获取图片素材类型
#define url_picMater_List @"picMaterial/type/"  //取某一分类下的图片列表

#define url_Group_Invitation(codeID) [NSString stringWithFormat:@"group/invitation/%@",codeID]//获取邀请信息

//检查是否已经加入了group
#define url_iS_Enter_group(userID,groupID) [NSString stringWithFormat:@"user/%@/group/%@/isJoined", userID,groupID]

#define url_Get_ComplainType @"getComplainType"//获取举报类型
#define url_User_Complain    @"user/complain"  //举报

#define url_Get_DataBase(groupID) [NSString stringWithFormat:@"group/%@/database",groupID] //获取资源库

#define url_Load_EditPic(userId) [NSString stringWithFormat:@"user/%@/upload/pic",userId]//文本编辑器图片上传

#define Url_Acty_changProperty(Userid,groupID) [NSString stringWithFormat:@"user/%@/activity/%@/changProperty",Userid,groupID]//设置活动的一些属性

#define Url_Acty_setVerifyWay(Userid,groupID) [NSString stringWithFormat:@"user/%@/group/%@/setVerifyWay",Userid,groupID]//设置活动的一些属性

#define Url_Group_changProperty(Userid,groupID) [NSString stringWithFormat:@"user/%@/group/%@/changProperty",Userid,groupID]//设置群组的一些属性

//192.168.1.115:8080

//#define My_Upload_Chat_File @"http://121.40.97.52:8080/LaiLeApp/upload/chat/file"
//#define Soucer_File_down    @"http://121.40.97.52:8080/LaiLeApp/file/"
//#define Soucer_File_down @"http://laile-test.oss-cn-hangzhou.aliyuncs.com/"

#define My_Upload_Chat_File  [NSString stringWithFormat:@"upload/chat/file"]// @"http://app.lailem.com/LaiLeApp/"
//#define Soucer_File_down @"http://file.lailem.com/"
#define getUser_infor [NSString stringWithFormat:@"getUserBrief/"] //@"http://app.lailem.com/LaiLeApp/getUserBrief/"


//#define getUser_infor @"http://121.40.97.52:8080/LaiLeApp/getUserBrief/"

//#define My_Upload_Chat_File @"http://192.168.1.115:8080/LaiLeApp/upload/chat/file"
//
//#define Soucer_File_down    @"http://192.168.1.115:8080/LaiLeApp/file/"
//
//#define getUser_infor       @"http://192.168.1.115:8080/LaiLeApp/getUserBrief/"

#endif






























