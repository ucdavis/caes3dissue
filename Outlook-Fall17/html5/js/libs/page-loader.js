var oReq=new XMLHttpRequest,page,type,mimetype;oReq.addEventListener("load",downloadComplete);addEventListener("message",function(a){if(typeof a.data==="object")page=a.data.page,type=a.data.type,mimetype=type=="zoomSVG"?"image/svg+xml":"image/jpeg",oReq.open("GET",a.data.path),oReq.overrideMimeType(mimetype),oReq.send()},!1);function downloadComplete(){postMessage({page:page,type:type,message:type+" loaded for page : "+page})};