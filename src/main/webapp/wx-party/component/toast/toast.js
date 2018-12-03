Component({
  options: {
    multipleSlots: true
  },
  properties: {
    // 弹窗内容
    content: {
      type: String,
      value: '弹窗内容'
    }
  },
  data: {
    isShow: false
  },
  methods: {
    showToast:function(text,time,callback){
      let _this = this;
      this.setData({ isShow: true,content: text});
      time = time||3000;
      setTimeout(()=>{
        _this.setData({isShow: false,content: ""});
        callback && typeof callback === 'function' && callback();
      }, time);
    }
  }
});
