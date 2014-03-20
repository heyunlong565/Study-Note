//返回 N个在[min,max]范围内的不重复的数
function randomN(){
  var rst ={}, arr = [];
  function createNum(min, max, n){
    if(n > (max-min+1) || max < min){
       return false; 
    }  
    var num = parseInt((Math.random()*(max-min+1) + min));
    if(rst[num] == undefined){
       rst[num] = 1;     
       arr.push(num);
    }
    if(n > arr.length){
       createNum(min,max,n); 
    }
    rst.length = 0;
    return arr; 
  }
  return createNum;
}

//实现bind事件
var bind = function(element, type, handler){
  if(element.addEventListener){
    element.addEventListener(type, handler, false);  
  }else if( element.attachEvent){
    element.attchEvent("on"+type, handler);
  }else{
    element["on"+type] = handler;
  }
};
//替换模板 template('{0} this is a {1} {2}', 'hello', 'test', '!') => hello this is a test !  
var template = function(tpl){
   if(!tpl)return false;
   var args = arguments;

   return tpl.replace(/\{\d+\}/g, function(reg){
      var num = parseInt(reg.replace(/\{/, '').replace(/\}/, ''));
      return args[num+1];
   })
   return tpl;
}
