const API = require("../../config/api.js");
const Utils = require("../../utils/utils.js");
let mailConfig = {
  data:{
    isNone:false,
    memberData:null,
    indexText:"",
    searchText:null,
    hiddenBtn:true,
    phoneNum:null,
    defaultImg: "../../images/head.png",
    rootImg:API.RootIMG
  },
  searchInp:function(ev){
    ev.detail.value ? this.setData({ searchText: ev.detail.value }) : this.setData({ searchText: null });
  },
  searchEvent:function (){
    let _this = this;
    if (this.data.searchText){
      Utils.Request(`${API.MailSearch}`, { userid: wx.getStorageSync('userid'), name: this.data.searchText}).then((res) => {
        res.statusCode === 200 && _this.setData({ memberData: res.data });
        res.data.length === 0 ? _this.setData({ isNone: true }) : _this.setData({ isNone: false });;
      });
    }else{
      Utils.Request(`${API.MailSearch}`, { userid: wx.getStorageSync('userid') }).then((res) => {
        res.statusCode === 200 && _this.setData({ memberData: res.data });
        res.data.length === 0 ? _this.setData({ isNone: true }) : _this.setData({ isNone: false });;
      });
    }
  },
  actionChange: function () {
    var _this = this;
    _this.setData({ hiddenBtn: !_this.data.hiddenBtn });
  }, 
  imgError: function (ev) {
    if (ev.type == "error") {
      var errorImgIndex = ev.currentTarget.dataset.errorimg,newData = this.data.memberData;
      newData[errorImgIndex].url = this.data.defaultImg;//错误图片替换为默认图片
      this.setData({ memberData: newData});
    }
  },
  showCallBtn:function(ev){
    this.setData({ hiddenBtn:false});
    ev.currentTarget.dataset['phone'] && this.setData({ phoneNum: ev.currentTarget.dataset['phone']});
  },
  hideCallBtn:function(){
    this.setData({ showBtn: false });
  },
  callEvent:function(){
    let _this = this;
    this.data.phoneNum && wx.makePhoneCall({
      phoneNumber: _this.data.phoneNum,
      success:()=>{
        _this.setData({ showBtn: false });
      }
    });
  },
  onLoad:function (){
    let _this = this;
    Utils.Request(`${API.MailSearch}`, { userid: wx.getStorageSync('userid') }).then((res) => {
      console.log(res.data)
      res.statusCode === 200 && _this.setData({ memberData: res.data });
      res.data.length === 0 ? _this.setData({ isNone: true }) : _this.setData({ isNone: false });
    });
  }
}
Page(mailConfig);