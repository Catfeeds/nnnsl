let moreConfig = {
  toModel: function (ev) {
    switch (ev.currentTarget.dataset['page']) {
      case "news": wx.navigateTo({
        url: '../news/news',
      }); break;
      case "notice": wx.navigateTo({
        url: '../notice/notice',
      }); break;
      case "map": wx.navigateTo({
        url: '../map/map',
      }); break;
      case "clean": wx.navigateTo({
        url: '../clean/clean',
      }); break;
      case "file": wx.navigateTo({
        url: '../materials/materials',
      }); break;
      case "vote": wx.navigateTo({
        url: '../vote/vote',
      }); break;
      case "activity": wx.navigateTo({
        url: '../activity/activity',
      }); break;
      case "class": wx.navigateTo({
        url: '../class/class',
      }); break;
      case "meet": wx.navigateTo({
        url: '../meet/meet',
      }); break;
      case "shyk": wx.navigateTo({
        url: '../shyk/shyk',
      }); break;
      case "birth": wx.navigateTo({
        url: '../birth/birth',
      }); break;
      case "list": wx.navigateTo({
        url: '../list/list',
      }); break;
    }
  },
}
Page(moreConfig);