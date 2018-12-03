const API = require("../../../../config/api.js");
const Utils = require("../../../../utils/utils.js");
const WxParse = require('../../../../lib/wxParse/wxParse.js');
let detailConfig = {
  data:{
    detail: null,
    taskId: null,
    text: "",
    imgList: [],
    imgNames: []
  },
  textInp: function (ev) {
    ev.detail.value ? this.setData({ text: ev.detail.value }) : this.setData({ text: null });
  },
  addImage: function () {
    var _this = this;
    wx.chooseImage({
      count: 1, // 默认9  
      sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有  
      sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有  
      success: function (fileRes) {
        var tempFilePath = fileRes.tempFilePaths[0];
        Utils.UpLoad(`${API.UpLoadApi2}`, tempFilePath, 'file', {}, function (res) {
          console.log(res);
          if (res.statusCode === 200) {
            let tempData = JSON.parse(res.data),
              tempNames = _this.data.imgNames,
              tempArr = _this.data.imgList;
            tempNames.push(tempData['fileName']);
            tempArr.push(tempFilePath);
            _this.setData({ imgList: tempArr });
            _this.setData({ imgNames: tempNames });
            wx.showToast({ title: '上传成功！', icon: 'success', duration: 1000 });
          } else {
            wx.showToast({ title: '上传失败！', icon: 'error', duration: 1000 });
          }
        });
      }
    })
  },
  submitTask:function(){
    let _this = this;
    if (_this.data.detail['iscomp'] !== 1){// 未完成
      console.log(_this.data.text)
      if (_this.data.text === ""){
        wx.showToast({
          title: '未填写内容',
          icon: 'none',
          });
        return false;
      }

      Utils.Request(`${API.SubmitTask}`, { id: _this.data.taskId, sugg: _this.data.text, img: _this.data.imgNames.join(','),userid: wx.getStorageSync('userid') }).then((res1) => {
        if (res1.statusCode === 200) {
          wx.showToast({
            title: '提交成功！',
            icon: 'success',
            success: () => {
              Utils.Request(`${API.TaskDetail}`, { id: _this.data.taskId, userid: wx.getStorageSync('userid') }).then((res2) => {
                res2.statusCode === 200 && Utils.Request(`${API.ispoint}`, { eid: _this.data.taskId, cause: 'task', userid: wx.getStorageSync('userid') }).then((res) => {
                  if (res.data.success === true) {
                    _this.toast = _this.selectComponent("#toast");
                    _this.toast.showToast('完成任务+1分', 2000, () => { });
                  }
                })
                _this.setData({ detail: res2.data });
                WxParse.wxParse('content', 'html', res2.data.content, _this, 5);
              });
              _this.setData({ text: '', imgNames:''});
              setTimeout(() => { wx.navigateBack(-1) }, 1000);
            }
          });
        }
      });
    }else wx.showToast({title: '该任务您已提交，无需重复提交!',icon: 'none',time: 2});
  },
  onLoad:function(options){
    let _this = this;
    Utils.Request(`${API.TaskDetail}`, { id: options['id'], userid: wx.getStorageSync('userid') }).then((res) => {
      console.log(res.data)
      res.statusCode === 200 && _this.setData({ detail: res.data });
      res.statusCode === 200 && _this.setData({ taskId: res.data.id });
      WxParse.wxParse('content', 'html', res.data.content, _this, 5);
    });
  }
}
Page(detailConfig);