<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" session="false" %>


<%@ include file="../inc/top.jsp" %>
<%! 
String dp1 = "1";
String dp2 = "1"; 
%>

<div class="doc0">
<div class="box1">
	<div class="rp_w_top">
		<div class="rp_w_t_tit">
			<p class="tit">레시피 등록</p> 
			<a class="info_btn" href=""><!-- 등록안내 팝업창 만들기 -->
				<span class="info_btn_in">
					<i class="xi xi-restaurant"></i>
					<span class="tt">레시피 등록안내</span>
				</span>
			</a>
		</div>
		<div class="rp_w_t_wrap">
			<ul class="rp_main_info">
				<li>
					<ul class="rp_main_info_in">
						<li class="t1">레시피 제목</li>
						<li class=""><input type="text" class="" placeholder="예) 중독성있는 마약 계란장 만들기"></li>
					</ul>
				</li>
				<li>
					<ul class="rp_main_info_in">
						<li class="t1">요리소개</li>
						<li class=""><textarea class="text_area" placeholder="요리후기와 댓글을 남겨주세요."></textarea></li>
					</ul>
				</li>
				<li>
					<ul class="rp_main_info_in">
						<li class="t1">카테고리</li>
						<li class="select_rp">
							<span>
								<select class="search_select ">
						            <option value="">종류별 선택</option>
						            <option>1</option>
						            <option>2</option>
						        </select>
							</span>
							<span>
								<select class="search_select">
						            <option value="">종류별 선택</option>
						            <option>1</option>
						            <option>2</option>
						        </select>
							</span>
							<span>
								<select class="search_select">
						            <option value="">종류별 선택</option>
						            <option>1</option>
						            <option>2</option>
						        </select>
							</span>
							<span>
								<select class="search_select">
						            <option value="">종류별 선택</option>
						            <option>1</option>
						            <option>2</option>
						        </select>
							</span>
							<p class="rp_w_t_ps"><i class="xi xi-info-o"></i> 분류를 바르게 설정해주시면, 이용자들이 쉽게 레시피를 검색할 수 있어요.</p>
						</li>
					</ul>
				</li>
				<li>
					<ul class="rp_main_info_in">
						<li class="t1">요리정보</li>
						<li class="select_rp">
							<span>
								<select class="search_select">
						            <option value="">인원 선택</option>
						            <option>1</option>
						            <option>2</option>
						        </select>
							</span>
							<span>
								<select class="search_select">
						            <option value="">시간 선택</option>
						            <option>1</option>
						            <option>2</option>
						        </select>
							</span>
							<span>
								<select class="search_select">
						            <option value="">난이도 선택</option>
						            <option>1</option>
						            <option>2</option>
						        </select>
							</span>
						</li>
					</ul>
				</li>
				<li>
					<ul class="rp_main_info_in">
						<li class="t1">태그</li>
						<li class=""><input type="text" class="">
						<p class="rp_w_t_ps"><i class="xi xi-info-o"></i>주재료, 목적, 효능, 대상 등을 태그로 남겨주세요. 예) 돼지고기, 다이어트, 감기예방, 초간단</p>	
						</li>
					</ul>
				</li>
			</ul>
			<p class="main_photo">
				<span class="main_photo1 img_resize_repl"><img src="/images/main_camera.jpg" onclick=""></span>
			</p>
		</div>
	</div>
	<div class="rp_w_ingre">
		<p class="rp_w_t_ps"><i class="xi xi-info-o"></i> 재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</p>
		<div id="divMaterialGroupArea">
			<!-- <div class="rp_w_ingre_in">
				<div class="rp_w_ingre_in_l">
					<p class="move_wrap">
						<a class="move_btn" href="#"><i class="xi-catched xi"></i></a>
						<input type="text" class="rp_ingre_ip" placeholder="예) 재료">
					</p>
					<div class="w_ingre_l_btm">
						<button type="button" class="btn1"><i class="xi-upload xi"></i>한번에 넣기</button>
						<button type="button" class="btn2"><i class="xi-trash-o xi"></i>재료묶음 삭제</button>
					</div>
				</div>
				<ul class="rp_w_ingre_in_r">
					<li>
						<div class="w_ingre_r_in move_wrap">
							<a class="move_btn" href="#"><i class="xi-catched xi"></i></a>
							<input type="text" class="rp_ingre_ip" placeholder="예) 양배추"/>
							<input type="text" class="rp_ingre_ip" placeholder="예) 1/4개"/>
							<a href="" class="del_btn_s"><i class="xi xi-close-circle"></i></a>
						</div>
					</li>
					<li>
						<div class="w_ingre_r_in move_wrap">
							<a class="move_btn" href="#"><i class="xi-catched xi"></i></a>
							<input type="text" class="rp_ingre_ip" placeholder="예) 소고기">
							<input type="text" class="rp_ingre_ip" placeholder="예) 100g">
							<a href="" class="del_btn_s"><i class="xi xi-close-circle"></i></a>
						</div>
					</li>
					<li>
						<div class="w_ingre_r_in move_wrap">
							<a class="move_btn" href="#"><i class="xi-catched xi"></i></a>
							<input type="text" class="rp_ingre_ip" placeholder="예) 설탕">
							<input type="text" class="rp_ingre_ip" placeholder="예) 2스푼">
							<a href="" class="del_btn_s"><i class="xi xi-close-circle"></i></a>
						</div>
					</li>
				</ul>
				<div class="ingre_in_r0">
					<button type="button" class="btn_add"><i class="xi-plus-circle-o xi"></i> 재료추가</button>
				</div>
			</div> -->
		</div>	
		<div class="rp_w_ingre_btn">
			<p class="tt">양념, 양념장, 소스, 드레싱, 토핑, 시럽, 육수 밑간 등으로 구분해서 작성해주세요.</p>
			<button type="button" class="btn" onclick="addMaterialGroup('',[],null,'1')"><i class="xi-plus-min xi"></i>재료묶음 추가</button>
		</div>
	</div>		
	<div class="rp_w_ingre">
		<p class="tit">요리순서</p>
		<p class="rp_w_t_ps"><i class="xi xi-info-o"></i> 요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.</p>
		<div id="divStepArea"></div>
		<div id="divStepTemplate" style="display:none">
			<div class="rp_w_step" id="divStepItem_STEP">
				<p class="rp_w_step_l" id="divStepNum_STEP"><span>Step.__STEP</span></p>
				<div class="rp_w_step_r">
					<span class="w_step_r1" id="divStepText_STEP">
						<textarea class="text_area" placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요."></textarea>
					</span>
					<span class="w_step_r2" id="divStepUpload_STEP">
						<a href="" class="btn img_resize_repl" id="divStepPhotoBox_STEP"><img src="/images/rp_rep_noimg.jpg"></a>
					</span>
					<a href="javascript:delStep(__STEP)" class="del_btn_s"><i class="xi xi-close-circle"></i></a>
				</div>
			</div> 
		</div> 
		<div class="ingre_in_r0">
			<button type="button" class="btn_add" onclick="addStep()"><i class="xi-plus-circle-o xi"></i> 순서추가</button>
		</div>
		<!-- 요리완성사진 파트 만들기 : view에 롤링되는 부분 같이 추가 -->
	</div>	
	<div class="rp_w_btn">
		<a class="btn1">저장</a>
		<a class="btn2">저장 후 공개</a>
		<a class="btn3" onclick="history.back();">취소</a>
	</div>
	
