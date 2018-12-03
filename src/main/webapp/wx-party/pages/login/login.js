const API = require("../../config/api.js");
const Utils = require("../../utils/utils.js");
var loginConfig = {
  data: {
    showCode:false,
    account:null,
    password:null
  },
  onLoad: function () {
    wx.removeStorage({
      key: 'userid'
    })
    wx.login({
      success: function (wxRes) {
        if (wxRes.code) {
          Utils.Request(`${API.wxLogin}`, { "code": wxRes.code, }, "POST").then((res) => {
            var userid = res.data.userid;
            if (userid != 'erro') {
              wx.showToast({
                title: '登录成功！',
                icon: 'success',
                duration: 1000,
                success: () => {
                  wx.setStorageSync('userid', userid);
                  setTimeout(() => {
                    wx.switchTab({ url: '../index/index' });
                  }, 1000);
                }
              });
            } else {
              wx.showToast({
                title: '登录失败，请绑定身份！',
                icon: 'none',
                duration: 2000,
                success: () => {
                  wx.setStorageSync('openid', res.data.openid);
                  setTimeout(() => {
                    wx.navigateTo({ url: '../regist/regist' });
                  }, 1000);
                }
              });
            }
          });
        }
      }
    });
  },
  // accountInput: function (ev){
  //   this.setData({ account:ev.detail.value });
  // },
  // formSubmit: function (ev) {
  //   Utils.Request(`${API.FormId}`, { "formId":ev.detail.formId,}, "POST").then((formRes) => {
  //     if (formRes.data){
  //       Utils.Request(`${API.FormId}`, {
  //         "formId": formRes.data.formId,
  //         "template_id": formRes.data.moban,
  //         "openid": formRes.data.openid
  //       }, "POST").then((res) => {
  //         console.log(res);
  //       });
  //     }
  //   });
  // },
  // passwordInput:function (ev){
  //   this.setData({
  //     password: ev.detail.value,
  //     showCode: ev.detail.value !== ""
  //   });
  // },
   
  wxLogin: function (ev) {
    wx.login({
      success: function (wxRes) {
        console.log("123")
        wx.removeStorage({
          key: 'userid'          
        })
        if (wxRes.code) {
          Utils.Request(`${API.wxLogin}`, { "code": wxRes.code, }, "POST").then((res) => {
            var userid = res.data.userid;
            if (userid != 'erro') {
              wx.showToast({
                title: '登录成功！',
                icon: 'success',
                duration: 2000,
                success: () => {
                  console.log("123")
                  wx.setStorageSync('userid', userid);
                  setTimeout(() => {
                    wx.switchTab({ url: '../index/index' });
                  }, 2000);
                }
              });
            } else {
              wx.showToast({
                title: '登录失败，请绑定身份！',
                icon: 'none',
                duration: 2000,
                success: () => {
                  wx.setStorageSync('openid', res.data.openid);
                  setTimeout(() => {
                    wx.navigateTo({ url: '../regist/regist' });
                  }, 1000);
                }
              });
            }
          });
        }
      }
    });
  },
  // loginEvent:function (){
  //   console.log("123")
  //   if (this.data['account']!==null&&this.data['password']!==null){
  //     let _this = this,
  //         account = this.data['account'],
  //         password = this.data['password'];
  //     Utils.Request(`${API.Login}`, { "account": account, "password": password }, "POST").then((res) => {
  //       if (res.statusCode === 200 && res.data.success === true) {
  //         console.log("123")
  //         wx.showToast({
  //           title: '登录成功！',
  //           icon: 'success',
  //           duration: 2000,
  //           success: ()=> {
              
  //             wx.setStorageSync('userid', res.data['message']);
  //             setTimeout(()=>{
  //               wx.switchTab({url: '../index/index'});
  //             },1000);
  //           }
  //         });
  //       }
  //     });
  //   } else wx.showToast({title: '请输入正确的手机号或密码',icon: 'none',duration: 2000});
  // }
}
Page(loginConfig);