$(document).ready(function(){

    $('ul#feedback-slider').bxSlider({
        controls: true,
        pager: true,
        pagerCustom: '#bx-pager'
    });

	$('.size_trigger').fancybox({
		width: 400,
		autoHeight: true,
		autoSize: false,
		wrapCSS: 'size_popup',
		content: $('.size_content').html(),
	});

    $('.fancybox').fancybox();
    $('select').selectbox();
    $(".order-form").click(function() {
        var r = true;
        if ($(this).parent().parent().find("input[name='phone']").val() == "") {
            $(this).parent().parent().find("input[name='phone']").addClass('error');
            r = false;
        }else{
            $(this).parent().parent().find("input[name='phone']").removeClass('error');
        }
        if ($(this).parent().parent().find("input[name='email']").val() == "") {
            $(this).parent().parent().find("input[name='email']").addClass('error');
            r = false;
        }else{
            if(!isValidEmailAddress($(this).parent().parent().find("input[name='email']").val()))
            {
                $(this).parent().parent().find("input[name='email']").addClass('error');
                r = false;
            } else {
                $(this).parent().parent().find("input[name='email']").removeClass('error');
            }
        }

        if(r == true) {
            $.post ("/ajax/data.php", {
                PHONE: $(this).parent().parent().find("input[name='phone']").val(),
                EMAIL: $(this).parent().parent().find("input[name='email']").val(),
            }, function(data)
            {
                if(data.success){
                    alert(data.success);
                    $('.form-order').find('input[type=text]').val('');
                }else{
                    alert(data.error);
                }
            }, 'json');
            return false;
        }
        return false;
    });
    
    $('.dropdown > ul > li').click(function(){
		var i = $('.dropdown > ul > li').index(this)+1;
       $('#header .phone').text($('#city-list option:nth-child('+i+')').val())
    });
	var num_box = 0;
	var title = ['Базовый модуль','Столовая','Жилой модуль','Комната отдыха','Раздевалка','Штаб стройки'];
	var old_price = ['160 000','217 000','200 000','196 000','199 000','193 000'];
	var new_price = ['129 000','174 000','159 000','157 000','159 000','154 000'];
    $('.fancybox-adv').click(function(){
			var j = $('#gallery > div > div.min > ul > li ').index($(this).parent())+1;

			if(num_box == 0){
				$('#gallery .main').css('background-image', 'url(img/ecos'+j+'.png)');
				$('#gallery .main').attr('alt', 'img/ecos'+j+'_min.png');
				$('#gallery .title-old-price .title').html(title[j]);
				$('#gallery .old-price').html(old_price[j]+' р.');
				$('#gallery .sale-price').html(new_price[j]+' р.');
				$('#gallery > div > div.min > ul > li:nth-child('+j+') .title span').text(title[num_box]);
				$('#gallery > div > div.min > ul > li:nth-child('+j+') .fancybox-adv').attr('title',title[num_box]);
				$('#gallery > div > div.min > ul > li:nth-child('+j+') .fancybox-adv').attr('href','img/ecos'+num_box+'.png');
				$('#gallery > div > div.min > ul > li:nth-child('+j+') .fancybox-adv img').attr('src','img/ecos'+num_box+'_min.png');
				num_box = j;
			}else{
				if((num_box!=0)&&(num_box!=j)){
					$('#gallery .main').css('background-image', 'url(img/ecos0.png)');
					$('#gallery .main').attr('alt', 'img/ecos0_min.png');
					$('#gallery .title-old-price .title').html(title[0]);
					$('#gallery .old-price').html(old_price[0]+' р.');
					$('#gallery .sale-price').html(new_price[0]+' р.');
						for(var i = 1; i < 6; i++){
							$('#gallery > div > div.min > ul > li:nth-child('+i+') .title span').text(title[i]);
							$('#gallery > div > div.min > ul > li:nth-child('+i+') .fancybox-adv').attr('title',title[i]);
							$('#gallery > div > div.min > ul > li:nth-child('+i+') .fancybox-adv').attr('href','img/ecos'+i+'.png');
							$('#gallery > div > div.min > ul > li:nth-child('+i+') .fancybox-adv img').attr('src','img/ecos'+i+'_min.png');
						}
					num_box = 0;
					$('#gallery .main').css('background-image', 'url(img/ecos'+j+'.png)');
					$('#gallery .main').attr('alt', 'img/ecos'+j+'_min.png');
					$('#gallery .title-old-price .title').html(title[j]);
					$('#gallery .old-price').html(old_price[j]+' р.');
					$('#gallery .sale-price').html(new_price[j]+' р.');
					$('#gallery > div > div.min > ul > li:nth-child('+j+') .title span').text(title[num_box]);
					$('#gallery > div > div.min > ul > li:nth-child('+j+') .fancybox-adv').attr('title',title[num_box]);
					$('#gallery > div > div.min > ul > li:nth-child('+j+') .fancybox-adv').attr('href','img/ecos'+num_box+'.png');
					$('#gallery > div > div.min > ul > li:nth-child('+j+') .fancybox-adv img').attr('src','img/ecos'+num_box+'_min.png');
					num_box = j;
				}else{
					if(num_box==j){
						$('#gallery .main').css('background-image', 'url(img/ecos0.png)');
						$('#gallery .main').attr('alt', 'img/ecos0_min.png');
						$('#gallery .title-old-price .title').html(title[0]);
						$('#gallery .old-price').html(old_price[0]+' р.');
						$('#gallery .sale-price').html(new_price[0]+' р.');
							for(var i = 1; i < 6; i++){
								$('#gallery > div > div.min > ul > li:nth-child('+i+') .title span').text(title[i]);
								$('#gallery > div > div.min > ul > li:nth-child('+i+') .fancybox-adv').attr('title',title[i]);
								$('#gallery > div > div.min > ul > li:nth-child('+i+') .fancybox-adv').attr('href','img/ecos'+i+'.png');
								$('#gallery > div > div.min > ul > li:nth-child('+i+') .fancybox-adv img').attr('src','img/ecos'+i+'_min.png');
							}
						num_box = 0;
					}
				}
			}
		
        return false;
    });
});

function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    return pattern.test(emailAddress);
}
jQuery(function($){
    $("input[name='phone']").mask("+7 (999) 999-99-99");
});