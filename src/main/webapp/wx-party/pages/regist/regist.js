const API = require("../../config/api.js");
const Utils = require("../../utils/utils.js");
let APP = getApp();
var registConfig = {
    data:{
      phoneText:"",
      codeText:"",
      openid:""
    },
    phoneInput: function (ev) {
      this.setData({ phoneText: ev.detail.value });
    },
    codeInput: function (ev) {
      this.setData({ codeText: ev.detail.value });
    },
    registEvent:function (ev){
      let phoneReg = /^[1][3,4,5,6,7,8,9][0-9]{9}$/,
        avatarUrl = ev.detail.userInfo?ev.detail.userInfo.avatarUrl:'';
      if (phoneReg.test(this.data.phoneText)){
        let _this = this;
        Utils.Request(`${API.Regist}`, {
          tel: _this.data.phoneText,/* 手机号 */
          vcode: _this.data.codeText,/* 验证码 */
          avatar: avatarUrl,/* 用户头像 */
          openid:wx.getStorageSync('openid')
        },'POST').then((res) => {
          if (res.statusCode===200){
            let userid=res.data['message'];
            wx.showToast({
              title: '身份绑定成功！',
              icon: 'success',
              duration: 2000,
              success: () => {
                wx.setStorageSync('userid', userid);
                setTimeout(() => {
                  wx.switchTab({ url: '../index/index' });
                }, 2000);
              }
            });
          } else wx.showToast({ title: '身份绑定失败！', icon: 'error', duration: 2000 });
        });
      } else wx.showToast({ title: '请输入有效手机号！', icon: 'none', duration: 2000 });
    }
}
Page(registConfig);