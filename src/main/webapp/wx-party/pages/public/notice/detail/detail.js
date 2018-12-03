const API = require("../../../../config/api.js");
const Utils = require("../../../../utils/utils.js");
const WxParse = require('../../../../lib/wxParse/wxParse.js');
var detailConfig = {
   data:{
     detail:null
   },
   onLoad: function (options) {
     let _this = this;
     Utils.Request(`${API.ispoint}`, { eid: options['id'], cause: 'news', userid: wx.getStorageSync('userid') }).then((res) => {
       if (res.data.success === true) {
         _this.toast = _this.selectComponent("#toast");
         _this.toast.showToast('查看通知公告+1分', 2000, () => { });
       }
     });
     Utils.Request(`${API.Details}`, { id: options['id'], userid: wx.getStorageSync('userid') }).then((res) => {
       
       res.statusCode === 200 && _this.setData({ detail: res.data });
       WxParse.wxParse('content', 'html', res.data.News.content, _this, 5);
       if (res.statusCode === 200) {
         if (res.data.News.share === 1) wx.showShareMenu();
         else wx.hideShareMenu();
       }
     });
   },
   onShareAppMessage: function () {
     return {
       title: this.data.detail.News.title,
       imageUrl: '/images/top.png'
     }
   }
}
Page(detailConfig);