const API = require("../../../../config/api.js");
const Utils = require("../../../../utils/utils.js");
const WxParse = require('../../../../lib/wxParse/wxParse.js');
var detailConfig = {
  data: {
    detail: null,
    nowMeet: null,
    isNoSign: true,
    isNoLeave: true,
    isNoOver: true,
    tipText:"加载中..."
  },
  isShowBtn: function (ev) {
    this.setData({ showMsg: ev.detail.value === "" });
    this.setData({ showSend: ev.detail.value !== "" });
  },
  leaveEnvet: function (ev){
    let _this = this;
    if (this.data.isNoSign){
      wx.navigateTo({
        url: `../leave/leave?id=${_this.data.nowMeet}`,
      });
    }else{
      wx.showToast({
        title: '抱歉，您已签到，请准时参加会议！',
        icon: 'none'
      });
    }
  },
  signEvent: function(){
    let _this = this;
    if(this.data.isNoLeave){
      if(this.data.isNoSign){
        this.setData({isNodeSign:false});
        Utils.Request(`${API.ispoint}`, { eid: _this.data.nowMeet, cause: 'meeting', userid: wx.getStorageSync('userid') }).then((res) => {
          if (res.data.success === true) {
            _this.toast = _this.selectComponent("#toast");
            _this.toast.showToast('签到成功+1分', 0, () => {

            });
        }
        });

        Utils.Request(`${API.SignApi}`, { id: _this.data.nowMeet, userid: wx.getStorageSync('userid') }).then((res) => {
                _this.setData({ isNoSign: false });
                Utils.Request(`${API.MeetDetail}`, { id: _this.data.nowMeet, userid: wx.getStorageSync('userid') }).then((res) => {
                  res.statusCode === 200 && _this.setData({ detail: res.data });
                });
              });
            }
    }else{
      wx.showToast({
        title: '抱歉，您已请假，无法签到！',
        icon: 'none'
      });
    }
  },
  onShow: function(){
    let _this = this;
    this.data.nowData && Utils.Request(`${API.MeetDetail}`, { id: _this.data.nowMeet, userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ isNoLeave: !res.data.isleave });
    });
  },
  onLoad: function (options) {
    let _this = this;
    Utils.Request(`${API.MeetDetail}`, { id: options['id'], userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ isNoSign: !res.data.issign});
      res.statusCode === 200 && _this.setData({ isNoLeave: !res.data.isleave });
      res.statusCode === 200 && _this.setData({ nowMeet: res.data.id });
      res.statusCode === 200 && _this.setData({ detail: res.data });
      if (res.statusCode === 200){
        Date.parse(new Date(res.data.meettime)) < Date.parse(new Date()) && _this.setData({ isNoOver:false});
        if (res.data.cart==0){
          _this.setData({ tipText:"支部党员大会" });
        } else if (res.data.cart == 1){
          _this.setData({ tipText: "支部委员大会" });
        } else {
          _this.setData({ tipText: "党小组会或其他" });
        }
      }
    });
    
  }
}
Page(detailConfig);