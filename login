var form_url = 'http://ログインページのURL';
var ary_selectors = ['IDまたはメールアドレスのセレクター', 'パスワードのセレクター'];
var ary_accounts = [
	['test1@gmail.com', 'MY_PASSWORD_1'], 
	['test2@gmail.com', 'MY_PASSWORD_2'],
	['test3@gmail.com', 'MY_PASSWORD_3'],
];

if ( form_url.length > 10 && form_url.indexOf( location.hostname ) == -1 )
{
	location.href = form_url;
}

$('#my_accounts').remove();
$('body').append('<div id="my_accounts" style="position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); width:400px; height:400px; z-index:99999999; background-color:rgba(255,255,255,0.9); padding:20px; border:2px solid gray;"></div>');

var output = '';
for ( var i=0; i < ary_accounts.length; i++ )
{
	output += '<div class="button_account" style="cursor: pointer; text-align:center; background-color: #eef; margin-bottom: 4px; padding:8px;">' + ary_accounts[i][0] + '</div>';
}
output += '<a id="button_close" href="#">[ x close ]</a>';
$('#my_accounts').append(output);


if ( ary_selectors.length <= 1 ){
    for ( var i=0; i < ary_selectors.length; i++ )
	{
	  $(ary_selectors[i]).val( ary_accounts[0][i] );
	}
} else {
	$('.button_account').click(function(){
	  var idx = $(this).index();
	  for ( var i=0; i < ary_selectors.length; i++ )
	  {
	    $(ary_selectors[i]).val( ary_accounts[idx][i] );
	  }
	  $('#my_accounts').remove();
	});

	$('#button_close').click(function(){
	  $("#my_accounts").remove();
	});
}