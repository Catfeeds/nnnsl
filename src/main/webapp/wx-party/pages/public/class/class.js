const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
var classConfig = {
  data:{
    swiperNow: 0,
    tabNav: 0,
    isIndex: true,
    classData:[]
  },
  swiperChange: function (ev) {
    this.setData({ swiperNow: ev.detail.current })
  },
  seeDetail: function (ev) {
    wx.navigateTo({url: `detail/detail?id=${ev.currentTarget.dataset['id']}`});
  },
  tabSwitch:function (ev){
    var toTab = ev.currentTarget.dataset.index,_this=this;
    if(toTab==="1"){
      Utils.Request(`${API.MyClassList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ classData: _this.dataFormat(res.data) });
        _this.setData({isIndex:false});
      });
    }else{
      Utils.Request(`${API.ClassList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ classData: _this.dataFormat(res.data) });
        toTab === "0" ? _this.setData({ isIndex: true }) : _this.setData({ isIndex: false });
      });
    }
    this.setData({ tabNav : toTab});
  },
  onLoad: function () {
    let _this = this;
    Utils.Request(`${API.ClassList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ classData: _this.dataFormat(res.data) });
    });
  },
  onPullDownRefresh: function () {
    let _this = this;
    if (_this.data.tabNav == 1) {
      Utils.Request(`${API.MyClassList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ classData: _this.dataFormat(res.data) });
        res.statusCode === 200 && wx.stopPullDownRefresh();
        _this.setData({ isIndex: false });
      });
    } else {
      Utils.Request(`${API.ClassList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ classData: _this.dataFormat(res.data) });
        res.statusCode === 200 && wx.stopPullDownRefresh();
        _this.setData({ isIndex: true });
      });
    }
  },
  dataFormat:function(data){
    if(data){
      [].slice.call(data).forEach((v,i)=>{
        var dateArr = v['create_time'].split(/[-: \/]/);
        data[i]['create_time'] = new Date((new Date(dateArr[0], dateArr[1] - 1, dateArr[2], dateArr[3],dateArr[4],dateArr[5]))).format('yyyy-MM-dd');
      });
      return data;
    }
  }
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
Page(classConfig);