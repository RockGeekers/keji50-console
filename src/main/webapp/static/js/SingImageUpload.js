//重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
      var _editor = UE.getEditor('upload_ue');
      _editor.ready(function () {
          //设置编辑器不可用
          _editor.setDisabled();
          //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
          _editor.hide();
          //侦听图片上传
         _editor.addListener('beforeInsertImage', function (t, arg) {
             //将地址赋值给相应的input,只去第一张图片的路径
             $("#image").attr("value", arg[0].src);
            //图片预览
            $("#preview").attr("src", arg[0].src);
        });
          
    });
     //弹出图片上传的对话框
    function upImage() {
         var myImage = _editor.getDialog("insertimage");
         myImage.open();
     }

  //重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
    var roll_editor = UE.getEditor('QQimage');
    roll_editor.ready(function () {
        //设置编辑器不可用
    	roll_editor.setDisabled();
        //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
    	roll_editor.hide();
        //侦听图片上传
    	roll_editor.addListener('beforeInsertImage', function (t, arg) {
           //将地址赋值给相应的input,只去第一张图片的路径
    		var str="";
    		for(var i=0;i<arg.length;i++){
    			if(i==arg.length-1){
    				str+=arg[i].src;
    			}else{
    				str+=arg[i].src+",";
    			}
    		}
           $("#rollImage").attr("value", str);
          //图片预览
          $("#preview").attr("src", arg[0].src);
      });
        
  });
   //弹出图片上传的对话框
  function upRollImage() {
       var myImage = roll_editor.getDialog("insertimage");
       myImage.open();
   }