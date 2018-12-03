const API = require("../../../../config/api.js");
const Utils = require("../../../../utils/utils.js");
var detailConfig = {
  data:{
    detail:null,
    currentId:null,
    selectId:null,
    isNoSubmit:true,
    btnText:"查看结果",
    isSeeResult:true,
    mode:1
  },
  checkboxChange:function (ev){
    ev.detail.value.length !== 0 ? this.setData({ selectId: ev.detail.value.join(',') }) : this.setData({ selectId: null });
  },
  submitSelect:function (){
    let _this = this;
    if(this.data.selectId!==null){
      if (this.data.selectId.split(",").length > this.data.mode){
        wx.showToast({
          title: '选票超出限制',
          icon: 'none'
        });
      }else{
        Utils.Request(`${API.VoteApi}`, {
          id: this.data.currentId,
          selection_id: this.data.selectId,
          userid: wx.getStorageSync('userid')
        }).then((res) => {
          res.statusCode === 200 && Utils.Request(`${API.ispoint}`, { eid: this.data.currentId, cause: 'vote', userid: wx.getStorageSync('userid') }).then((res) => {
            if (res.data.success === true) {
              _this.toast = _this.selectComponent("#toast");
              _this.toast.showToast('投票成功+1分', 2000, () => {
                setTimeout(() => { _this.setData({ isNoSubmit: false }); }, 1500);
              });
            }
          })
        });
      }
    }else{
      wx.showToast({
        title: '请选择！',
        icon:'none'
      });
    }
  },
  seeResult:function (ev){
    if (this.data.isSeeResult){
      wx.navigateTo({ url: `../result/result?id=${this.data.currentId}` });
    }else{
      wx.showToast({
        title: '投票结果未公开！',
        icon:'none',
        time:2
      });
    }
  },
  onLoad: function (options) {
    let _this = this;
    Utils.Request(`${API.VoteDetail}`, { id: options['id'], userid: wx.getStorageSync('userid') }).then((res) => {
      console.log(res.data)
      res.statusCode === 200 && _this.setData({ detail: res.data });
      res.statusCode === 200 && _this.setData({ currentId: res.data.id });
      if (res.statusCode === 200){
        if (res.data.isover === 1 || res.data.issubmit === 1){// 已结束/已投票
          _this.setData({ isNoSubmit : false});
        }
        if (res.data.is_see_results != 1){// 结果是否未公开
          _this.setData({ isSeeResult: false });
          _this.setData({ btnText: "结果未公开" });
        }
        if (res.data.mode != null) {// 非单选
          _this.setData({ mode: res.data.mode });
           this.data.mode = res.data.mode
           console.log(this.data.mode)
        }
      }
    });
  }
}
Page(detailConfig);