const API = require("../../config/api.js");
const Utils = require("../../utils/utils.js");
var registConfig = {
    data:{
      nameText:"",
      phoneText:"",
      IdText:"",
      pwdText:"",
      rePwdText:"",
      codeText:"",
      userImg:"",
      fileName:"",
      openid:""
    },
    nameInput: function (ev) {
      this.setData({ nameText: ev.detail.value });
    },
    phoneInput: function (ev) {
      this.setData({ phoneText: ev.detail.value });
      console.log(phoneText)
    },
    IdInput: function (ev) {
      this.setData({ IdText: ev.detail.value });
    },
    pwdInput: function (ev) {
      this.setData({ pwdText: ev.detail.value });
    },
    rePwdInput: function (ev) {
      this.setData({ rePwdText: ev.detail.value });
    },
    codeInput: function (ev) {
      this.setData({ codeText: ev.detail.value });
    },
    registEvent:function (){
      if (this.data.nameText && this.data.phoneText && this.data.IdText && this.data.pwdText && this.data.rePwdText && this.data.codeText){
        let phoneReg = /^[1][3,4,5,6,7,8,9][0-9]{9}$/;
        if (phoneReg.test(this.data.phoneText)){
          let idReg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
          if (idReg.test(this.data.IdText)) {
            // let pwdReg = /^(?=\d+)(?!([\d])\1{5})[\d]{6,}$/;
            // if (pwdReg.test(this.data.pwdText) && this.data.pwdText !== '123456' && this.data.pwdText !== '654321') {
              if (this.data.pwdText === this.data.rePwdText){
                // if (this.data.codeText.length===6){
                  if (this.data.fileName){
                    let _this = this;
                    Utils.Request(`${API.Regist}`, {
                      name: _this.data.nameText,/* 姓名 */
                      tel: _this.data.phoneText,/* 手机号 */
                      idcard: _this.data.IdText,/* 身份证号 */
                      avatar: _this.data.fileName,/* 头像 */
                      password: _this.data.pwdText,/* 密码 */
                      vcode: _this.data.codeText,/* 验证码 */
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
                  } else wx.showToast({ title: '请上传您的头像！', icon: 'none', duration: 2000 });
                // } else wx.showToast({ title: '测试阶段请输入任意6位验证码！', icon: 'none', duration: 2000 });
              } else wx.showToast({ title: '两次输入密码不一致！', icon: 'none', duration: 2000 });
            // } else wx.showToast({ title: '密码不符合要求或过于简单！', icon: 'none', duration: 2000 });
          } else wx.showToast({ title: '请输入有效身份证号！', icon: 'none', duration: 2000 });
        } else wx.showToast({ title: '请输入有效手机号！', icon: 'none', duration: 2000 });
      } else wx.showToast({ title: '请填写所有信息', icon: 'none', duration: 2000});
    },
    changeImg: function () {
      var _this = this;
      wx.chooseImage({
        count: 1, // 默认9  
        sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有  
        sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有  
        success: function (fileRes) {
          var tempFilePath = fileRes.tempFilePaths[0];
          Utils.UpLoad(`${API.UpLoadApi2}`, tempFilePath, 'file', {}, function (res) {
            if (res.statusCode === 200) {
              wx.showToast({ title: '上传成功！', icon: 'success', duration: 2000 });
              _this.setData({ userImg: tempFilePath });
              _this.setData({ fileName: JSON.parse(res.data)['fileName'] });
            } else {
              wx.showToast({ title: '上传失败！', icon: 'error', duration: 2000 });
            }
          });
        }
      })
    },
}
Page(registConfig);
