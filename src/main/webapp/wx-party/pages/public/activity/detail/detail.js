const API = require("../../../../config/api.js");
const Utils = require("../../../../utils/utils.js");
const WxParse = require('../../../../lib/wxParse/wxParse.js');
var detailConfig = {
  data: {
    showPeople: false,
    showComment: false,
    detail:null,
    currentId: null,
    isTickle: 2,
    isCollect: 2,
    isComment: true,
    commentText: null,
    commentFlag:true
  },
  isShowPeople: function (ev) {
    var tempShow = this.data.showPeople;
    this.setData({ showPeople: !tempShow });
  },
  isShowComment: function (ev) {
    var tempShow = this.data.showComment;
    this.setData({ showComment: !tempShow });
  },
  tickle: function (ev) {
    if (!this.data.detail.isOver) {
      let _this = this,
        changeTickle = this.data.isTickle === 1 ? 2 : 1;
      Utils.Request(`${API.TickleApi}`, {
        id: _this.data.currentId,
        tickle: changeTickle,
        item: 'event',
        userid: wx.getStorageSync('userid')
      }).then((res) => {
        res.statusCode === 200 && res.data.success && _this.setData({ isTickle: changeTickle });
        Utils.Request(`${API.ActDetail}`, { id: _this.data.currentId, userid: wx.getStorageSync('userid') }).then((res) => {
          res.statusCode === 200 && _this.setData({ detail: res.data });
        });
      });
    }else wx.showToast({title: '活动已结束！', icon: 'none'});
  },
  collect: function (ev) {
    if (!this.data.detail.isOver){
      let _this = this,
        changeCollect = this.data.isCollect === 1 ? 2 : 1;
      Utils.Request(`${API.CollectApi}`, {
        id: _this.data.currentId,
        mark: changeCollect,
        item: 'event',
        userid: wx.getStorageSync('userid')
      }).then((res) => {
        res.statusCode === 200 && res.data.success && _this.setData({ isCollect: changeCollect });
      });
    } else wx.showToast({ title: '活动已结束！', icon: 'none' });
  },
  signEvent:function (){
    let _this = this;
    if (this.data.detail.isOver) {// 活动截止报名
      wx.showToast({
        title: '该活动已截止报名！',icon:'none'
      });
    } else if (this.data.detail.isattend){// 已报名但是活动未截止报名
      wx.showModal({
        title: '系统提示',
        content: '您确认要取消该活动报名？',
        success: (res)=> {
          res.confirm && Utils.Request(`${API.JoinApi}`, { id: _this.data.currentId, join: 2, item: 'event', userid: wx.getStorageSync('userid') }).then((res) => {
            res.statusCode === 200 && wx.showToast({
              title: '活动报名已取消！',icon: 'none',
              success:()=>{
                Utils.Request(`${API.ActDetail}`, { id: _this.data.currentId, userid: wx.getStorageSync('userid') }).then((res1) => {
                  res1.statusCode === 200 && _this.setData({ detail: res1.data });
                  WxParse.wxParse('content', 'html', res1.data.content, _this, 5);
                });
              }
            });
          });
        }
      });
    }else{// 活动未截止报名且未报名
    var idd = this.data.currentId
      wx.getLocation({
        type: 'wgs84',
        success: function (res) {
          var latitude = res.latitude
          var longitude = res.longitude
          console.log(res)
          Utils.Request(`${API.JoinApi}`, { x:latitude,y:longitude,id: idd, join: 1, item: 'event', userid: wx.getStorageSync('userid') }).then((res) => {
            console.log(res)
            if (res.data === "fail") {
              wx.showToast({ title: '已超过报名人数限制！', icon: 'none' })
            } else {
              res.statusCode === 200 && Utils.Request(`${API.ispoint}`, { eid: idd, cause: 'event', userid: wx.getStorageSync('userid') }).then((res) => {
                if (res.data.success === true) {
                  _this.toast = _this.selectComponent("#toast");
                  _this.toast.showToast('报名成功+1分', 2000, () => {
                    Utils.Request(`${API.ActDetail}`, { id: _this.data.currentId, userid: wx.getStorageSync('userid') }).then((res) => {
                      res.statusCode === 200 && _this.setData({ detail: res.data });
                      WxParse.wxParse('content', 'html', res.data.content, _this, 5);
                    });
                  });
                }else{
                  Utils.Request(`${API.ActDetail}`, { id: _this.data.currentId, userid: wx.getStorageSync('userid') }).then((res) => {
                    res.statusCode === 200 && _this.setData({ detail: res.data });
                    WxParse.wxParse('content', 'html', res.data.content, _this, 5);
                  });
                }
              })
            }
          });
        }
      })
      
    }
  },
  commentInp: function (ev) {
    ev.detail.value ? this.setData({ commentText: ev.detail.value }) : this.setData({ commentText: null });
  },
  commentEvent: function () {
    if (this.data.commentFlag){
      let _this = this;
      this.data.commentText && Utils.Request(`${API.CommentApi}`, {
        id: _this.data.currentId,
        item: 'event',
        comm: _this.data.commentText,
        userid: wx.getStorageSync('userid')
      }).then((res) => {
        if(res.statusCode === 200){
          Utils.Request(`${API.ActDetail}`, { id: _this.data.currentId, userid: wx.getStorageSync('userid') }).then((res) => {
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
   
    Utils.Request(`${API.ActDetail}`, { id: options['id'], userid: wx.getStorageSync('userid') }).then((res) => {
      console.log(res.data)
      res.statusCode === 200 && _this.setData({ currentId: res.data.id });
      res.statusCode === 200 && _this.setData({ isTickle: res.data.istickle || 2 });
      res.statusCode === 200 && _this.setData({ isCollect: res.data.ismark || 2 });
      res.statusCode === 200 && _this.setData({ detail: res.data });
      res.statusCode === 200 && _this.setData({ marks: res.data.tickleNum ||0});
      res.statusCode === 200 && _this.setData({ isComment: res.data.iscomment === 1 });
      WxParse.wxParse('content', 'html', res.data.content, _this, 5);
    });
  }
}
Page(detailConfig);