const API = require("../../../../config/api.js");
const Utils = require("../../../../utils/utils.js");
var detailConfig = {
  data: {
    showComment:false,
    detail:null,
    currentId: null,
    isTickle: 2,
    isCollect: 2,
    isComment: true,
    commentText: null,
    commentFlag:true
  },
  isShow: function (ev) {
    var tempShow = this.data.showComment;
    this.setData({ showComment: !tempShow });
  },
  tickle: function (ev) {
    let _this = this,
      changeTickle = this.data.isTickle === 1 ? 2 : 1;
    Utils.Request(`${API.TickleApi}`, {
      id: _this.data.currentId,
      tickle: changeTickle,
      item: 'course',
      userid: wx.getStorageSync('userid')
    }).then((res) => {
      res.statusCode === 200 && res.data.success && _this.setData({ isTickle: changeTickle });
      Utils.Request(`${API.ClassDetail}`, { id: _this.data.currentId, userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ detail: res.data });
      });
    });
  },
  collect: function (ev) {
    let _this = this,
      changeCollect = this.data.isCollect === 1 ? 2 : 1;
    Utils.Request(`${API.CollectApi}`, {
      id: _this.data.currentId,
      mark: changeCollect,
      item: 'course',
      userid: wx.getStorageSync('userid')
    }).then((res) => {
      res.statusCode === 200 && res.data.success && _this.setData({ isCollect: changeCollect });
    });
  },
  commentInp: function (ev) {
    ev.detail.value ? this.setData({ commentText: ev.detail.value }) : this.setData({ commentText: null });
  },
  commentEvent: function () {
    if (this.data.commentFlag){
      let _this = this;
      this.data.commentText && Utils.Request(`${API.CommentApi}`, {
        id: _this.data.currentId,
        item: 'course',
        comm: _this.data.commentText,
        userid: wx.getStorageSync('userid')
      }).then((res) => {
        if (res.statusCode === 200){
          Utils.Request(`${API.ClassDetail}`, { id: _this.data.currentId, userid: wx.getStorageSync('userid') }).then((res) => {
            res.statusCode === 200 && _this.setData({ detail: res.data });
            res.statusCode === 200 && _this.setData({ commentText: null });
          });
          _this.setData({commentFlag:false});
        }
      });
    }
    
  },
  onLoad: function (options) {
    let _this = this;
    Utils.Request(`${API.ispoint}`, { eid: options['id'], cause: 'course', userid: wx.getStorageSync('userid') }).then((res) => {
      if (res.data.success === true) {
        _this.toast = _this.selectComponent("#toast");
        _this.toast.showToast('积分+1', 2000, () => { });
      }
    });
    Utils.Request(`${API.ClassDetail}`, { id: options['id'], userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ currentId: res.data.Course.id });
      res.statusCode === 200 && _this.setData({ isTickle: res.data.istickle || 2 });
      res.statusCode === 200 && _this.setData({ isCollect: res.data.ismark || 2 });
      res.statusCode === 200 && _this.setData({ isComment: res.data.Course.iscomment === 1 });
      res.statusCode === 200 && _this.setData({ detail: res.data });
     
    });
  }
}
Page(detailConfig);