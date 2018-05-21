 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<!-- For datepicker   -->

  
 
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  	<!--  <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.min.js"></script> -->
    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables.css" media="screen, projection">
    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables_themeroller.css" media="screen, projection">
    <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">

	
	<style>
	

@media (min-width: 992px) {
	
/*table {
	
	border-style: none;
	}*/

table#example thead th {
	text-transform: uppercase;
	background-color:#FF9933;
	text-align: center;
	font-size: 12px;
}

table#example tr:hover{ background-color:light-grey; color:black;}

table #example{
	text-align: right;
	font-size: 12px
}

table#example tbody tr, td {
	border: 1px solid black;
}
table#example tbody td {
	min-width: 100px;
}

table#example input[type=text] {
	border: none;
	background: transparent;
}


body {
	font-size: 100%;
	line-height: 1.6875;
	font-family: sans-serif;
	padding: 15px;
	margin-bottom: 2%;
	margin: 2%;
	/*border:1px solid grey;
       overflow:hidden; */
	transform: scale(1.1);
	transform-origin: 10% 10%;
	background-color: none;
	border: 5px solid transparent;
	height: 75%;
	width: 75%;
}

p,a {
	display: inline;
	padding: 15px;
	padding-bottom: 30px;
}

a.buttonlike {
	background: #eee;
	text-decoration: none;
	color: #333;
	font-family: Arial, sans-serif;
	font-size: 11px;
	font-weight: bold;
	padding: 3px 5px;
	border: 1px solid #aaa;
	border-radius: 3px;
	cursor: default;
}

.buttonlike a:link,.buttonlike a:visited {
	/* remove the offending underline */
	text-decoration: none;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.4);
	color: #FFFFFF;
}

a:hover {
	background-color: #f2f2f2;
	border-color: #888;
	box-shadow: 0 0 2px #ccc;
}

a:active {
	vertical-align: -1px;
}

#ui-datepicker-div {
	font-size: 11px;
}

.ui-tooltip
{
    font-size:10pt;
    font-family:Calibri;
     max-width: 400px;
}

.wd100 {
    width:50px;
}
.iffyTip {
    overflow:hidden;
    white-space:nowrap;
    text-overflow:ellipsis;
}
}

