<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>Taara - Performance Monitoring System</title>

		<meta name="description" content="Common form elements and layouts" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--basic styles-->

		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!--page specific plugin styles-->

		<link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.custom.min.css" />
		<link rel="stylesheet" href="assets/css/chosen.css" />
		<link rel="stylesheet" href="assets/css/datepicker.css" />
		<link rel="stylesheet" href="assets/css/bootstrap-timepicker.css" />
		<link rel="stylesheet" href="assets/css/daterangepicker.css" />
		<link rel="stylesheet" href="assets/css/colorpicker.css" />

		<!--fonts-->

		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

		<!--ace styles-->
		
		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<script src="assets/js/jquery-1.10.1.min.js"></script>
		<script src="assets/js/jquery.validate.min.js"></script>
		
		<script>
					$.validator.addMethod("validateName", function(value, element, param) {
                            if (param) {
                             var regex = /^[a-zA-Z]+$/;
                              return regex.test(value);
                              } else {
                                return false;
                                     }
                 }, "Only alphabets are allowed.");
			$().ready(function() {
				 $("#loginForm").validate({
                      rules: {
                        userName: {
                          required: true,
						  validateName: true,
                          minlength: 6,
                          maxlength: 16
                        },
                        password: {
                          required: true,
                          minlength: 6,
                          maxlength: 15,
                          password: false
                        }
                      },
                      messages: {
                        userName: {
                          required: "Please enter username."
                        },
                        password: {
                          required: "Please provide a password.",
                          minlength: "Your password must be at least 6 characters long."
                        }
                      },
					  onfocusout: function(element) {
                                if ($(element).valid()) {
                                $(element).nextAll('.error').remove();
                               }

                            }
					  
                    }),

				 $("#forgotPassword").validate({
                        rules: {
                         email: {
                          required: true,
                          email: true,
                          remote: {
                            type: "post",
                            data: {
                              email: function() {
                                return $("#email").val();
                              }
                            }
                          }
						}
						},
						messages:{
						email: {
                          remote: jQuery.validator
                                  .format("{0} is already in use."),
                          required: "Please provide email address.",
                          valid: "Please enter a valid email address."
                        }
						},
						onfocusout: function(element) {
                                if ($(element).valid()) {
                                $(element).nextAll('.error').remove();
                               }

                            }
				}),
					 
				 $("#signUp").validate({
                        rules: {
                        firstName: {
                          required: true,
						  validateName: true,
                          minlength: 2,
                          maxlength: 20
                        },
                        lastName: {
                          required: true,
						  validateName: true,
                          minlength: 2,
                          maxlength: 20
                        },
						userName: {
                          required: true,
                          minlength: 6,
						  validateName: true,
                          maxlength: 16
                        },
                        email: {
                          required: true,
                          email: true,
                          remote: {
                            type: "post",
                            data: {
                              email: function() {
                                return $("#email").val();
                              }
                            }
                          }
                        },
                        password: {
                          required: true,
                          minlength: 6,
                          maxlength: 15
                          
                        },
                        confirmPassword: {
                          required: true,
                          equalTo: "#password1"
                        },
						dateofBirth: {
						required: true
						},
					     
                      },
					  messages: {
                        firstName: {
                          required: "Please enter your firstname."
                        },
                        lastName: {
                          required: "Please enter your lastname."
                        },
						userName: {
                          required: "Please enter username."
                        },
                        password: {
                          required: "Please provide a password.",
                          minlength: "Your password must be at least 6 characters long."
                        },
                        confirmPassword: {
                          required: "Please provide a password.",
                          minlength: "Your password must be at least 6 characters long.",
                          equalTo: "Please enter the same password as above."
                        },
						dateofBirth: {
						required: "Please provide date of birth."
						},
						
                        email: {
                         
                          required: "Please provide email address.",
                          valid: "Please enter a valid email address."
                        }

						
						},
						
						onfocusout: function(element) {
                                if ($(element).valid()) {
                                $(element).nextAll('.error').remove();
                               }

                            }
						
                    });
					
					
});
		</script>
		<script>
		var Agree ={
				         init: function(signUp){
						 $("#signUp").on("submit change",function(){
                          if($("#checkbox").is(":checked")){
						  $("#msg").hide();
                            return true;
                             }
                          else{
						  $("#msg").show();
                           return false;
						   }
                           });
						 }
					};
		</script>
		<script>
		 $(document).ready(function() {
		 var signUp ="signUp";
		 Agree.init(signUp);
		 
		$( "#forgetpass" ).click(function() {
		if($('#mydiv').attr('class').indexOf("newclass")==-1){
			$('#mydiv').addClass( "newclass" );
			}
			else{
			$('#mydiv').removeClass("newclass");
			}
});

             $( "#Sign" ).click(function() {
			 if($('#collapseOne').attr('class').indexOf("newclass")==-1){
			$('#collapseOne').addClass( "newclass" );
			}
			else{
			$('#collapseOne').removeClass("newclass");
			}
			
});   
		 
		 });
		</script>
		

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!--inline styles related to this page-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

	<body class="bg1">
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a href="#" class="brand">
						<small>
							<i class="icon-star"></i>
							
						</small>
					</a><!--/.brand-->					<!--/.ace-nav-->
					
					<ul class="nav nav-pills">
  <li><a href="#">Home</a></li>
  <li><a href="#">Help</a></li>
  <li><a href="#">Contact Us</a></li>
  </ul>

				</div><!--/.container-fluid-->
			</div><!--/.navbar-inner-->
		</div>

		<div class="main-container container-fluid">
			<!--<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>-->

			

			<div class="main-content">
			  <div class="page-content"><!--/.page-header-->
							<div class="box-sign-up">
							 <div class="clearfix">
             <div class="grid3">
              <span class="grey">
			  <a data-rel="tooltip" title="" data-original-title="Sign in with Facebook" class="face" href="#">
			  <i class="icon-facebook"></i></a>&nbsp;Sign in with Facebook
              </span>
             </div>

             <div class="grid3">
              <span class="grey">
			  <a data-rel="tooltip" title="" data-original-title="Sign in with Twitter" class="twwi" href="#"><i class="icon-twitter"></i></a>
			     &nbsp;Sign in with Twitter
              </span>
             </div>

             <div class="grid3">
              <span class="grey">
			   <a data-rel="tooltip" title="" data-original-title="Sign in with Linkedin" class="link" href="#">
			   <i class="icon-linkedin"></i></a> &nbsp;Sign in with Linkedin
              </span>
             </div>
			 
			 <div class="grid3">
              <span class="grey">
			   <a data-rel="tooltip" title="" data-original-title="Sign in with Google" class="stack" href="#">
			   <i class="icon-google-plus"></i></a>&nbsp;Sign in with Google
              </span>
             </div>
            </div>

							
							
							
							
							
							
	</div>
					<div class="row-fluid">
						
							<!--PAGE CONTENT BEGINS-->
                 
          						
                                <div class="span5">
									<div class="widget-box">
										<div class="widget-header">
											<h4>Log In</h4>
											<span  class="round-help-icon" data-original-title="Login">
                                            <i class="icon-info bigger-140" title="">
                                             <div class="popupv popover fade right in">
											 <div class="arrow"></div>
                                              <h3 class="popover-title">Log In</h3>
											  <div class="popover-content">Heads up! This alert needs your attention, but it's not super important.</div>
                                             </div>
                                             
                                            </i></span>
                                            
										</div>

										<div class="widget-body">
                                        <form id="loginForm" >
											<div class="widget-main"><!-- Login with Social media -->  
                                               
													<!--<legend>Form</legend>-->
                                            
                                            <div class="control-group">
														<div class="row-fluid input-prepend">
															<span class="add-on">
																<i class="icon-male"></i>
															</span>
															<input type="text" class="span11" name="userName" id="userName" placeholder="User Name">
															
														</div>
													</div>
                                            
                                            
                                            
                                            
                                                <div class="control-group">
														<div class="row-fluid input-prepend">
															<span class="add-on">
																<i class="icon-key"></i>
															</span>
															<input type="password" name="password" id="password" placeholder="Password" class="span11">
														</div>
													</div>
                                            
                                            <label class="checkbox">
												<input type="checkbox">
												<span class="lbl"> Remember me</span>
											</label>
                                            

											</div>
                                            
													<div class="form-actions center">
                                                    
                                                    
                                                    <button class="classname" type="submit"  title="Log In">
															<i class="icon-key bigger-110"></i>
															Log In
													</button>
													</div>
												</form>
										</div>
									</div>
									
															
									
									
                                    
                                    <!--forgot password-->
                                    
                                    <div class="widget-box visible-desktop" id="mydiv" style="margin-top:5%;">
										<div class="widget-header">
											<h4>Forgot Password</h4>
											<span  class="round-help-icon" data-original-title="Login">
                                            <i class="icon-info bigger-140" title="">
                                             <div class="popupv popover fade right in">
											 <div class="arrow"></div>
                                              <h3 class="popover-title">Forgot Password</h3>
											  <div class="popover-content">Heads up! This alert needs your attention, but it's not super important.</div>
                                             </div>
                                             
                                            </i></span>
                                            
										</div>

										<div class="widget-body">
										
                                        <form id="forgotPassword" >
										<div class="widget-main">
											<!-- Login with Social media -->  
                                               
													<!--<legend>Form</legend>-->
                                           <div class="control-group">
                                            <div class="row-fluid input-prepend" style="margin:10px 0 10px 0;">
															<span class="add-on">
																<i class="icon-envelope"></i>
															</span>
															<input type="text" class="span11" placeholder="Email ID" name="email" id="email">
														</div>
                                            </div>
                                             
                                        
											
                                            
                                            </div>
													<div class="form-actions center" >
                                                    
                                                    
                                                    <button class="classname" type="submit" title="Submit">
															<i class="icon-arrow-right icon-on-right bigger-110"></i>
															Submit
													</button>
													</div>
												</form>
										</div>
									</div>
                                    
									<a class="visible-phone text-center " id="forgetpass" href="javascript:void(0);">Forgot Password</a>
									<a class="visible-phone text-center " id="Sign" href="#">Sign Up</a>
                                    
								</div>
          
         
          
          <div class="span5 visible-desktop" id="collapseOne">
									<div class="widget-box">
										
                                        <div class="widget-header">
                                        
                                        
											<h4>Sign Up</h4>
                                           
											<span  class="round-help-icon" data-original-title="Login">
                                            <i class="icon-info bigger-140" title="">
                                             <div class="popupv popover fade left in">
											 <div class="arrow"></div>
                                              <h3 class="popover-title text-left">Sign Up</h3>
											  <div class="popover-content">Heads up! This alert needs your attention, but it's not super important.</div>
                                             </div>
                                             
                                            </i></span>
										</div>

										<div class="widget-body">
                                        
                                       
                                        
                                        <form id="signUp">
											<div class="widget-main">
											  <div class="control-group row-fluid">
													 <div class="input-prepend span11">
															<span class="add-on">
																<i class="icon-user"></i>
															</span>
															<input type="text" name="firstName" id="firstName" placeholder="First Name" class="span12">
														</div>
                                                        
                                                        <div class="input-prepend span11" style="margin-left:0px;">
															<span class="add-on">
																<i class="icon-user"></i>
															</span>
															<input type="text" name="lastName" id="lastName"  placeholder="Last Name" class="span12">
														</div>
											 </div>
                                            
                                            
                                            <div class="control-group row-fluid">
														<div class="input-prepend span11">
															<span class="add-on">
																<i class="icon-male"></i>
															</span>
															<input type="text" name="userName" id="userName1"  placeholder="User Name" class="span12">
														</div>
                                                        
                                                        <div class="input-prepend span11" style="margin-left:0px;">
															<span class="add-on">
																<i class="icon-envelope"></i>
															</span>
															<input type="text" name="email" id="email1"  placeholder="Email ID" class="span12">
														</div>
											 </div>
                                                  
                                            <div class="control-group row-fluid">
														<div class="input-prepend span11 margin-left">
															<span class="add-on">
																<i class="icon-key"></i>
															</span>
															<input type="password" name="password" id="password1" placeholder="Password" class="span12">
														</div>
                                                        
                                                        <div class="input-prepend span11" style="margin-left:0px;">
															<span class="add-on">
																<i class="icon-key"></i>
															</span>
															<input type="password" name="confirmPassword" id="confirmPassword"  placeholder="Confirm Password" class="span12" >
														</div>
											        </div>
                                            
                                                                                    
                                                  <div class="control-group row-fluid">
                                                    <div class="input-append span11">
                                                      <span class="add-on">
															   <i class="icon-calendar"></i>
													     </span>
														 <input type="text" data-date-format="dd-mm-yyyy" name="dateofBirth" id="id-date-picker-1" class="span12 date-picker" placeholder="Date of Birth">
													</div>
                                                        
											  </div>
                                                                                        <div class="controls">
                                              <div class="row-fluid">
											<hr style="margin:8px 0 5px 0;">
												<label class="span12">
													<input type="checkbox" name="checkbox" id="checkbox">
													<span class="lbl"> I agree to the <a href="#">terms</a> and <a href="#">privacy.</a></span>
													<div class="error" id="msg" style="display:none;">Please accept terms and privacy.</div>
												</label>
                                              </div>
                                           </div> 
                                            
			
											</div>
                                            
                                            
													<div class="form-actions center">
														<button class="classname" type="submit" title="Sign Up">
                                                        <i class="icon-arrow-right icon-on-right bigger-110"></i>
															Sign Up
															
														</button>
                                                        
                                                        
													</div>
												</form>
										</div>
									</div>
								</div>
          
                   
                   
                   
          
          
          <div class="clearfix"></div>
            

															
							

							
					
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->

				<!--/#ace-settings-container-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<!---<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>-->

		<!--basic scripts-->

		<!--[if !IE]>-->

		<!--<![endif]-->

		<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]>-->

	

		<!--<![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		
		<script src="assets/js/bootstrap.min.js"></script>

		<!--page specific plugin scripts-->

		<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->

		<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="assets/js/chosen.jquery.min.js"></script>
		<script src="assets/js/fuelux/fuelux.spinner.min.js"></script>
		<script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
		<script src="assets/js/date-time/bootstrap-timepicker.min.js"></script>
		<script src="assets/js/date-time/moment.min.js"></script>
		<script src="assets/js/date-time/daterangepicker.min.js"></script>
		<script src="assets/js/bootstrap-colorpicker.min.js"></script>
		<script src="assets/js/jquery.knob.min.js"></script>
		<script src="assets/js/jquery.autosize-min.js"></script>
		<script src="assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
		
		<script src="assets/js/bootstrap-tag.min.js"></script>
        <script src="assets/js/jquery.maskedinput.min.js"></script>

		<!--ace scripts-->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function() {
				$('#id-disable-check').on('click', function() {
					var inp = $('#form-input-readonly').get(0);
					if(inp.hasAttribute('disabled')) {
						inp.setAttribute('readonly' , 'true');
						inp.removeAttribute('disabled');
						inp.value="This text field is readonly!";
					}
					else {
						inp.setAttribute('disabled' , 'disabled');
						inp.removeAttribute('readonly');
						inp.value="This text field is disabled!";
					}
				});
			
			
				$(".chzn-select").chosen(); 
				
				$('[data-rel=tooltip]').tooltip({container:'body'});
				$('[data-rel=popover]').popover({container:'body'});
				
				$('textarea[class*=autosize]').autosize({append: "\n"});
				$('textarea[class*=limited]').each(function() {
					var limit = parseInt($(this).attr('data-maxlength')) || 100;
					$(this).inputlimiter({
						"limit": limit,
						remText: '%n character%s remaining...',
						limitText: 'max allowed : %n.'
					});
				});
				
				$.mask.definitions['~']='[+-]';
				$('.input-mask-date').mask('99/99/9999');
				$('.input-mask-phone').mask('(999) 999-9999');
				$('.input-mask-eyescript').mask('~9.99 ~9.99 999');
				$(".input-mask-product").mask("a*-999-a999",{placeholder:" ",completed:function(){alert("You typed the following: "+this.val());}});
				
				
				
				$( "#input-size-slider" ).css('width','200px').slider({
					value:1,
					range: "min",
					min: 1,
					max: 6,
					step: 1,
					slide: function( event, ui ) {
						var sizing = ['', 'input-mini', 'input-small', 'input-medium', 'input-large', 'input-xlarge', 'input-xxlarge'];
						var val = parseInt(ui.value);
						$('#form-field-4').attr('class', sizing[val]).val('.'+sizing[val]);
					}
				});
			
				$( "#input-span-slider" ).slider({
					value:1,
					range: "min",
					min: 1,
					max: 11,
					step: 1,
					slide: function( event, ui ) {
						var val = parseInt(ui.value);
						$('#form-field-5').attr('class', 'span'+val).val('.span'+val).next().attr('class', 'span'+(12-val)).val('.span'+(12-val));
					}
				});
				
				
				$( "#slider-range" ).css('height','200px').slider({
					orientation: "vertical",
					range: true,
					min: 0,
					max: 100,
					values: [ 17, 67 ],
					slide: function( event, ui ) {
						var val = ui.values[$(ui.handle).index()-1]+"";
			
						if(! ui.handle.firstChild ) {
							$(ui.handle).append("<div class='tooltip right in' style='display:none;left:15px;top:-8px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>");
						}
						$(ui.handle.firstChild).show().children().eq(1).text(val);
					}
				}).find('a').on('blur', function(){
					$(this.firstChild).hide();
				});
				
				$( "#slider-range-max" ).slider({
					range: "max",
					min: 1,
					max: 10,
					value: 2
				});
				
				$( "#eq > span" ).css({width:'90%', 'float':'left', margin:'15px'}).each(function() {
					// read initial values from markup and remove that
					var value = parseInt( $( this ).text(), 10 );
					$( this ).empty().slider({
						value: value,
						range: "min",
						animate: true
						
					});
				});
			
				
				$('#id-input-file-1 , #id-input-file-2').ace_file_input({
					no_file:'No File ...',
					btn_choose:'Choose',
					btn_change:'Change',
					droppable:false,
					onchange:null,
					thumbnail:false //| true | large
					//whitelist:'gif|png|jpg|jpeg'
					//blacklist:'exe|php'
					//onchange:''
					//
				});
				
				$('#id-input-file-3').ace_file_input({
					style:'well',
					btn_choose:'Drop files here or click to choose',
					btn_change:null,
					no_icon:'icon-cloud-upload',
					droppable:true,
					thumbnail:'small'
					//,icon_remove:null//set null, to hide remove/reset button
					/**,before_change:function(files, dropped) {
						//Check an example below
						//or examples/file-upload.html
						return true;
					}*/
					/**,before_remove : function() {
						return true;
					}*/
					,
					preview_error : function(filename, error_code) {
						//name of the file that failed
						//error_code values
						//1 = 'FILE_LOAD_FAILED',
						//2 = 'IMAGE_LOAD_FAILED',
						//3 = 'THUMBNAIL_FAILED'
						//alert(error_code);
					}
			
				}).on('change', function(){
					//console.log($(this).data('ace_input_files'));
					//console.log($(this).data('ace_input_method'));
				});
				
			
				//dynamically change allowed formats by changing before_change callback function
				$('#id-file-format').removeAttr('checked').on('change', function() {
					var before_change
					var btn_choose
					var no_icon
					if(this.checked) {
						btn_choose = "Drop images here or click to choose";
						no_icon = "icon-picture";
						before_change = function(files, dropped) {
							var allowed_files = [];
							for(var i = 0 ; i < files.length; i++) {
								var file = files[i];
								if(typeof file === "string") {
									//IE8 and browsers that don't support File Object
									if(! (/\.(jpe?g|png|gif|bmp)$/i).test(file) ) return false;
								}
								else {
									var type = $.trim(file.type);
									if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif|bmp)$/i).test(type) )
											|| ( type.length == 0 && ! (/\.(jpe?g|png|gif|bmp)$/i).test(file.name) )//for android's default browser which gives an empty string for file.type
										) continue;//not an image so don't keep this file
								}
								
								allowed_files.push(file);
							}
							if(allowed_files.length == 0) return false;
			
							return allowed_files;
						}
					}
					else {
						btn_choose = "Drop files here or click to choose";
						no_icon = "icon-cloud-upload";
						before_change = function(files, dropped) {
							return files;
						}
					}
					var file_input = $('#id-input-file-3');
					file_input.ace_file_input('update_settings', {'before_change':before_change, 'btn_choose': btn_choose, 'no_icon':no_icon})
					file_input.ace_file_input('reset_input');
				});
			
			
			
			
				$('#spinner1').ace_spinner({value:0,min:0,max:200,step:10, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
				.on('change', function(){
					//alert(this.value)
				});
				$('#spinner2').ace_spinner({value:0,min:0,max:10000,step:100, icon_up:'icon-caret-up', icon_down:'icon-caret-down'});
				$('#spinner3').ace_spinner({value:0,min:-100,max:100,step:10, icon_up:'icon-plus', icon_down:'icon-minus', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
			
			
				
				$('.date-picker').datepicker().next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
				$('#id-date-range-picker-1').daterangepicker().prev().on(ace.click_event, function(){
					$(this).next().focus();
				});
				
				$('#timepicker1').timepicker({
					minuteStep: 1,
					showSeconds: true,
					showMeridian: false
				})
				
				$('#colorpicker1').colorpicker();
				$('#simple-colorpicker-1').ace_colorpicker();
			
				
				$(".knob").knob();
				
				
				//we could just set the data-provide="tag" of the element inside HTML, but IE8 fails!
				var tag_input = $('#form-field-tags');
				if(! ( /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase())) ) 
					tag_input.tag({placeholder:tag_input.attr('placeholder')});
				else {
					//display a textarea for old IE, because it doesn't support this plugin or another one I tried!
					tag_input.after('<textarea id="'+tag_input.attr('id')+'" name="'+tag_input.attr('name')+'" rows="3">'+tag_input.val()+'</textarea>').remove();
					//$('#form-field-tags').autosize({append: "\n"});
				}
			
			
				/////////
				$('#modal-form input[type=file]').ace_file_input({
					style:'well',
					btn_choose:'Drop files here or click to choose',
					btn_change:null,
					no_icon:'icon-cloud-upload',
					droppable:true,
					thumbnail:'large'
				})
				
				//chosen plugin inside a modal will have a zero width because the select element is originally hidden
				//and its width cannot be determined.
				//so we set the width after modal is show
				$('#modal-form').on('show', function () {
					$(this).find('.chzn-container').each(function(){
						$(this).find('a:first-child').css('width' , '200px');
						$(this).find('.chzn-drop').css('width' , '210px');
						$(this).find('.chzn-search input').css('width' , '200px');
					});
				})
				/**
				//or you can activate the chosen plugin after modal is shown
				//this way select element has a width now and chosen works as expected
				$('#modal-form').on('shown', function () {
					$(this).find('.modal-chosen').chosen();
				})
				*/
			
			});
		</script>
       <div id="footer">Copyright &copy; 2014 Insonix. All rights reserved. Terms | Privacy</div>
	</body>
</html>