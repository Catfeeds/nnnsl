const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
var meetConfig = {
  data:{
    isNoData:true,
    meetData: [],
    tabNav:0,
    titleText:"我的会议"
  },
  seeDetail: function (ev) {
    wx.navigateTo({ url: `detail/detail?id=${ev.currentTarget.dataset['id']}` });
  },
  onLoad: function (options) {
    let _this = this;
    Utils.Request(`${API.MeetList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      console.log(res)
      res.statusCode === 200 && _this.setData({ meetData: res.data.rows });
    });
  },
  tabSwitch: function (ev) {
    var toTab = ev.currentTarget.dataset.index, _this = this;
    this.setData({ tabNav: toTab });
    if(toTab==0){// 我的会议
      Utils.Request(`${API.MeetList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ titleText: "我的会议"});
        res.statusCode === 200 && _this.setData({ meetData: res.data.rows });
      });
    }else{// 会议记录
      Utils.Request(`${API.MeetList}`, { mode:"history",userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ titleText: "会议记录" });
        res.statusCode === 200 && _this.setData({ meetData: res.data.rows });
      });
    }
  }
}
Page(meetConfig);