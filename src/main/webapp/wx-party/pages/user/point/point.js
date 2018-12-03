const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
let pointConfig = {
  data:{
    star:[0,2,4,6,8],
    hollow: '../../../images/hollow.png',
    solid: '../../../images/solid.png',
    half: '../../../images/half.png',
    deptList:[]
  },
  //点击右边,半颗星
  tapLeft: function (ev) {
    console.log(ev);
    let key = ev.currentTarget.dataset.key,
      index = ev.currentTarget.dataset.index,
      tempList = this.data.deptList;
    if (ev.currentTarget.dataset.key == 1) {key = 0;}
    tempList[index]['point'] = key;
    this.setData({ deptList: tempList});
  },
  //点击左边,整颗星
  tapRight: function (ev) {
    console.log(ev);
    let key = ev.currentTarget.dataset.key,
      index = ev.currentTarget.dataset.index,
      tempList = this.data.deptList;
    tempList[index]['point'] = key;
    this.setData({ deptList: tempList });
  },
  // 提交打分
  submitPoint:function(ev){
    let _this = this, index = ev.currentTarget.dataset.index;
    console.log(index);
    Utils.Request(`${API.pointAPI}`, {
      userid: wx.getStorageSync('userid'),
      deptid: _this.data.deptList[index]['deptid'],
      point: _this.data.deptList[index]['point']
    }).then((res) => {
      res.statusCode === 200 && wx.showToast({title: '打分提交成功！',icon:'none',duration:2000});
    });
  },
  onLoad:function(){
    // 获取列表
    let _this = this;
    Utils.Request(`${API.pointList}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      res.statusCode === 200 && _this.setData({ deptList: res.data });
    });
  }
}
Page(pointConfig);