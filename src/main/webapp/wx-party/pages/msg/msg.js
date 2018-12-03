const API = require("../../config/api.js");
const Utils = require("../../utils/utils.js");
let msgConfig = {
  data: {
    tabNav: 0,
    msgData: []
  },
  tabSwitch: function (ev) {
    let _this = this,toTab = ev.currentTarget.dataset.index;
    if(toTab==0){// 最新
      Utils.Request(`${API.MsgList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ msgData: res.data });
      });
    }else if(toTab==1){// 未读
      Utils.Request(`${API.MsgList}`, { isread: 0,userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ msgData: res.data });
      });
    }else if(toTab==2){// 已读
      Utils.Request(`${API.MsgList}`, { isread: 1,userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ msgData: res.data });
      });
    }
    this.setData({ tabNav: toTab });
  },
  readEvent: function (ev) {
    let _this = this;
    wx.showModal({
      title: '信息详情',
      showCancel: false,
      content: ev.currentTarget.dataset['title'],
      confirmText: "已读",
      success:(modelRes)=>{
        if (modelRes.confirm){
          Utils.Request(`${API.MsgRead}`, { id: ev.currentTarget.dataset['id'],userid: wx.getStorageSync('userid'),read:1 }).then((res1) => {
            res1.statusCode === 200 && Utils.Request(`${API.MsgList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
              if (res.statusCode === 200){
                wx.showToast({
                  title: '信息已标记已读！',
                  icon:'none',
                  success:()=>{
                    _this.setData({ msgData: res.data });
                  }
                });
              }
            });
          });
        }
      }
    });
  },
  onLoad: function (){
    let _this = this;
    Utils.Request(`${API.MsgList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ msgData: res.data });
    });
  },
  onPullDownRefresh: function () {
    let _this = this;
    let isread = this.data.tabNav;
    if(isread == 0){
      isread = "";
    } else if(isread ==1){
      isread = 0
    }else if(isread==2){
      isread = 1
    }
    Utils.Request(`${API.MsgList}`, {isread:isread, userid: wx.getStorageSync('userid') }).then((res) => {
      console.log(res);
      res.statusCode === 200 && _this.setData({ msgData: res.data });
      res.statusCode === 200 && wx.stopPullDownRefresh();
    });
  },
  getData:function(){
    let _this = this;
    Utils.Request(`${API.MsgList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ msgData: res.data });
    });
  }
}
Page(msgConfig);