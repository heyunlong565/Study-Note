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
