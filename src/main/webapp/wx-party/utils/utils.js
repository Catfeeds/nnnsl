function Requset(URL){
  let data = arguments.length>1&&arguments[1]!==undefined?arguments[1]:{};
  let method = arguments.length>2&&arguments[2]!==undefined?arguments[2]:'GET';
  let header = arguments.length>3&&arguments[3]!==undefined?arguments[3]:{'Content-Type':'application/x-www-form-urlencoded;charset=UTF-8'};
  return new Promise(function(resolve,reject){
    wx.request({
      url: URL,data: data,method: method,header: header,
      success: function (res) {resolve(res) },
      fail: function (res) {reject(res)}
    });
  });
}
function UpLoad(URL,FilePath,Name,FormData,CallBack) {
  wx.uploadFile({
    url: URL,
    filePath: FilePath,
    name: Name,
    header: {'content-type': 'multipart/form-data'},
    formData: FormData,
    success: (res)=>{
      if(res.statusCode===200){
        return typeof CallBack == "function" && CallBack(res);
      }else{
        return typeof CallBack == "function" && CallBack(false);
      }
    },fail:()=>{
      return typeof CallBack == "function" && CallBack(false);
    }
  })
}  
module.exports={
  Request: Requset,
  UpLoad: UpLoad
}