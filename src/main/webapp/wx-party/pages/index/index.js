const API = require("../../config/api.js");
const Utils = require("../../utils/utils.js");
var indexConfig = {
  data: {
    showMenu: false,
    swiperData: [],
    newsData: [],
    cleanData:[],
    noticeData: [],
    voteData: [],
    actData: [],
    classData: [],
    swiperNow: 0,
    defaultSwiper: "../../images/banner.png",
    defaultImg: "../../images/news.png",
  },
  isShowMenu: function (ev) {
    let menu = this.data.showMenu;
    this.setData({ showMenu: !menu });
  },
  swiperChange: function (ev) {
    this.setData({ swiperNow: ev.detail.current })
  },
  NewsImgError: function (ev) {
    if (ev.type == "error") {
      var errorImgIndex = ev.currentTarget.dataset.errorimg, newData = this.data.newsData;
      newData[errorImgIndex].url = this.data.defaultImg;//错误图片替换为默认图片
      this.setData({ newsData: newData });
    }
  },
  ClassImgError: function (ev) {
    if (ev.type == "error") {
      var errorImgIndex = ev.currentTarget.dataset.errorimg, newData = this.data.classData;
      newData[errorImgIndex].url = this.data.defaultImg;//错误图片替换为默认图片
      this.setData({ classData: newData });
    }
  },
  SwiperImgError: function (ev) {
    if (ev.type == "error") {
      var errorImgIndex = ev.currentTarget.dataset.errorimg, newData = this.data.swiperData;
      newData[errorImgIndex].src = this.data.defaultSwiper;//错误图片替换为默认图片
      this.setData({ swiperData: newData });
    }
  },
  toModel:function (ev){
    switch (ev.currentTarget.dataset['page']){
      case "map": wx.navigateTo({
        url: '../public/map/map',
      });break;
      case "shyk": wx.navigateTo({
        url: '../public/shyk/shyk',
      }); break;
      case "jyjl": wx.navigateTo({
        url: '../public/jyjl/jyjl',
      }); break;
      case "ztlt": wx.navigateTo({
        url: '../public/ztlt/ztlt',
      }); break;
      case "news": wx.navigateTo({
        url: '../public/news/news',
      }); break;
      case "file": wx.navigateTo({
        url: '../public/materials/materials',
      }); break;
      case "list": wx.navigateTo({
        url: '../public/list/list',
      }); break;
      case "birth": wx.navigateTo({
        url: '../public/birth/birth',
      }); break;
      case "notice": wx.navigateTo({
        url: '../public/notice/notice',
      }); break; 
      case "dynamic": wx.navigateTo({
        url: '../public/branch/branch',
      }); break;
      case "activity": wx.navigateTo({
        url: '../public/activity/activity',
      }); break;
      case "clean": wx.navigateTo({
        url: '../public/clean/clean',
      }); break;
      case "more": wx.navigateTo({
        url: '../public/more/more',
      }); break; 
      case "act": wx.navigateTo({
        url: '../public/activity/activity',
      });break;
      case "meet": wx.navigateTo({
        url: '../public/meet/meet',
      }); break;
      case "clean": wx.switchTab({
        url: '../public/clean/clean',
      }); break;
      case "task": wx.navigateTo({
        url: '../public/task/task',
      }); break;
      case "vote": wx.navigateTo({
        url: '../public/vote/vote',
      }); break;
      case "class": wx.navigateTo({
        url: '../public/class/class',
      }); break;
      case "advice": wx.navigateTo({
        url: '../public/advice/advice',
      }); break;
    }
  },
  seenewsDetail:function (ev){
    wx.navigateTo({ url: `../public/news/detail/detail?id=${ev.currentTarget.dataset['id']}` });
  },
  seeshykDetail: function (ev) {
    wx.navigateTo({ url: `../public/shyk/detail/detail?id=${ev.currentTarget.dataset['id']}` });
  },
  seecleanDetail: function (ev) {
    wx.navigateTo({ url: `../public/clean/detail/detail?id=${ev.currentTarget.dataset['id']}` });
  },
  seejyjlDetail: function (ev) {
    wx.navigateTo({ url: `../public/jyjl/detail/detail?id=${ev.currentTarget.dataset['id']}` });
  },
  seeztltDetail: function (ev) {
    wx.navigateTo({ url: `../public/ztlt/detail/detail?id=${ev.currentTarget.dataset['id']}` });
  },
  seeActDetail: function (ev) {
    wx.navigateTo({ url: `../public/activity/detail/detail?id=${ev.currentTarget.dataset['id']}` });
  },
  seeVoteDetail: function (ev) {
    wx.navigateTo({ url: `../public/vote/detail/detail?id=${ev.currentTarget.dataset['id']}` });
  },
  seeClassDetail: function (ev) {
    wx.navigateTo({ url: `../public/class/detail/detail?id=${ev.currentTarget.dataset['id']}` });
  },
  onPullDownRefresh: function () {
    let _this = this;
    Utils.Request(`${API.IndexBanner}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      if (res.statusCode === 200 && res.data) {
        let tempData = [], tempObj = [
          { text: '党建要闻', page: 'news' },
          { text: '反腐倡廉', page: 'clean' },
          { text: '支部动态', page: 'dynamic' }];
        [].slice.call(res.data).forEach(function (val, index) {
          tempData.push({ id: val.id, src: val.src, text: tempObj[index]['text'], page: tempObj[index]['page'] });
        });
        _this.setData({ swiperData: tempData });
      }
    });
    Utils.Request(`${API.Mobil}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      console.log(res)
      res.statusCode === 200 && _this.setData({ menuData: res.data.menu });
      res.statusCode === 200 && _this.setData({ listData: res.data.list });
      Utils.Request(`${API.Title}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        var title = res.data.title;
        wx.setNavigationBarTitle({
          title: title,
        })
      });
    });
  },
  onLoad:function(){
    let _this = this;
    Utils.Request(`${API.IndexBanner}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      if (res.statusCode===200 && res.data){
        let tempData = [],tempObj=[
          { text: '党建要闻', page:'news'},
          { text: '反腐倡廉', page: 'clean' },
          { text: '支部动态', page: 'dynamic' }];
        [].slice.call(res.data).forEach(function (val,index){
          tempData.push({id: val.id, src: val.src, text: tempObj[index]['text'], page: tempObj[index]['page']});
        });
        _this.setData({ swiperData: tempData});
      }
    });
    Utils.Request(`${API.Mobil}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      console.log(res)
      res.statusCode === 200 && _this.setData({ menuData: res.data.menu});
      res.statusCode === 200 && _this.setData({ listData: res.data.list });
      Utils.Request(`${API.Title}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        var title = res.data.title;
        wx.setNavigationBarTitle({
          title: title,
        })
      });
      
    });
    
    // /* 党建要闻 */
    // Utils.Request(`${API.NewsList}`, { page: 1, rows: 3, userid: wx.getStorageSync('userid')}).then((res)=>{
    //   res.statusCode === 200 && _this.setData({newsData:res.data.rows});
    // });
    // /* 反腐动态 */
    // Utils.Request(`${API.CleanList}`, { page: 1, rows: 3 ,userid: wx.getStorageSync('userid')}).then((res) => {
    //   res.statusCode === 200 && _this.setData({ cleanData: _this.dataFormat(res.data.rows) });
    // });
    // /* 党内活动 */
    // Utils.Request(`${API.Act_BranchTitle}`, { page: 1, rows: 3, userid: wx.getStorageSync('userid')}).then((res) => {
    //   res.statusCode === 200 && _this.setData({ actData: res.data });
    // });
    // /* 在线课程 */
    // Utils.Request(`${API.ClassList}`, { page: 1, rows: 4, userid: wx.getStorageSync('userid')}).then((res) => {
    //   res.statusCode === 200 && _this.setData({ classData: res.data });
    // });
    // /* 投票调研 */
    // Utils.Request(`${API.VoteList}`, { page: 1, rows: 3, userid: wx.getStorageSync('userid') }).then((res) => {
    //   res.statusCode === 200 && _this.setData({ voteData: res.data.rows });
    // });
    
    
  },
  dataFormat:function (data){
    let temp = [];
    if(data){
      [].slice.call(data).forEach((val, index) => {
        temp.push({
          "id": val.id, "title": val.title, "type": val.type,
          "month": `${val.creat_time.split(" ")[0].split("-")[1]}月`,
          "day": `${val.creat_time.split(" ")[0].split("-")[2]}`
        });
      });
      return temp;
    }
  },
}
Page(indexConfig);