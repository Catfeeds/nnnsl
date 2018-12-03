const API = require("../../../../config/api.js");
const Utils = require("../../../../utils/utils.js");
const WxParse = require('../../../../lib/wxParse/wxParse.js');
let detailConfig = {
  data: {
    showComment: false,
    detail: null,
    isComment: true,
    currentId: null,
    isTickle: 2,
    isCollect: 2,
    tickleNum: 0,
    commentText:null,
    commentFlag:true
  },
  downloadEvent:function(ev){
    var name = `${ev.currentTarget.dataset["name"]}`
    wx.downloadFile({
      url: API.downs + name,
      success: function (res) {
        console.log(res.tempFilePath)
        var filePath = res.tempFilePath
        wx.openDocument({
          filePath: filePath,
          success: function (res) {
            console.log('打开文档成功')
          }
        })
      }
    })
  
  },
  tickle:function(ev){
    let _this = this,
        changeTickle = this.data.isTickle === 1 ? 2 : 1;
    Utils.Request(`${API.TickleApi}`, {
      id: _this.data.currentId,
      tickle: changeTickle,
      item: 'news',
      userid: wx.getStorageSync('userid')
    }).then((res) => {
        let tempNum = _this.data.tickleNum;
        if(res.statusCode===200){
          changeTickle===1?tempNum++:tempNum--;
          _this.setData({ isTickle: changeTickle });
          _this.setData({ tickleNum: tempNum });
        }
    });
  },
  collect: function (ev) {
    let _this = this,
      changeCollect = this.data.isCollect === 1 ? 2 : 1;
    Utils.Request(`${API.CollectApi}`, {
      id: _this.data.currentId,
      mark: changeCollect,
      item: 'news',
      userid: wx.getStorageSync('userid')
    }).then((res) => {
      res.statusCode === 200 && res.data.success && _this.setData({ isCollect: changeCollect });
    });
  },
  commentInp:function (ev){
    ev.detail.value ? this.setData({ commentText: ev.detail.value }) : this.setData({ commentText: null});
  },
  commentEvent: function () {
    if (this.data.commentFlag){
      let _this = this;
      this.data.commentText && Utils.Request(`${API.CommentApi}`, {
        id: _this.data.currentId,
        item: 'news',
        comm: _this.data.commentText,
        userid: wx.getStorageSync('userid')
      }).then((res) => {
        if(res.statusCode === 200){
          Utils.Request(`${API.Details}`, { id: _this.data.currentId, userid: wx.getStorageSync('userid') }).then((res) => {
            res.statusCode === 200 && _this.setData({ detail: res.data });
            res.statusCode === 200 && _this.setData({ commentText: null });
          });
          _this.setData({commentFlag:false});
        }
      });
    }
  },
  isShow: function (ev) {
    var tempShow = this.data.showComment;
    this.setData({ showComment: !tempShow });
  },
  onLoad: function (options){
    let _this = this;
    Utils.Request(`${API.ispoint}`, { eid: options['id'], cause: 'news', userid: wx.getStorageSync('userid') }).then((res) => {
      if (res.data.success === true) {
        _this.toast = _this.selectComponent("#toast");
        _this.toast.showToast('查看新闻+1分', 2000, () => { });
      }
    });
    Utils.Request(`${API.Details}`, { id: options['id'], userid: wx.getStorageSync('userid') }).then((res) => {
      console.log(res.data)
      res.statusCode === 200 && _this.setData({ currentId: res.data.News.id});
      res.statusCode === 200 && _this.setData({ detail: res.data });
      res.statusCode === 200 && _this.setData({ tickleNum: res.data.tickleNum });
      res.statusCode === 200 && _this.setData({ isComment: res.data.News.iscomment === 1 });
      res.statusCode === 200 && _this.setData({ isTickle: res.data.istickle || 2 });
      res.statusCode === 200 && _this.setData({ isCollect: res.data.mark || 2 });
      res.statusCode === 200 && _this.setData({ annexs: res.data.annexs });
      WxParse.wxParse('content', 'html', res.data.News.content, _this, 5);
      if(res.statusCode===200){
        if(res.data.News.share===1) wx.showShareMenu();
        else wx.hideShareMenu();
      }
    });
  },
  onShareAppMessage:function(){
    return {
      title: this.data.detail.News.title,
      imageUrl: '/images/top.png'
    }
  }
}
Page(detailConfig);