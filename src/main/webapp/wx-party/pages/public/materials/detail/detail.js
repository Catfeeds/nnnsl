const API = require("../../../../config/api.js");
const Utils = require("../../../../utils/utils.js");
const WxParse = require('../../../../lib/wxParse/wxParse.js');
let detailConfig = {
  data: {
    detail: null,
    currentId: null,
  },
  downloadEvent: function (ev) {
    var name = `${ev.currentTarget.dataset["name"]}`
    if (this.data.detail.News.annex) {
      var uu = API.downs + name;
      console.log(uu)
      wx.downloadFile({
        url: uu,
        success: function (res) {
          var filePath = res.tempFilePath;
          wx.openDocument({
            filePath: filePath,
            success: function (res) {
              console.log('打开文档成功')
            }
          });
        }
      });
    }
  },
  onLoad: function (options) {
    let _this = this;
    Utils.Request(`${API.Details}`, { id: options['id'], userid: wx.getStorageSync('userid') }).then((res) => {
      Utils.Request(`${API.ispoint}`, { eid: options['id'], cause: 'news', userid: wx.getStorageSync('userid') }).then((res) => {
        if (res.data.success === true) {
          _this.toast = _this.selectComponent("#toast");
          _this.toast.showToast('查看党建资料+1分', 2000, () => { });
        }
      })
      res.statusCode === 200 && _this.setData({ currentId: res.data.News.id });
      res.statusCode === 200 && _this.setData({ detail: res.data });
      res.statusCode === 200 && _this.setData({ annexs: res.data.annexs });
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