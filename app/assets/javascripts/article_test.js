function add_update_article(name)
{
	var name = $(name);
    var form_id = name.attr('form-id');

	$('.alert').hide();

	var form = $('#'+form_id)[0]; 
	var formData = new FormData(form);

	if(form_id == "article_add_form")
	{
		var ajxurl = '/add_article';
	}
	else
	{
		var ajxurl = '/update_article';	
	}

    $.ajax({
        type: 'post',
        url: ajxurl,
        contentType: false,
        processData: false,  
        data: formData,          
        success: function(data) {     

        	if(data.status == false)
        	{
        		var er = data.errors;
        		$('#errors').show();
        		$.each(er ,function( index,msg ) 
        		{				
				    $('#errors ul').append('<li>' + msg + '</li>');
				});        		
        	}
        	
        	// else
        	// {
	       	// 	// 	$("#article_add_form")[0].reset();

        	// 	// 	$('#suc_msg').show();
        	// 	// 	$('#suc_msg').html('Article Added Successfully! Page will be reload in 3 second.');
        	// 	// 	setTimeout(function(){ location.href = data.redirect_to; }, 2000);
        	// }
        }
    });
}