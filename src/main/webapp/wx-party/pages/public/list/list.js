const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
let listConfig = {
  data:{
    leftList:[],
    rightList:[],
    leftPage:10,
    rightPage:10,
    leftTotal:0,
    rightTotal: 0,
  },
  onReachBottom: function () {
    let _this = this, left = this.data.leftPage, right = his.data.rightPage;
    left+=leftPage,right+=rightPage;
    if(left<=this.data.leftTotal){
      wx.showLoading({ title: '加载中...' });
      setTimeout(()=>{
        _this.setData({leftPage:left});
        wx.hideLoading();
      },1000);
    }
    if (right <= this.data.rightTotal) {
      wx.showLoading({ title: '加载中...' });
      setTimeout(() => {
        _this.setData({ rightPage: right });
        wx.hideLoading();
      }, 1000);
    }
  },
  onLoad: function (options) {
    // 支部排行
    let _this = this;
    Utils.Request(`${API.MeetCount}`,{ userid: wx.getStorageSync('userid') }).then((res) => {
      if (res.statusCode === 200){
        console.log(res)
        _this.setData({ leftList: res.data.zbres });
        _this.setData({ leftTotal: res.data.zbres.length });
        _this.setData({ rightList: res.data.dwres });
        _this.setData({ rightTotal: res.data.dwres.length })
      }
    });
  },
};
Page(listConfig);