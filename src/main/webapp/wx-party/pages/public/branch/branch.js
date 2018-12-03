const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
let branchConfig = {
  data: {
    tabNav: 0,
    branchData: [],
    branchInfo:{},
    defaultImg: "../../../images/mine.png",
    rootImg:API.RootIMG
  },
  tabSwitch: function (ev) {
    let toTab = ev.currentTarget.dataset.index;
    this.setData({ tabNav: toTab });
  },
  avatarError: function (ev) {
    if (ev.type == "error") {
      var newData = this.data.branchInfo;
      newData.sjurl = this.data.defaultImg;//错误图片替换为默认图片
      this.setData({ branchInfo: newData });
    }
  },
  imgError: function (ev) {
    if (ev.type == "error") {
      var errorImgIndex = ev.currentTarget.dataset.errorimg, newData = this.data.branchData;
      newData[errorImgIndex].url = this.data.defaultImg;//错误图片替换为默认图片
      this.setData({ branchData: newData });
    }
  },
  onLoad: function () {
    let _this = this;
    Utils.Request(`${API.MailSearch}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ branchData: res.data });
    });
    Utils.Request(`${API.BranchInfo}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ branchInfo: res.data });
    });
  }
}
Page(branchConfig);