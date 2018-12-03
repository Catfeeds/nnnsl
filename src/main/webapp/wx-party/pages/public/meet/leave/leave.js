const API = require("../../../../config/api.js");
const Utils = require("../../../../utils/utils.js");
var leaveConfig = {
    data:{
      leaveText:null,
      nowMeetId:null,
    },
    leaveInput:function(ev){
      ev.detail.value!=="" && this.setData({ leaveText: ev.detail.value});
    },
    submitText:function(){
      let _this = this;
      Utils.Request(`${API.LeaveApi}`, {
        id: _this.data.nowMeetId,
        opinion: _this.data.leaveText,
        userid: wx.getStorageSync('userid')
      }).then((res) => {
        res.statusCode === 200 && wx.showToast({
          title: '提交成功！',
          success: ()=> {
            setTimeout(()=>{
              wx.navigateBack(-1);
            },1500);
          }
        });
      });
    },
    onLoad:function (options){
      this.setData({ nowMeetId: options['id']});
    },
    onPullDownRefresh: function () {
        this.setData({ nowMeetId: options['id'] });
        res.statusCode === 200 && wx.stopPullDownRefresh();
    }
}
Page(leaveConfig);