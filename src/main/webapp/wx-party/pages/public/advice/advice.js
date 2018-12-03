const API = require("../../../config/api.js");
const Utils = require("../../../utils/utils.js");
var notcieConfig = {
  data: {
    items: [
      { name: 0, value: '否', checked: true },
      { name: 1, value: '是' ,checked: false }
    ],
    adviceText:null,
    radioValue:0,
  },
  adviceInp:function (ev){
    ev.detail.value && this.setData({adviceText:ev.detail.value});
  },
  radioChange: function (ev) {
    ev.detail.value && this.setData({radioValue:ev.detail.value});
  },
  submitEvent:function(){
    let _this = this;
    if(this.data.adviceText!==null){
      if(this.data.radioValue!==null){
        Utils.Request(`${API.AdviceApi}`,{
          userid:wx.getStorageSync('userid'),
          sugg:this.data.adviceText,
          hidename:this.data.radioValue
        }).then((res)=>{
          res.statusCode === 200 && wx.showToast({
            title: '提交成功！',
            icon: 'success',
            success :()=>{
              setTimeout(()=>{wx.navigateBack(-1)},2000);
            }
          });
        });
      }else{
        wx.showToast({
          title: '请选择是否匿名！',
          icon: 'none'
        });
      }
    }else{
      wx.showToast({
        title: '请输入提议内容！',
        icon:'none'
      });
    }
  }
}
Page(notcieConfig);