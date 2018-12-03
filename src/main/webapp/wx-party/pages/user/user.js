const API = require("../../config/api.js");
const Utils = require("../../utils/utils.js");
var userConfig = {
  data:{
    userInfo:null,
    userImg: "", // 头像图片路径
    defaultImg: "../../../images/head.png",
    actionSheetHidden: true, // 是否显示底部菜单  
    BathUrl:"",
    isPoint:false
  },
  toPage: function (ev) {
    var toPage = ev.currentTarget.dataset.page;
    switch (toPage) {
      case 'mine': wx.navigateTo({
        url: 'mine/mine',
      }); break;
      case 'notice': wx.navigateTo({
        url: '../public/notice/notice'
      }); break;
      case 'collect': wx.navigateTo({
        url: 'collect/collect'
      }); break;
      case 'meet': wx.navigateTo({
        url: '../public/meet/meet'
      }); break;
      case 'activity': wx.navigateTo({
        url: '../public/activity/activity'
      }); break;
      case 'vote': wx.navigateTo({
        url: '../public/vote/vote'
      }); break;
      case 'class': wx.navigateTo({
        url: '../public/class/class'
      }); break;
      case 'task': wx.navigateTo({
        url: '../public/task/task'
      }); break;
      case 'point': wx.navigateTo({
        url: 'point/point'
      }); break;
    }
  },
  imgError: function (ev) {
    if (ev.type == "error") {
      this.setData({ userImg: this.data.defaultImg });
    }
  },
  changeImage: function () {
    var _this = this;
    _this.setData({ actionSheetHidden: !_this.data.actionSheetHidden})
  },
  actionSheetbindchange: function () {
    var _this = this;
    _this.setData({ actionSheetHidden: !_this.data.actionSheetHidden});
  },
  loginOut:function (){
    wx.showModal({
      title: '系统提示',
      content: '你确定要退出当前登录账号？',
      success: function (res) {
        if (res.confirm) {
          wx.removeStorageSync('userid');
          wx.reLaunch({
            url: '../../pages/login/login',
          });
        }
      }
    });
  },
  changeImg: function () {
    var _this = this;
    wx.chooseImage({
      count: 1, // 默认9  
      sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有  
      sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有  
      success: function (res) { 
        var tempFilePaths = res.tempFilePaths[0];
        Utils.UpLoad(`${API.UpLoadApi3}`, tempFilePaths, 'file', { userid: wx.getStorageSync('userid')},function (res){
          if (res.statusCode === 200){
            wx.showToast({title: '修改成功！',icon: 'success',duration: 2000});
            _this.setData({ userImg: tempFilePaths, actionSheetHidden: !_this.data.actionSheetHidden });
          }else{
            wx.showToast({title: '修改失败！',icon: 'error',duration: 2000});
            _this.setData({ actionSheetHidden: !_this.data.actionSheetHidden });
          }
        });
      }
    })
  },  
  onLoad: function () {
    let _this = this;
    // 验证是否是网格员
    Utils.Request(`${API.isPointer}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ isPoint:res.data});
    });
    // 获取数据
    Utils.Request(`${API.UserInfo}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ userInfo: res.data });
      res.statusCode === 200 && _this.setData({ userImg: res.data.avatar});
    });
  }
}
Page(userConfig);