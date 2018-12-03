const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
var actConfig = {
  data:{
    swiperNow: 0,
    tabNav: 0,
    actData: []
  },
  swiperChange: function (ev) {
    this.setData({ swiperNow: ev.detail.current })
  },
  tabSwitch: function (ev) {
    var toTab = ev.currentTarget.dataset.index, _this = this;
    if(toTab == 0){// 最新活动
      Utils.Request(`${API.Act_BranchTitle}`, {userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ actData: res.data });
      });
    }else{// 我参与的
      Utils.Request(`${API.Act_BranchTitle}`, { all:"mine", userid: wx.getStorageSync     ('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ actData: res.data });
      });
    }
    _this.setData({ tabNav: toTab });
  },
  seeDetail: function (ev) {
    wx.navigateTo({ url: `detail/detail?id=${ev.currentTarget.dataset['id']}` });
  },
  onLoad: function (options) {
    let _this = this;
    Utils.Request(`${API.Act_BranchTitle}`,{userid: wx.getStorageSync('userid')}).then((res) => {
      res.statusCode === 200 && _this.setData({ actData: res.data });
    });
  },
  onPullDownRefresh: function () {
    let _this = this;
    if (_this.data.tabNav == 0) {// 最新活动
      Utils.Request(`${API.Act_BranchTitle}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ actData: res.data });
        res.statusCode === 200 && wx.stopPullDownRefresh();
      });
    } else {// 我参与的
      Utils.Request(`${API.Act_BranchTitle}`, { all: "mine",userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ actData: res.data });
        res.statusCode === 200 && wx.stopPullDownRefresh();
      });
    }
  }
}
Page(actConfig);