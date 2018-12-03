const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
var notcieConfig = {
  data: {
    tabNav: "all",
    navData: [],
    cleanData: [],
    isAll: false,
    pageNum: 1,
    totalNum: 0,
    searchText: null,
  },
  searchInp: function (ev) {
    ev.detail.value ? this.setData({ searchText: ev.detail.value }) : this.setData({ searchText: null });
  },
  searchEvent: function () {
    if (this.data.searchText) {
      this.getData.call(this, { title: this.data.searchText, userid: wx.getStorageSync('userid') });
      this.setData({ searchText: "" });
    } else {
      this.getData.call(this, { userid: wx.getStorageSync('userid') });
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
  seeDetail: function (ev) {
    wx.navigateTo({
      url: `detail/detail?id=${ev.currentTarget.dataset['id']}`
    });
  },
  onLoad: function () {
    let _this = this;
    this.getData.call(this, { userid: wx.getStorageSync('userid') });
    Utils.Request(`${API.JyjlCart}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      console.log(res.data)
      res.statusCode === 200 && _this.setData({ navData: res.data });
    });
  },
  getData:function(cart={}){
    let _this = this;
    Utils.Request(`${API.JyjlCart}`,cart).then((res) => {
      res.statusCode === 200 && _this.setData({ cleanData: _this.dataFormat(res.data.rows) });
      res.statusCode === 200 && _this.setData({ totalNum: res.data.pages });
      _this.data.totalNum === 1 && _this.setData({ isAll: true });
    });
  },
  onReachBottom: function () {
    let _this = this, pages = this.data.pageNum;
    if (++pages <= this.data.totalNum) {
      wx.showLoading({ title: '加载中...' });
      this.setData({ pageNum: pages });
      if (_this.data.tabNav == "all") {
        Utils.Request(`${API.CleanList}`, { userid: wx.getStorageSync('userid'), page: pages }).then((res) => {
          res.statusCode === 200 && _this.setData({ cleanData: _this.data.cleanData.concat(_this.dataFormat(res.data.rows)) });
          wx.hideLoading();
        });
      } else {
        Utils.Request(`${API.CleanList}`, { cart: _this.data.tabNav, userid: wx.getStorageSync('userid'), page: pages }).then((res) => {
          res.statusCode === 200 && _this.setData({ cleanData: _this.data.cleanData.concat(_this.dataFormat(res.data.rows)) });
          wx.hideLoading();
        });
      }
    } else _this.setData({ isAll: true });
  },
  onPullDownRefresh: function () {
    let _this = this;
    this.getData.call(this, { userid: wx.getStorageSync('userid') });
    Utils.Request(`${API.JyjlCart}`, { userid: wx.getStorageSync('userid') }).then((res) => {

      res.statusCode === 200 && _this.setData({ navData: res.data });
    });
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
  },
}
Page(notcieConfig);