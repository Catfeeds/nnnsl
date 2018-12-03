const API = require("../../../../config/api.js");
const Utils = require("../../../../utils/utils.js");
let detailConfig = {
  data: {
    text:"",
    imgList:[],
    imgNames:[]
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
  submitEvent: function (){
    if(this.data.imgNames.length!==0){
      if (this.data.text) {
        Utils.Request(`${API.ShykAdd}`, {
          userid: wx.getStorageSync('userid'),
          sugg: this.data.text,
          mode: 1,
          img: this.data.imgNames.join(',')
        }).then((res) => {
          res.statusCode === 200 && wx.showToast({
            title: '提交成功！',
            icon: 'success',
            success: () => {
              setTimeout(() => { wx.navigateBack(-1) }, 1000);
            }
          });
        });
      } else wx.showToast({ title: '请输入内容！', icon: 'none', duration: 1500 });
    } else wx.showToast({ title: '至少选择一张图片！', icon: 'none', duration: 1500 });
  }
}
Page(detailConfig);