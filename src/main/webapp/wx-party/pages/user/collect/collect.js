const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
var collectConfig = {
  data:{
    collectData: []
  },
  seeDetail:function(ev){
    let id = ev.currentTarget.dataset['id'];
    switch (ev.currentTarget.dataset['item']){
      case 'news':wx.navigateTo({
        url: `../../public/news/detail/detail?id=${id}`,
      });break;
      case 'event':wx.navigateTo({
        url: `../../public/activity/detail/detail?id=${id}`,
      });break;
      case 'course': wx.navigateTo({
        url: `../../public/class/detail/detail?id=${id}`,
      }); break;
    }
  },
  onLoad:function (){
    let _this = this;
    Utils.Request(`${API.CollectList}`, { userid: wx.getStorageSync('userid'),mark:1 }).then((res) => {
      console.log(res);
      res.statusCode === 200 && _this.setData({ collectData: res.data });
    });
  },
}

Page(collectConfig);