</style>

  <script>
  
  
  function moveCaretToEnd(el) {
	    if (typeof el.selectionStart == "number") {
	        el.selectionStart = el.selectionEnd = el.value.length;
	    } else if (typeof el.createTextRange != "undefined") {
	        el.focus();
	        var range = el.createTextRange();
	        range.collapse(false);
	        range.select();
	    }
	}
  
  
  $(function() {
    $( "input#datepicker" ).datepicker({
    	 dateFormat: 'yy-mm-dd',
    	 minDate: getFormattedDate(new Date())
    });
  });
  
  
  function getFormattedDate(date) {
	    var day = date.getDate();
	    var month = date.getMonth() + 1;
	    var year = date.getFullYear().toString().slice(2);
	    return day + '-' + month + '-' + year;
	}
  
  function setCursorAtTheEnd(aTextArea,aEvent) {
	    var end=aTextArea.value.length;
	    if (aTextArea.setSelectionRange) {
	        setTimeout(aTextArea.setSelectionRange,0,[end,end]);  
	    } else { // IE style
	        var aRange = aTextArea.createTextRange();
	        aRange.collapse(true);
	        aRange.moveEnd('character', end);
	        aRange.moveStart('character', end);
	        aRange.select();    
	    }
	    aEvent.preventDefault();
	    return false;
	}
  </script>


  <script>
   (function($) {
	    $.fn.focusToEnd = function() {
	        return this.each(function() {
	            var v = $(this).val();
	            $(this).focus().val("").val(v);
	        });
	    };
	})(jQuery);
   
	$.fn.selectRange = function (start, end) {
		    if (typeof end === 'undefined') {
		        end = start;
		    }
		    return this.each(function () {
		        if ('selectionStart' in this) {
		            this.selectionStart = start;
		            this.selectionEnd = end;
		        } else if (this.setSelectionRange) {
		            this.setSelectionRange(start, end);
		        } else if (this.createTextRange) {
		            var range = this.createTextRange();
		            range.collapse(true);
		            range.moveEnd('character', end);
		            range.moveStart('character', start);
		            range.select();
		        }
		    });
		};

  </script>
 
 
  <script>
 $(document).ready(function() {
	 
	 $(document).on('mouseenter', ".iffyTip", function () {
	     var $this = $(this);
	     if (this.offsetWidth < this.scrollWidth && !$this.attr('title')) {
	         $this.tooltip({
	             title: $this.text(),
	             placement: "bottom"
	         });
	         $this.tooltip('show');
	     }
	 });
	 
	  $( document ).tooltip({
	      track: true
	    });

	// $( "#datepicker" ).datepicker();
	
	
	 $('.dp').each(function(){
 		           $(this).datepicker({
 		        	 dateFormat: 'yy-mm-dd',
 		        	 minDate: getFormattedDate(new Date())
 		           });
 		      });
	 var posting = $.post("Gtable");
 	  posting.done(function(data) {
 		// $('#result').remove().children();
 		  $('#dtable').empty().append(data);
 		 	$('#example').DataTable();
 		   // $( ".dp" ).datepicker();
 		   
 		 	 $('.dp').each(function(){
 		           $(this).datepicker();
 		      });

 		 
 	  });
 	
 	 $('.dp').each(function(){
	 		
	 		 $(this).datepicker(); 		 			 
	 	   
          
     });

 		
 		
 	
 		$("#dtable").on('click', 'td', function (e) {
 		
 		    var row_index = $(this).parent().index();
 		    var col_index = $(this).index();
 		    //alert(row_index + "------------" + col_index);
 		    
 		    
 		    if ( col_index == 5 || col_index == 9 || col_index == 11 || col_index==8) {
 		    	//nothing
 		    } else {
 	    	 var OriginalContent = $(this).text() + "";  
		 	 var testing = $(this).val();
			 //var newHtml = "<input id = 'hw' type = 'text' value = " + OriginalContent + " " + ">";
		     var newHtml = "<textarea id='hw' cols = '60' rows='10'>" + OriginalContent + "</textarea>";
	 		// $(this).html("<input type='text'/>");
	 	    $(this).html(newHtml);
	 	    $(this).children().first().focus();
		 	var hwlen= $("#hw").val().length;
	 		setInterval(function () {
	 		  
	 		        $('#hw').selectRange(hwlen);
	 		
	 		}, 20000);
		 	
		 	 
	 		/*$(this).children().first().focus(function() {
	 			   // alert("sdfsdf");
			 	    setTimeout((function(el) {
		 	        var strLength = el.value.length;
		 	        return function() {
		 	            if(el.setSelectionRange !== undefined) {
		 	                el.setSelectionRange(strLength, strLength);
		 	            } else {
		 	                $(el).val(el.value);
		 	            }
		 	    }}(this)), 30000);
		 	});*/ 

		 
	 		/*var textarea = document.getElementById("test");

	 		textarea.onfocus = function() {
	 		    moveCaretToEnd(textarea);

	 		    // Work around Chrome's little problem
	 		    window.setTimeout(function() {
	 		        moveCaretToEnd(textarea);
	 		    }, 1);
	 		};*/
			
			    $(this).children().first().keypress(function (e) {
			        if (e.which == 13 || e.which == 9 ) {
			            var newContent = $(this).val();
			            $(this).parent().text(newContent);
			            //alert("Came here");
			        }
			    });

			 $(this).children().first().blur(function(){
			    $(this).parent().text(OriginalContent);
			  
			 });
		 
 		    }
	 	 });
		
 		
 		
 		

 		 $("#dbutton").on('click', '#addrow', function () {
 			 
 			var d = new Date();
 			var strDate = d.getFullYear() + "/" + (d.getMonth()+1) + "/" + d.getDate();
 			 
			 $("#example tbody").append( "<tr>"+ 
 					 					"<td title = 'system generated'></td>"+ 
 					 					"<td title = 'system date Issue encountered'>"+ strDate + "</td>"+ 
 					 					"<td title = 'Shift Issue encountered'>None</td>"+ 
 					 					"<td class= 'iffyTip wd100' title = ProblemStatement>None</td>"+ 
 					 					"<td class= 'iffyTip wd100' title = 'ActionNeeded'>None</td>"+ 
 					 					"<td title = 'Urgency'><select name=urgentlist id = urgentlist>" + 
 					 					"<option>U/I</option>" + 
 					 					"<option>NU/I</option>" + 
 					 					"<option>U/NI</option>" + 
 					 					"</select></td>" + 
 					 					"<td title = Issuetype>None</td>"+ 
 					 					"<td title = who>None</td>"+ 
 					 					"<td title = Requireddate><input type=text class='dp'></td>"+ 
 					 					"<td title = status><select name = statuslist id = statuslist>" + 
 					 					"<option>Closed</option>" +
 					 					"<option>InProgress</option>" +
 					 					"<option>Open</option>" +
 					 					"</select></td>"+
 					 					"<td class= 'iffyTip wd100' title = comments>None</td>"+ 
 					 					"<td title = tick/untick to save changes><input type='checkbox' name='checkbox' id='checkbox' value='new'/></td>"+ 
 					 					"</tr>"
 					 					);
			 							$( ".dp" ).datepicker({
			 								 dateFormat: 'yy-mm-dd',
			 						    	 minDate: getFormattedDate(new Date())
			 								
			 							});
			 							$( ".dp" ).datepicker("refresh");
			 							var arr = [
			 							          {val : 1, text: 'One'},
			 							          {val : 2, text: 'Two'},
			 							          {val : 3, text: 'Three'}
			 							        ];

			 							$(arr).each(function() {
			 								 $("#example tbody #select").append($("<option>").attr('value',this.val).text(this.text));
			 								});
			 							
 		});
 		
 		
 		
 		
 		 $("#dbutton").on('click', '#saverow', function () {
  			save2DB();
  			
  		});
 
 		 
 		$("#dbutton").on('click', '#refresh', function () {
 		    location.reload();
 		});
 		
 		/*$("#dtable").on('click', '#datepicker', function () {
 			alert("dsfds");
 			
 			  $(this).datepicker({   dateFormat: 'dd-M-yy'   });
 		});*/
 		
 		  $("#example.dp").click(function() {
 	           // alert('Item selected');
 	          // $(this).datepicker({   dateFormat: 'dd-M-yy'   });
 	        });
 	
 		$('.dp').on('focus', function(){
 		    $(this).datepicker({
 		        changeMonth: true,
 		        changeYear: true,
 		        yearRange: '1930:'+(new Date).getFullYear(),
 		        dateFormat: 'yy-mm-dd',
 		        minDate: getFormattedDate(new Date())
 		    });
 		})
 		
 		 
 		/*$('.danger').popover({ 
 		    html : true,
 		    content: function() {
 		     // return $('#popover_content_wrapper').html();
 		      return $(this).next('#popover_content_wrapper').html();
 		    }
 		  });*/


 }); //end of document ready
  
 </script>
   
 
 <script>
 
 function save2DB ()
 {
	//alert("I am save");

    var table = $("table tbody");
 	var myTableArray = [];
 	var arrayOfThisRow = [];
 	var ctr=0,  chk;
 	 var pk ,
 	 cdate,
 	 shift,  
 	 what,
 	 action,
     issuetype,
     who,
     when,
     rdate,
     status,
     comments,
     required_A,
     required_B;
 	  table.find('tr').each(function (i, el) {
 	   
 		ctr++;
 	
 		arrayOfThisRow=[];
         var $tds =  $(this).find('td');
         chk = $(this).closest('tr').find('input:checkbox'); 
         var urg = $(this).closest('tr').find('#urgentlist option:selected').val();
         var status_val = $(this).closest('tr').find('#statuslist option:selected').val();
         var dd = $(this).closest('tr').find('.dp'); 
         var ddd = dd.val();
    	 var flag = chk.prop('checked');
    	     pk = $tds.eq(0).text();
             cdate =  $tds.eq(1).text();
             shift = $tds.eq(2).text();
             what =  $tds.eq(3).text();
             what = what.replace(/,/g , ".");
             action =  $tds.eq(4).text();
             action = action.replace(/,/g , ".");
            // urgency =  $tds.eq(5).val();
             urgency = urg;
             issuetype = $tds.eq(6).text();
             //issuetype = ("" +issuetype).replace(/,/g , ".");
             who = $tds.eq(7).text();
             who = who.replace(/,/g , ".");
             rdate = $tds.eq(8).text();
             //status = $tds.eq(9).text();
             status  = status_val;
             //status = status.replace(/,/g , ".");
             comments = $tds.eq(10).text();
             comments = comments.replace(/,/g , ".");
             required_A = "A:" + chk.val();
    	     required_B= "B:" + flag;
    	     rdate = ddd;
    	   
             if ( required_B == "B:true") {
            //alert(ctr + "---" + rdate + "===" + urg);
             arrayOfThisRow.push(pk);
             arrayOfThisRow.push(cdate);
             arrayOfThisRow.push(shift);
             arrayOfThisRow.push(what);
             arrayOfThisRow.push(action);
             arrayOfThisRow.push(urgency);
             arrayOfThisRow.push(issuetype);
             arrayOfThisRow.push(who);
             arrayOfThisRow.push(rdate);
             arrayOfThisRow.push(status);
             arrayOfThisRow.push(comments);
             arrayOfThisRow.push(required_A);
             arrayOfThisRow.push(required_B);
             //arrayOfThisRow.join("____");
             var pipe_delimited_string = arrayOfThisRow.join("____");
             
             myTableArray.push(pipe_delimited_string);
        
             }
            // alert('Row ' + (i + 1) + ':\nwhat: ' + what  + '\nurgency: ' + urgency   + '\nissuetype: ' + issuetype);
            // alert('Row ' + (i + 1) + ':\nwhat: ' + ddd  + '\nurgency: ' + urgency   );
         
     });
 
 	 
 	  //alert(myTableArray);
 	  //alert(myTableArray[1][3]);
 	 /* var st = JSON.stringify(myTableArray);
 	 
	  var posting = $.post("updateTableData2DB.php", {dataTable:st});
	  posting.done(function(data) {
		  
		alert("DB Update done?");
		
	   }); */
	   
	   $.ajax({
	        type: "POST",
	        //url: "updateTableData2DB.php",
	        url : "Utable",
	        data:{dataTable: JSON.stringify(myTableArray)}, 
	        cache: false,

	        success: function(){
	            //alert("OK");
	            var posting = $.post("Gtable");
	       	 	posting.done(function(data) {
	       			
	       		  $('#dtable').empty().append(data);
	       		  oTable = $('#example').DataTable({
	       		  		"bDestroy":true
	       		  	});
	       		 });
	            
	        }
	    });
	   
	 // var table = $('#example').DataTable();
	  //table.ajax.reload();
 }
 
 
 </script>
  </head>
   <body>
   <div id=root>
	<div id=banner class="clearfix float-my-children">
	<a href= http://fc8twebp01/intranet/>
  	<!--   <img src="https://www.google.com/a/globalfoundries.com/images/logo.gif?alpha=1&amp;service=google_default" style="max-width:144px;max-height:60px">-->
   	<img src="lib_web/img/globalfoundries/globalfoundries_small4.png" alt="GLOBALFOUNDRIES" >
    </a>
   <div >
  	  <h4>Issue tracker for morn meeting</h4>
   </div>
   
   <div style="float:right">
   Welcome <%=request.getAttribute("hello").toString()%> 
   </div> 

</div>
	
   <div id="dtable">
		<table id="example" class="display compact" cellspacing="0"
			width="100%">
			<thead>
				<tr>
					<th>S.No</th>
					<th>Date Issue Encountered</th>
					<th>Shift Issue Encountered</th>
					<th>Problem Statement</th>
					<th>Action Needed</th>
					<th>Urgency</th>
					<th>IssueType</th>
					<th>who</th>
					<th>Required Date</th>
					<th>Status</th>
					<th>Comments</th>
					<th>save</th>
				</tr>
			</thead>
			<tbody>
		</table>
	</div>
 <div>
       <br><br>
       <hr>
 </div>
 
  	<div id="dbutton">
		<p>
			<a id="addrow" class=buttonlike class=btn>Add new row</a>
		</p>
		<p>
			<a id="saverow" class=buttonlike class=btn>Save row</a>
		</p>
		<p>
			<a id="refresh" class=buttonlike class=btn>Refresh me</a>
		</p>
	</div>
  <p id="data"></p>
 </body>
</html>


