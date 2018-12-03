const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
var notcieConfig = {
  data: {
    noticeData: [],
    tabNav: "all",
    navData: [],
    isAll: false,
    pageNum: 1,
    totalNum: 0,
    searchText: null
  },
  seeDetail: function (ev) {
    wx.navigateTo({
      url: `detail/detail?id=${ev.currentTarget.dataset['id']}`
    });
  },
  searchInp: function (ev) {
    ev.detail.value ? this.setData({ searchText: ev.detail.value }) : this.setData({ searchText: null });
  },
  searchEvent: function () {
    let _this = this;
    if (_this.data.searchText) {
      if (_this.data.tabNav == "all") {
        Utils.Request(`${API.NoticeList}`, { title: _this.data.searchText, userid: wx.getStorageSync('userid') }).then((res) => {
          res.statusCode === 200 && _this.setData({ noticeData: _this.dataFormat(res.data.rows) });
        });
      } else {
        Utils.Request(`${API.NoticeList}`, { title: _this.data.searchText, cart: _this.data.tabNav, userid: wx.getStorageSync('userid') }).then((res) => {
          res.statusCode === 200 && _this.setData({ noticeData: _this.dataFormat(res.data.rows) });
        });
      }
      _this.setData({ searchText: "" });
    } else {
      if (_this.data.tabNav == "all") {
        Utils.Request(`${API.NoticeList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
          res.statusCode === 200 && _this.setData({ noticeData: _this.dataFormat(res.data.rows) });
        });
      } else {
        Utils.Request(`${API.NoticeList}`, { cart: _this.data.tabNav, userid: wx.getStorageSync('userid') }).then((res) => {
          res.statusCode === 200 && _this.setData({ noticeData: _this.dataFormat(res.data.rows) });
        });
      }
    }
  },
  tabSwitch: function (ev) {
    let toTab = ev.currentTarget.dataset.index;
    if (toTab == "all") {
      this.getData.call(this, { userid: wx.getStorageSync('userid') });
    } else {
      this.getData.call(this, { cart: toTab, userid: wx.getStorageSync('userid') });
    }
    this.setData({ tabNav: toTab });
  },
  onReachBottom: function () {
    let _this = this, pages = this.data.pageNum;
    if (++pages <= this.data.totalNum) {
      wx.showLoading({ title: '加载中...' });
      this.setData({ pageNum: pages });
      if (_this.data.tabNav == "all") {
        Utils.Request(`${API.NoticeList}`, { userid: wx.getStorageSync('userid'), page: pages }).then((res) => {
          res.statusCode === 200 && _this.setData({ noticeData: _this.data.cleanData.concat(_this.dataFormat(res.data.rows)) });
          wx.hideLoading();
        });
      } else {
        Utils.Request(`${API.NoticeList}`, { cart: _this.data.tabNav, userid: wx.getStorageSync('userid'), page: pages }).then((res) => {
          res.statusCode === 200 && _this.setData({ noticeData: _this.data.noticeData.concat(_this.dataFormat(res.data.rows)) });
          wx.hideLoading();
        });
      }
    } else _this.setData({ isAll: true });
  },
  onLoad: function () {
    let _this = this;
    this.getData.call(this, { userid: wx.getStorageSync('userid') });
    Utils.Request(`${API.NoticeCart}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ navData: res.data });
    });
  },
  getData:function (cart={}){
    let _this = this;
    Utils.Request(`${API.NoticeList}`,cart).then((res) => {
      res.statusCode === 200 && _this.setData({ noticeData: _this.dataFormat(res.data.rows) });
      res.statusCode === 200 && _this.setData({ totalNum: res.data.pages });
      _this.data.totalNum === 1 && _this.setData({ isAll: true });
    });
  },
  onPullDownRefresh: function () {
    let _this = this;
    if (_this.data.tabNav == "all") {
      Utils.Request(`${API.NoticeList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ noticeData: _this.dataFormat(res.data.rows) });
        res.statusCode === 200 && wx.stopPullDownRefresh();
      });
    } else {
      Utils.Request(`${API.NoticeList}`, { cart: _this.data.tabNav, userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ noticeData: _this.dataFormat(res.data.rows) });
        res.statusCode === 200 && wx.stopPullDownRefresh();
      });
    }
  },
  dataFormat: function (data) {
    let temp = [];
    if (data) {
      [].slice.call(data).forEach((val, index) => {
        temp.push({
          "id": val.id, "title": val.title, "type": val.type,
          "month": `${val.creat_time.split(" ")[0].split("-")[1]}月`,
          "day": `${val.creat_time.split(" ")[0].split("-")[2]}`
        });
      });
      return temp;
    }
  }
}
Page(notcieConfig);