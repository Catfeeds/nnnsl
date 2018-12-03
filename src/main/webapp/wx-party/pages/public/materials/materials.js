const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
var newsConfig = {
  data: {
    tabNav:"all",
    navData: [],
    newsData:[],
    searchText:null,
    isAll: false,
    pageNum: 1,
    totalNum: 0,
    defaultImg: "../../../images/news.png",
  },
  imgError: function (ev) {
    if (ev.type == "error") {
      var errorImgIndex = ev.currentTarget.dataset.errorimg, newData = this.data.newsData;
      newData[errorImgIndex].url = this.data.defaultImg;//错误图片替换为默认图片
      this.setData({ newsData: newData });
    }
  },
  seeDatil:function (ev){
    wx.navigateTo({
      url: `detail/detail?id=${ev.currentTarget.dataset['id']}`
    });
  },
  onReachBottom: function () {
    let _this = this, pages = this.data.pageNum;
    if (++pages <= this.data.totalNum) {
      wx.showLoading({ title: '加载中...' });
      this.setData({ pageNum: pages });
      Utils.Request(`${API.fileList}`, { userid: wx.getStorageSync('userid'), page: pages }).then((res) => {
        res.statusCode === 200 && _this.setData({ newsData: _this.data.newsData.concat(res.data.rows) });
        wx.hideLoading();
      });
    } else _this.setData({ isAll: true });
  },
  onLoad: function (options) {
    let _this = this;
    Utils.Request(`${API.fileList}`, { userid: wx.getStorageSync('userid')}).then((res) => {
      res.statusCode === 200 && _this.setData({ newsData: res.data.rows });
      res.statusCode === 200 && _this.setData({ totalNum: res.data.pages });
      _this.data.totalNum === 1 && _this.setData({ isAll: true });
    });
  },
  onPullDownRefresh: function () {
    let _this = this;
    Utils.Request(`${API.fileList}`, { userid: wx.getStorageSync('userid')}).then((res) => {
      res.statusCode === 200 && _this.setData({ newsData: res.data.rows });
      res.statusCode === 200 && wx.stopPullDownRefresh();
    });
  }
}
Page(newsConfig);