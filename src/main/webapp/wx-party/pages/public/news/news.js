const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
var newsConfig = {
  data: {
    tabNav:"all",
    navData: [],
    newsData:[],
    swiperNow:0,
    searchText:null,
    showSwiper:true,
    isAll:false,
    pageNum: 1,
    totalNum: 0,
    defaultImg: "../../../images/news.png",
  },
  searchInp:function (ev){
    ev.detail.value ? this.setData({ searchText: ev.detail.value }) : this.setData({ searchText: null });
  },
  swiperChange:function (ev){
    this.setData({ swiperNow:ev.detail.current })
  },
  searchEvent: function (){
    let _this = this;
    if (this.data.searchText){
      if (_this.data.tabNav == "all") {
        Utils.Request(`${API.NewsList}`, { title: _this.data.searchText,userid: wx.getStorageSync('userid') }).then((res) => {
          res.statusCode === 200 && _this.setData({ newsData: res.data.rows });
          _this.setData({ showSwiper: true });
        });
      } else {
        Utils.Request(`${API.NewsList}`, { title: _this.data.searchText,cart: _this.data.tabNav, userid: wx.getStorageSync('userid') }).then((res) => {
          res.statusCode === 200 && _this.setData({ newsData: res.data.rows });
          _this.setData({ showSwiper: false });
        });
      }
      this.setData({ searchText: "" });
    }else{
      if (_this.data.tabNav == "all") {
        Utils.Request(`${API.NewsList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
          res.statusCode === 200 && _this.setData({ newsData: res.data.rows });
          _this.setData({ showSwiper: true });
        });
      } else {
        Utils.Request(`${API.NewsList}`, { cart: _this.data.tabNav, userid: wx.getStorageSync('userid') }).then((res) => {
          res.statusCode === 200 && _this.setData({ newsData: res.data.rows });
          _this.setData({ showSwiper: false });
        });
      }
    }
  },
  imgError: function (ev) {
    if (ev.type == "error") {
      var errorImgIndex = ev.currentTarget.dataset.errorimg, newData = this.data.newsData;
      newData[errorImgIndex].url = this.data.defaultImg;//错误图片替换为默认图片
      this.setData({ newsData: newData });
    }
  },
  tabSwitch: function (ev) {
    let toTab = ev.currentTarget.dataset.index;
    if(toTab=="all"){
      this.getData.call(this, { userid: wx.getStorageSync('userid')});
      this.setData({ showSwiper: true });
    }else{
      this.getData.call(this, { cart: toTab, userid: wx.getStorageSync('userid')});
      this.setData({ showSwiper: false });
    }
    this.setData({ tabNav: toTab });
  },
  seeDatil:function (ev){
    wx.navigateTo({
      url: `detail/detail?id=${ev.currentTarget.dataset['id']}`
    });
  },
  onLoad: function (options) {
    let _this = this;
    this.getData.call(this, {userid: wx.getStorageSync('userid')});
    Utils.Request(`${API.NewsCart}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ navData: res.data });
    });
  },
  onReachBottom: function () {
    let _this = this, pages = this.data.pageNum;
    if(++pages<=this.data.totalNum){
      wx.showLoading({title: '加载中...'});
      this.setData({ pageNum: pages });
      if (_this.data.tabNav == "all") {
        Utils.Request(`${API.NewsList}`, { userid: wx.getStorageSync('userid'),page:pages }).then((res) => {
          res.statusCode === 200 && _this.setData({ newsData: _this.data.newsData.concat(res.data.rows) });
          _this.setData({ showSwiper: true }); wx.hideLoading();
        });
      }else{
        Utils.Request(`${API.NewsList}`, { cart: _this.data.tabNav, userid: wx.getStorageSync('userid'), page: pages }).then((res) => {
          res.statusCode === 200 && _this.setData({ newsData: _this.data.newsData.concat(res.data.rows) });
          _this.setData({ showSwiper: false }); wx.hideLoading();
        });
      }
    }else _this.setData({isAll:true});
  },
  getData:function (cart={}){
    let _this = this;
    Utils.Request(`${API.NewsList}`,cart).then((res) => {
      res.statusCode === 200 && _this.setData({ newsData: res.data.rows });
      res.statusCode === 200 && _this.setData({ totalNum: res.data.pages });
      _this.data.totalNum===1 &&_this.setData({ isAll:true });
    });
  },
  onPullDownRefresh: function () {
    let _this = this;
    if (_this.data.tabNav == "all") {
      Utils.Request(`${API.NewsList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ newsData: res.data.rows });
        res.statusCode === 200 && wx.stopPullDownRefresh();
        _this.setData({ showSwiper: true });
      });
    } else {
      Utils.Request(`${API.NewsList}`, { cart: _this.data.tabNav, userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ newsData: res.data.rows });
        res.statusCode === 200 && wx.stopPullDownRefresh();
        _this.setData({ showSwiper: false });
      });
    }
  }
}
Page(newsConfig);