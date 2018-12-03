const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
var newsConfig = {
  data: {
    tabNav:"all",
    newsData:[],
    isAdmin: false,
    BathUrl: `${API.RootIMG}`,
    defaultImg: "../../../images/news.png",
  },
  imgError: function (ev) {
    if (ev.type == "error") {
      var errorImgIndex = ev.currentTarget.dataset.errorimg, newData = this.data.newsData;
      newData[errorImgIndex].url = this.data.defaultImg;//错误图片替换为默认图片
      this.setData({ newsData: newData });
    }
  },
  add:function(){
    wx.navigateTo({url: `add/add`});
  },
  seeDatil:function (ev){
    wx.navigateTo({
      url: `detail/detail?id=${ev.currentTarget.dataset['id']}`
    });
  },
  onShow:function(){
    this.getData.call(this, { userid: wx.getStorageSync('userid') });
  },
  onLoad: function () {
    let _this = this;
    this.getData.call(this, { userid: wx.getStorageSync('userid')});
    Utils.Request(`${API.isAdmin}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({isAdmin:res.data['isadmin']===true});
    });
    Utils.Request(`${API.ShykList}`, { userid: wx.getStorageSync('userid'), where: "{mode:1}" }).then((res) => {
      console.log(res.data)
      res.statusCode === 200 && _this.setData({ newsData: res.data.rows });
      res.statusCode === 200 && wx.stopPullDownRefresh();
    });
  },
  getData: function (cart = {}) {
    let _this = this;
    Utils.Request(`${API.ShykList}`, { userid: wx.getStorageSync('userid'), where: "{mode:1}" }).then((res) => {
      res.statusCode === 200 && _this.setData({ newsData: res.data.rows });
    });
  },
  onPullDownRefresh: function () {
    let _this = this;
    Utils.Request(`${API.ShykList}`, { userid: wx.getStorageSync('userid'),where:"{mode:1}" }).then((res) => {
        res.statusCode === 200 && _this.setData({ newsData: res.data.rows });
        res.statusCode === 200 && wx.stopPullDownRefresh();
      });
  }
  
}
Page(newsConfig);