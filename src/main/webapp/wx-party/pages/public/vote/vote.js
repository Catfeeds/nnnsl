const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
var voteConfig = {
  data:{
    tabNav: 0,
    voteData: []
  },
  tabSwitch: function (ev) {
    var toTab = ev.currentTarget.dataset.index,_this = this;
    this.setData({ tabNav: toTab });
    if(toTab==0){// 最新
      Utils.Request(`${API.VoteList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ voteData: res.data.rows });
      });
    }else{// 我参与的
      Utils.Request(`${API.VoteList}`, { issubmit: 1,userid: wx.getStorageSync('userid') }).then((res) => {
        console.log(res);
        res.statusCode === 200 && _this.setData({ voteData: res.data.rows });
      });
    }
  },
  seeDetail: function (ev) {
    wx.navigateTo({ url: `detail/detail?id=${ev.currentTarget.dataset['id']}` });
  },
  onLoad: function (options) {
    let _this = this;
    Utils.Request(`${API.VoteList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ voteData: res.data.rows });
    });
  },
  onPullDownRefresh: function () {
    let _this = this;
    if (this.data.tabNav == 0) {// 最新
      Utils.Request(`${API.VoteList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ voteData: res.data.rows });
        res.statusCode === 200 && wx.stopPullDownRefresh();
      });
    } else {// 我参与的
      Utils.Request(`${API.VoteList}`, { issubmit: 1, userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ voteData: res.data.rows });
        res.statusCode === 200 && wx.stopPullDownRefresh();
      });
    }
  }
}
Page(voteConfig);