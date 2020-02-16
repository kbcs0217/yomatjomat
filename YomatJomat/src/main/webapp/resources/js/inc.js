$.fn.equalizeHeights = function() { 
var maxHeight = this.map(function( i, e ) {
return $( e ).height();
}).get();
return this.height( Math.max.apply( this, maxHeight ) );
};


function agreeCheck(){
	var checkbox = ".mem_wrap input.agreeCheck"
	var checkboxAll = ".mem_wrap input.agreeAll"
	var wrapBtn = ".mem_wrap .agree_btn_wrap"
	var wrapAll = ".mem_wrap .agree_all_wrap"
	var wrap = ".mem_wrap .agree_wrap .agree"
	var onClass = "on"
	$(checkbox).click(function(){
		var length = $(checkbox).length
		var lengthCheck = $(checkbox+":checked").length
		var lengthEss = $(checkbox+".ess").length
		var lengthCheckEss = $(checkbox+":checked.ess").length
		if(lengthEss == lengthCheckEss){
			$(wrapBtn).addClass(onClass)
		}else{
			$(wrapBtn).removeClass(onClass)
		}
		if(length == lengthCheck){
			$(wrapAll).addClass(onClass)
			$(checkboxAll).prop("checked","checked")
		}else{
			$(wrapAll).removeClass(onClass)
			$(checkboxAll).removeProp("checked","checked")
		}
		if($(this).parents(wrap).hasClass(onClass)){
			$(this).parents(wrap).removeClass(onClass)
		}else{
			$(this).parents(wrap).addClass(onClass)
		}
	})
	$(checkboxAll).click(function(){
		if($(this).prop("checked")==true){
			$(wrapBtn+","+wrapAll+","+wrap).addClass(onClass)
			$(checkbox).prop("checked","checked")
		}else{
			$(wrapBtn+","+wrapAll+","+wrap).removeClass(onClass)
			$(checkbox).removeProp("checked","checked")
		}
	})
}

function imgResize_prod(){
	$(".img_resize_prod").css("overflow","hidden");
	$(".img_resize_prod img").css("width","100%");
	function resize(){
		$(".img_resize_prod").each(function (i) {
			var imgW = $(this).width();
			$(this).height(imgW*1.143);
			$(this).children("img").css("min-height",imgW*1.143);
		});
	}
	function resize2(){
		$(".img_resize_prod").each(function (i) {
			var imgW = $(this).width();
			var imgH = $(this).children("img").height();
			if(imgW < imgH || imgW == imgH){
				var gap = (imgH - $(".img_resize_prod").height())/2
				$(this).children("img").css("margin-top","-"+gap+"px")
			}
		});
	}
	$(window).load(function(){
		resize()
		resize2()
	})
	$(window).resize(function(){
		resize()
		resize2()
	})
}

function imgResize_step(){
	$(".img_resize_step").css("overflow","hidden");
	$(".img_resize_step img").css("width","100%");
	function resize(){
		$(".img_resize_step").each(function (i) {
			var imgW = $(this).width();
			$(this).height(imgW*0.65);
			$(this).children("img").css("min-height",imgW*0.65);
		});
	}
	function resize2(){
		$(".img_resize_step").each(function (i) {
			var imgW = $(this).width();
			var imgH = $(this).children("img").height();
			if(imgW < imgH || imgW == imgH){
				var gap = (imgH - $(".img_resize_step").height())/2
				$(this).children("img").css("margin-top","-"+gap+"px")
			}
		});
	}
	$(window).load(function(){
		resize()
		resize2()
	})
	$(window).resize(function(){
		resize()
		resize2()
	})
}

function imgResize_repl(){
	$(".img_resize_repl").css("overflow","hidden");
	$(".img_resize_repl img").css("width","100%");
	function resize(){
		$(".img_resize_repl").each(function (i) {
			var imgW = $(this).width();
			$(this).height(imgW*1);
			$(this).children("img").css("min-height",imgW*1);
		});
	}
	function resize2(){
		$(".img_resize_repl").each(function (i) {
			var imgW = $(this).width();
			var imgH = $(this).children("img").height();
			if(imgW < imgH || imgW == imgH){
				var gap = (imgH - $(".img_resize_repl").height())/2
				$(this).children("img").css("margin-top","-"+gap+"px")
			}
		});
	}
	$(window).load(function(){
		resize()
		resize2()
	})
	$(window).resize(function(){
		resize()
		resize2()
	})
}
$(document).ready(function() {
    $('#summernote').summernote({
            height: 450,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: 500, 			// set maximum height of editor
            lang: 'ko-KR',
            focus: true                  // set focus to editable area after initializing summernote
    });
});
