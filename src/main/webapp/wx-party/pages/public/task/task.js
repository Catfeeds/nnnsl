const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
var taskConfig = {
  data: {
    tabNav: 0,
    taskData: []
  },
  tabSwitch: function (ev) {
    var toTab = ev.currentTarget.dataset.index,_this = this;
    this.setData({ tabNav: toTab });
    if(toTab==0){// 最新
      Utils.Request(`${API.TaskList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ taskData: res.data });
      });
    } else if(toTab==1){// 未完成
      Utils.Request(`${API.TaskList}`, { iscomp: 0,userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ taskData: res.data });
      });
    } else if(toTab==2){// 已完成
      Utils.Request(`${API.TaskList}`, { iscomp: 1,userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ taskData: res.data });
      });
    }
  },
  seeDatil: function (ev) {
    wx.navigateTo({
      url: `detail/detail?id=${ev.currentTarget.dataset['id']}`
    });
  },
  onShow:function(){
    let _this = this;
    Utils.Request(`${API.TaskList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ taskData: res.data });
    });
  },
  onLoad: function () {
    let _this = this;
    Utils.Request(`${API.TaskList}`,{ userid:wx.getStorageSync('userid')}).then((res) => {
      console.log(res.data)
      res.statusCode === 200 && _this.setData({ taskData: res.data });
    });
  },
  onPullDownRefresh: function () {
    let _this = this;
    if (_this.data.tabNav == 0) {// 最新
      Utils.Request(`${API.TaskList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ taskData: res.data });
        res.statusCode === 200 && wx.stopPullDownRefresh();
      });
    } else if (_this.data.tabNav  == 1) {// 未完成
      Utils.Request(`${API.TaskList}`, { iscomp: 0,userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ taskData: res.data });
        res.statusCode === 200 && wx.stopPullDownRefresh();
      });
    } else if (_this.data.tabNav  == 2) {// 已完成
      Utils.Request(`${API.TaskList}`, { iscomp: 1,userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ taskData: res.data });
        res.statusCode === 200 && wx.stopPullDownRefresh();
      });
    }
  }
}
Page(taskConfig);