const API = require("../../../../config/api.js");
const Utils = require("../../../../utils/utils.js");
var resultConfig = {
  data:{
    result:null,
  },
  onLoad: function (options) {
    let _this = this;
    Utils.Request(`${API.VoteResult}`, { id: options['id'], userid: wx.getStorageSync('userid') }).then((res) => {
      console.log(res.data)
      res.statusCode === 200 && _this.setData({ result:res.data});
    });
  }
}
Page(resultConfig);