</div>
</div>
<script type="text/javascript">
imgResize_repl();

$(window).load(function(){
	$(".rp_list_btm .rp_list_in .rp_list_in1").equalizeHeights();
	addMaterialGroup('재료',[]);
	addStep();
})

function addMaterialGroup(title,json,group_idx,isManualAdd) {
	var is_exist_group = false;
	if (group_idx && $("#divMaterialArea_"+group_idx).length) {
		//존재함
		is_exist_group = true;
	} else {
		 
		if (!group_idx) group_idx = 0;
		$("[id^=divMaterialArea_]").each(function() {
            var idx = parseInt($(this).prop('id').replace('divMaterialArea_',''),10);
            group_idx = Math.max(group_idx,idx);
        });
        group_idx++;
      
	} 
	if (is_exist_group) {
		var prev_title = $("#liMaterialGroup_"+group_idx+" [id=material_group_title_"+group_idx+"]").val();
		if ((prev_title == '' || prev_title == '재료') && title != '') {
			$("#liMaterialGroup_"+group_idx+" [id=material_group_title_"+group_idx+"]").val(title);
		}
	} else {
		
		var str = '';
        str += '<div class="rp_w_ingre_in" id="liMaterialGroup_'+group_idx+'">';
        str += '<div class="rp_w_ingre_in_l">';
		str += '<p class="move_wrap">';
        str += '<a class="move_btn" href="#"><i class="xi-catched xi"></i></a>';
		str += '<input type="text" placeholder="예) 재료" name="material_group_title_'+group_idx+'" id="material_group_title_'+group_idx+'value="'+title+'" class="rp_ingre_ip">';
		str += '</p>';
        str += '<div class="w_ingre_l_btm">';
		str +=	'<button id="btnAutoMaterialModal" data-toggle="modal" data-target="#divAutoMaterialModal" type="button" data-group_idx="'+group_idx+' class="btn1"><i class="xi-upload xi"></i>한번에 넣기</button>'; 
		str += '<button type="button" class="btn2" onclick="delMaterialGroup('+group_idx+')"><i class="xi-trash-o xi"></i>재료묶음 삭제</button>';
        str += '</div>';
		str += '</div>';
        str += '<ul class="rp_w_ingre_in_r" id="divMaterialArea_'+group_idx+'"></ul>';
        str += '<div class="ingre_in_r0"><button type="button" onclick="addMaterial('+group_idx+')" class="btn_add"><i class="xi-plus-circle-o xi"></i> 재료추가</button></div>';
        str += '</div>';

        $(str).appendTo("#divMaterialGroupArea");
	}
 
    for (var i=0; i<json.length; i++) {
		addMaterial(group_idx,json[i],'');
	}
	if (group_idx == 1) {
		if ($("#divMaterialArea_" + group_idx + " [id^=liMaterial_" + group_idx + "_]").length < 3) {
			for (var j = i; j < 3; j++) {
				addMaterial(group_idx, [], '');
			}
		}
	} else {
		if ($("#divMaterialArea_" + group_idx + " [id^=liMaterial_" + group_idx + "_]").length < 3) {
			for (var j = i; j < 2; j++) {
				addMaterial(group_idx, [], '');
			}
		}
	}
	//$("#divMaterialGroupArea").sortable({
    //    handle: $('.btn-lineup')
    //});
	if (isManualAdd && isManualAdd == '1') {
        $("#material_group_title_"+group_idx).focus();
    }

}
function delMaterialGroup(group_idx) {
	var cnt = 0;
	$("#divMaterialArea_"+group_idx+" [id^=cok_material_nm_"+group_idx+"_]").each(function() {
		if ($.trim($(this).val()) != '') {
			cnt++;
		}
	});
	var isOK = true;
	if (cnt > 0) {
		if(!confirm('['+$("#material_group_title_"+group_idx).val()+']을 삭제하시겠습니까?')) {
			isOK = false;
		}
	}
	if (isOK) {
		if ($("#divMaterialGroupArea [id^=liMaterialGroup_]").length == 1) {
            $("#liMaterialGroup_"+group_idx+" [id=material_group_title_"+group_idx+"]").val('');
            $("#divMaterialArea_"+group_idx+" [id^=liMaterial_"+group_idx+"_]").each(function(idx,obj) {
                var step = $(this).prop('id').replace('liMaterial_'+group_idx+'_','');
                if (idx < 3) {
                    $("#liMaterial_"+group_idx+"_"+step+" [id=cok_material_nm_"+group_idx+"_"+step).val('');
                    $("#liMaterial_"+group_idx+"_"+step+" [id=cok_material_amt_"+group_idx+"_"+step).val('');
                } else {
                    $("#liMaterial_"+group_idx+"_"+step).remove();
                }
            });
        } else {
            $("#divMaterialGroupArea [id=liMaterialGroup_"+group_idx+"]").fadeOut(200,function() {
                $(this).remove();
            });
        }
	}
}
function addMaterial(group_idx, init_json, prev_step){
    var step = 0;
    $("#divMaterialArea_"+group_idx+" [id^=liMaterial_"+group_idx+"_]").each(function(){
        var tmp = $(this).prop('id').replace('liMaterial_'+group_idx+'_', '');
        var tmp_step = parseInt(tmp, 10);
        step = Math.max(step, tmp_step);
    });
    step++;
    //alert(step);
    //var w1 = ($("#cok_reg_type").val() == 'edit') ? 180 : 330;
	//var w2 = ($("#cok_reg_type").val() == 'edit') ? 140 : 280;
    var str = '';
	str += '<li id="liMaterial_'+group_idx+'_'+step+'"><div class="w_ingre_r_in move_wrap">';
	str += '<a class="move_btn" href="#"><i class="xi-catched xi"></i></a>';
    str += '<input type="text" name="cok_material_nm_'+group_idx+'[]" id="cok_material_nm_'+group_idx+'_'+step+'"  class="rp_ingre_ip" placeholder="예) 양배추"/>';
    str += '<input type="text" name="cok_material_amt_'+group_idx+'[]" id="cok_material_amt_'+group_idx+'_'+step+'" class="rp_ingre_ip" placeholder="예) 1/4개"/>';
    str +=  '<a id="btnMaterialDel_'+group_idx+'_'+step+'" href="javascript:delMaterial('+group_idx+','+step+')" class="del_btn_s"><i class="xi xi-close-circle"></i></a>';
	str += '</div></li>';

    if (typeof prev_step == 'undefined' || prev_step === null || prev_step == 0) {
        $(str).appendTo('#divMaterialArea_'+group_idx);
    }
    else {
        $(str).insertAfter("#liMaterial_"+group_idx+"_" + prev_step);
    }

    /*if (typeof init_json !== 'undefined' && init_json !== null && init_json['mat_nm_material']) {
        $("#divMaterialArea_"+group_idx+" [id=cok_material_nm_" + group_idx + "_" + step + "]").val(init_json['mat_nm_material']);
    } else {
        $("#divMaterialArea_"+group_idx+" [id=cok_material_nm_" + group_idx + "_" + step + "]").attr('placeholder','예) '+_MATERIAL_SAMPLE[(step-1)%_MATERIAL_SAMPLE.length]['mat_nm_material']);
    }
    if (typeof init_json !== 'undefined' && init_json !== null && (init_json['mat_no_amount'] || init_json['mat_tx_amount'])) {
		$("#divMaterialArea_"+group_idx+" [id=cok_material_amt_" + group_idx + "_" + step + "]").val((init_json['mat_no_amount'] ? init_json['mat_no_amount'] : '')+(init_json['mat_tx_amount'] ? init_json['mat_tx_amount'] : ''));
    } else {
        $("#divMaterialArea_"+group_idx+" [id=cok_material_amt_" + group_idx + "_" + step + "]").attr('placeholder','예) '+_MATERIAL_SAMPLE[(step-1)%_MATERIAL_SAMPLE.length]['mat_nm_amount']);
    }

    $("#divMaterialArea_"+group_idx+" [id=liMaterial_" + group_idx + "_" + step + "]").mouseover(function(){
        $(this).find('.btn-del').show();
    }).mouseout(function(){
        $(this).find('.btn-del').hide();
    });

    $("#divMaterialArea_"+group_idx).sortable({
        handle: $('.btn-lineup')
    });*/
    //$( "ul, li" ).disableSelection();
}
function delMaterial(group_idx,step) {
    $("#divMaterialArea_"+group_idx+" [id=liMaterial_"+group_idx+"_"+step+"]").fadeOut(200,function() {
        $(this).remove();
    });
}
function addStep(prev_step, init_json){
    var step = 0;
    //var obj_step = $(obj).parent().prop('id').replace('divStepBtn_','');
    $("#divStepArea [id^=divStepItem_]").each(function(){
        var tmp = $(this).prop('id').replace('divStepItem_', '');
        var tmp_step = parseInt(tmp, 10);
        step = Math.max(step, tmp_step);
    });
    step++;
    //alert(step);
    var str = $("#divStepTemplate").html().replace(/__STEP/g, step);
    var str = str.replace(/_STEP/g, '_' + step);


    if (typeof prev_step == 'undefined' || prev_step === null || prev_step == 0) {
        $(str).appendTo('#divStepArea');
    }
    else {
        $(str).insertAfter("#divStepItem_" + prev_step);
    }
}
function delStep(step){
	$("#divStepArea [id=divStepItem_" + step + "]").fadeOut(200,function() {
		$("#divStepArea [id=divStepItem_" + step + "]").remove();
		remakeStepNumber();
	});
}

</script>

<%@ include file="../inc/footer.jsp" %>
