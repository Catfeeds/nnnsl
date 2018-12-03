const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
var mineConfig = {
  data:{
    userInfo:null,
    imgURL:"",
    birthTime:"",
    inTime:"",
    defaultImg:"../../../images/mine.png"
  },
  imgError:function(ev){
    if(ev.type == "error"){
      this.setData({ imgURL: this.data.defaultImg});
    }
  },
  onLoad:function (){
    let _this = this;
    Utils.Request(`${API.UserInfo}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ userInfo: res.data });
      res.statusCode === 200 && _this.setData({ imgURL: API.RootIMG + res.data.url });
      if (res.data.BIRTHDAY){
        var birthArr = res.data.BIRTHDAY.split(/[-: \/]/);
        res.statusCode === 200 && res.data.BIRTHDAY && _this.setData({ birthTime: new Date(birthArr[0], birthArr[1] - 1, birthArr[2], birthArr[3], birthArr[4], birthArr[5]).format('yyyy-MM-dd') });
      }
      if (res.data.in_date){
        var dateArr = res.data.in_date.split(/[-: \/]/);
        res.statusCode === 200 && res.data.in_date && _this.setData({ inTime: new Date(dateArr[0], dateArr[1] - 1, dateArr[2], dateArr[3], dateArr[4], dateArr[5]).format('yyyy-MM-dd') });
      }
    });
  },
}
Date.prototype.format = function (fmt) { //author: meizz
  var o = {
    "M+": this.getMonth() + 1, //月份
    "d+": this.getDate(), //日
    "h+": this.getHours(), //小时
    "m+": this.getMinutes(), //分
    "s+": this.getSeconds(), //秒
    "q+": Math.floor((this.getMonth() + 3) / 3), //季度
    "S": this.getMilliseconds() //毫秒
  };
  if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
  for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt))
      fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
  return fmt;
}
Page(mineConfig);