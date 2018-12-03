// let RootURL = 'http://localhost:8090/';/* 所有数据接口根地址(本地) */
let RootURL = 'https://www.yxzhdj.com/';/* 所有数据接口根地址(云端) */
module.exports = {
  RootIMG:`${RootURL}upload/`,
  downs: `${RootURL}news/download?file=`,
  seeFile: `${RootURL}news/download?file=`,
  Regist: `${RootURL}user/register`,/* 用户注册 */
  Title: `${RootURL}info/title`,/* 用户注册 */
  Login: `${RootURL}doLogin`,/* 用户登录 */
  Mobil: `${RootURL}mobilmenu/mobilindex`,/* 用户登录 */
  download: `${RootURL}news/download`,/* 用户登录 */
  maps: `${RootURL}info/map`,/* 用户登录 */
  wxLogin: `${RootURL}info/login`,/* 微信登录 */
  IndexBanner: `${RootURL}news/banner`,/* 首页轮播 */
  NewsList: `${RootURL}news/titlelist?type=1`,/* 党建要闻(列表) */
  CleanList: `${RootURL}news/titlelist?type=2`,/* 反腐倡廉(列表) */
  NoticeList: `${RootURL}news/titlelist?type=3`,/* 通知公告(列表) */
  fileList: `${RootURL}news/titlelist?type=4`,/* 通知公告(列表) */
  NewsCart: `${RootURL}news/cart?type=1`,/* 党建要闻(选项卡) */
  CleanCart: `${RootURL}news/cart?type=2`,/* 反腐倡廉(选项卡) */
  JyjlCart: `${RootURL}news/titlelist?type=5`,/* 反腐倡廉(选项卡) */
  ZtltCart: `${RootURL}news/titlelist?type=6`,/* 反腐倡廉(选项卡) */
  NoticeCart: `${RootURL}news/cart?type=3`,/* 通知公告(选项卡) */
  BranchInfo: `${RootURL}user/zhibu`,/* 支部信息 */
  VoteList: `${RootURL}vote/mylist`,/* 投票调研(列表) */
  TaskList: `${RootURL}task/list`,/* 任务管理(列表) */
  MsgList: `${RootURL}msg/mylist`,/* 我的消息(列表) */
  ispoint: `${RootURL}points/isexit`,/* 积分是否成功 */
  MsgRead: `${RootURL}msg/read`,/* 我的消息(阅读) */
  ShykAdd: `${RootURL}shyk/save`,/* 我的消息(阅读) */
  ShykList: `${RootURL}shyk/list`,/* 三会一课 */
  ShykDetails: `${RootURL}shyk/details`,/* 三会一课 */
  FormId: `${RootURL}info/formid`,/* 获取formid(列表) */
  FormLogin: `${RootURL}info/login`,/* 登录 */
  // MailDep: `${RootURL}user/mydept`, /* 通讯录(部门获取) */
  MailSearch: `${RootURL}user/classmate`, /* 通讯录(部门成员搜索) */
  MailPeople: `${RootURL}user/list`, /* 通讯录(部门成员) */
  TaskDetail: `${RootURL}task/details`,/* 任务详情 */
  VoteDetail: `${RootURL}vote/details`,/* 投票调研(详情) */
  VoteResult: `${RootURL}vote/voteresultwx`,/* 投票结果 */
  MeetList: `${RootURL}meeting/titlelist`,/* 会议助手(列表) */
  MeetDetail: `${RootURL}meeting/details`,/* 会议助手(详情) */
  MeetCount: `${RootURL}info/countmeet`,/*会议数量*/
  ClassList: `${RootURL}course/list`,/* 在线课程(列表-所有) */
  MyClassList: `${RootURL}course/mylist`,/* 在线课程(列表-已学) */
  ClassDetail: `${RootURL}course/details`,/* 在线课程(详情) */
  Act_BranchTitle: `${RootURL}event/titlelist?type=1`,/* 党支部活动(列表) */
  Act_VolunteerTitle: `${RootURL}event/titlelist?type=2`,/* 志愿者活动(列表) */
  ActDetail: `${RootURL}event/details`, /* 活动详情 */
  Details: `${RootURL}news/details`,/* 党建要闻/反腐倡廉/通知公告(详情) */
  UserInfo: `${RootURL}info/info`,/* 获取当前登录用户信息 */
  TickleApi: `${RootURL}attend/tickle`,/* 点赞 */
  CollectApi: `${RootURL}attend/mark`,/* 点赞 */
  CommentApi: `${RootURL}attend/comm`,/* 评论 */
  SignApi: `${RootURL}meeting/sign?mode=1`,/* 签到 */
  LeaveApi: `${RootURL}meeting/sign?mode=2`,/* 请假 */
  VoteApi: `${RootURL}vote/vote`,/* 投票 */
  JoinApi: `${RootURL}attend/join`,/* 报名 */
  CollectList: `${RootURL}info/mymark`,/*收藏列表*/
  AdviceApi: `${RootURL}info/sugg`,/*请你提议*/
  UpLoadApi: `${RootURL}info/avatar`,/*头像上传*/
  UpLoadApi2: `${RootURL}info/avatar2`,/*头像上传*/
  UpLoadApi3: `${RootURL}info/avatar`,/*头像上传*/
  SubmitTask: `${RootURL}task/comp`,/* 提交任务 */
  isAdmin: `${RootURL}info/isadmin`,/* 查询是否是管理员 */
  RootIMG: `${RootURL}upload/`,/* 头像前缀 */
  isPointer: `${RootURL}info/iswgy`,/* 验证是否是网格员 */
  pointList: `${RootURL}info/zblb`,/* 需要打分的支部列表 */
  pointAPI: `${RootURL}info/point`,/* 给某支部打分 */
}