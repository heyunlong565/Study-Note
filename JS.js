//返回 N个在[min,max]范围内的不重复的数
var createRandom = function(){
  var rst =[], arr = [];
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
    return arr; 
  }
  
  return createNum;
};
//实现bind
var bind = function(element, type, handler){
  if(element.addEventListener){
    element.addEventListener(type, handler, false);  
  }else if( element.attachEvent){
    element.attchEvent("on"+type, handler);
  }else{
    element["on"+type] = handler;
  }
};
