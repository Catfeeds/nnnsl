const API = require("./config/api.js");
const Utils = require("./utils/utils.js");
var appConfig = {
 
  onLaunch: function () {
    // if(wx.getStorageSync('userid')){
      
    //  wx.reLaunch({url: './pages/index/index'});
    wx.reLaunch({ url: './pages/login/login' });
    //  Utils.Request(`${API.Title}`, {userid: wx.getStorageSync('userid') }).then((res) => {
    //    var title = res.data.title;
    //    wx.setNavigationBarTitle({
    //      title: title,
    //    })
    //    });
     
    // }
  },  
}
App(appConfig);