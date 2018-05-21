<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 

	
	<!-- Dont remove for datatables -->

	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
   <script src="http://code.jquery.com/jquery-latest.min.js"> </script>
   <script src="//code.jquery.com/jquery-1.10.2.js"></script>
	 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	 <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
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
      
    <!-- Dont remove for dialog pop -->

	
	 <script type="text/javascript" src="js/build/jquery.dialogextend.js"></script>
	<link rel="stylesheet" href="css/dist/css/bootstrap.css">
	<script src="css/dist/js/bootstrap.js"></script>   
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">

	
	<style>
	

@media (min-width: 992px) {


table#example tbody tr, td.shrink {
    white-space:nowrap
}
table#example tbody tr, td.expand {
    width: 50%
} 

table#example thead th {
	text-transform: uppercase;
	background-color:#98bf21;
	text-align: center;
	font-size: 14px;
	border: 1px solid black;
}

table#example tr:hover{ background-color:light-grey; color:black;}

table #example{
	text-align: right;
	font-size: auto;
	font-weight: bold;
	
	
}

table#example tbody tr, td {
	 border: 1px solid black;
	 display:grid;
	 min-width:auto;
	 max-width:auto;
    
}
table#example tbody td {
	
}

table#example input[type=text] {
	border: none;
	background: transparent;
}


body {
	font-size: 100%;
	line-height: 1.6875;
	font-weight: bolder;
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
	font-size: 14px;
}

#menu{
	display: inline;
	padding: 15px;
	padding-bottom: 30px;
}

.menua {
  background: no-repeat 6px center;
  width: 10px;
  height: 10px;
  line-height: 1em;
  display: inline-block;
  text-decoration: none;
  padding: 10px;
  margin: 10px;
  }





.menua :hover {
	background-color: #f2f2f2;
	border-color: #888;
	box-shadow: 0 0 2px #ccc;
}

.menua :active {
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


.no-close .ui-dialog-titlebar-close {
    display: none;
}


.tooltip
{
    position: absolute;
    color: white;
    background-color: tan;
    text-align: center;
    border: 1px solid #000;
}

#data {
    background:white;
    border-bottom: 1px black;
    display: inline-block;
}

textarea {
    border: none;
    width: 100%;
    -webkit-box-sizing: border-box; /* <=iOS4, <= Android  2.3 */
    -moz-box-sizing: border-box; /* FF1+ */
    box-sizing: border-box; /* Chrome, IE8, Opera, Safari 5.1*/
}

table#example.dataTable tr.odd { background-color: light-green; }
table#example.dataTable tr.even { background-color: white; }

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
    	
    	   changeMonth: true,
	        changeYear: true,
	        yearRange: '1930:'+(new Date).getFullYear(),
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
  
	function showDialog1(){
		//alert("In here");
        $("#dialog").html("<textarea cols='3' rows='2'>your text here</textarea>");
        $("#dialog").dialog("open");
			//$("#dialog").dialog("option", "title", "Loading....").dialog("open");
			$("span.ui-dialog-title").text('title here'); 
			$("#dialog").dialog({
				dialogClass: "no-close",
				autoOpen: false,
				resizable: true,
				width:"350",
				height:300,
				modal: true,
			  	buttons: {
					"Close": function() {
						$(this).dialog("close");
					}
				}
			});
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
	  $( document ).tooltip({
	      track: true
	  });

	// $( "#datepicker" ).datepicker();
	
	
	 $('.dp').each(function(){
 		           $(this).datepicker({
 		        	  changeMonth: true,
 		 		      changeYear: true,
 		 		      yearRange: '1930:'+(new Date).getFullYear(),
 		 		      dateFormat: 'yy-mm-dd',
 		 		      minDate: getFormattedDate(new Date())
 		        	  
 		           });
 		      });
	 var posting = $.post("Gtable");
 	  posting.done(function(data) {
 		// $('#result').remove().children();
 		  $('#dtable').empty().append(data);
 		 	$('#example').DataTable( {
 		 		/* "sPaginationType": "full_numbers",
 		 	    "bFilter": false,
 		 	    "bSearchable":false,
 		 	    "bInfo":false,
 		 	    "fnDrawCallback":function(){
 		 	        if($j("#tablesorter").find("tr:not(.ui-widget-header)").length<=5){
 		 	            $('#tablesorter div.dataTables_paginate')[0].style.display = "none";
 		 	        } else {
 		 	            $('#tablesorter div.dataTables_paginate')[0].style.display = "block";
 		 	        }
 		 	    }*/
 		 	    
 		 		"paging": false,
 		 		"bPaginate": false
 		 	});
 		   
 		   
 		 	 $('.dp').each(function(){
 		           $(this).datepicker({
 		        	  changeMonth: true,
 		 		       changeYear: true,
 		 		       yearRange: '1930:'+(new Date).getFullYear(),
 		 		       dateFormat: 'yy-mm-dd',
 		 		       minDate: getFormattedDate(new Date())
 		        	   
 		        	   
 		           });
 		      });

 		 
 	  });
 	
 	 $('.dp').each(function(){
	 		
	 		 $(this).datepicker(); 		 			 
	 	   
          
     });

 		
 		
 	
 		$("#dtable").on('click', 'td', function (e) {
 		    var ghelp = "";
 		    var row_index = $(this).parent().index();
 		    var col_index = $(this).index();
 		   // alert(row_index + "------------" + col_index);
 		    var newContent="";
 		    
 		    if ( col_index == 5 || col_index == 9 || col_index == 11 ) {
 		    	//nothing
 		   
 		    	
 		    } 
 		    
 		    /*else if ( col_index == 8 ) {
 		    	$('.dp').datepicker({
 		    	     onSelect: function(d,i){
 		    	    	  $(this).change();
 		    	    	  $('.dp').change();
 		    	          if(d !== i.lastVal){
 		    	              $(this).change();
 		    	           
 		    	          
 		    	            
 		    	     }
 		    	     }
 		    	});
 		    	 
 		   
 
 		    }*/
 		    else {
 		    	
 		    	
 		     	 var OriginalContent = $(this).text() + "";  
		 	 	 $('#data').empty().append(OriginalContent);
		 	 	 var width = OriginalContent.length;
		 	 	 //alert(width);
		 	 	 if ( col_index == 8 ) {
		 	 	
		 	 		$('.dp').datepicker({
		 	 		    changeMonth: true,
		 		        changeYear: true,
		 		        yearRange: '1930:'+(new Date).getFullYear(),
		 		        dateFormat: 'yy-mm-dd',
		 		        minDate: getFormattedDate(new Date()),
	 		    	    onSelect: function(d,i){
	 		    	    	 
	 		    	    	  $(this).change();
	 		    	    	  $('#hidd').empty().append( $(this).val());
	 		    	    	  $('.dp').change();
	 		    	    	 
	 		    	          if(d !== i.lastVal){
	 		    	              $(this).change();
	 		    	       		    	            
	 		    	    	 }
	 		    	         
	 		    	        }
		 	 		
	 		    	});
		 	 		
		 	 		$('.dp').change(function() {
		 	 		
		 	 			var day = $(this).val();
		 	            $('#data').text(day);
		 	 		});
		 	 	
		 	 	 } else {
			        var newHtml = "<textarea id='hw' cols = '" + 50 + "' rows='4'>" + OriginalContent + "</textarea>";
		 	 	
			    $("#hw").css('width', width);
		       	$("#hw").each( function( i, el ) {
		 		    $(el).height( el.scrollHeight );
		 		});
	 		    
	 	        $(this).html(newHtml);
	 	        $(this).children().first().focus();
		 	  	
	 		   //alert("jklj jkljl jkl");
	 		   $("#dialog").html(newHtml);
	 		   $( "#dialog" ).dialog({ 
	 			
	 	       title : "Edit box",
	 	       closeOnEscape: true,
	 	       closeOnEscape: false,
	 	       open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); },
	 	     
	 		   buttons: [{ 
	 		      text: "Ok", 
	 		    
	 		      click: function() { 
	 		         $( this ).dialog( "close" ); 
	 		           newContent = $("#dialog #hw").val();
	 		           console.log(newContent);
	 		         
	 		          //$('#dtable tr:eq(row_index) >td:eq(col_index)').html(newContent);
	 		          // $('#dtable tr').eq(row_index)>td.eq(col_index).html(newContent);
	 		          // $('#dtable td').eq(row_index).html(newContent);
	 		         var table = $("table tbody");

	 		         table.find('tr').each(function (i) {
	 		        	 if ( i == row_index) {
	 		             var $tds = $(this).find('td'),
	 		                 productId = $tds.eq(col_index).text()
	 		                
	 		             // do something with productId, product, Quantity
	 		                //alert('Row ' + (i + 1) + ':\nId: ' + productId );
	 		                $tds.eq(col_index).html(newContent);
	 		                $(this).find("input[type=checkbox]").attr("checked", true);
	 		        	 }
	 		         });
	 		        
	 		         
	 		        $('#data').empty();  
	 		      }
	 		   }]
	 		})
		 }
   
		 
 		   }
 	
	 });
		
 		
 		
 		

 		 $("#dbutton").on('click', '#addrow', function () {
 			 
 			var d = new Date();
 			var strDate = d.getFullYear() + "/" + (d.getMonth()+1) + "/" + d.getDate();
 			 
			 $("#example tbody").append( "<tr>"+ 
 					 					"<td title = 'system generated'></td>"+ 
 					 					"<td title = 'system date Issue encountered'>"+ strDate + "</td>"+ 
 					 					"<td title = 'Shift Issue encountered'>None</td>"+ 
 					 					"<td title = ProblemStatement>None</td>"+ 
 					 					"<td title = 'ActionNeeded'>None</td>"+ 
 					 					"<td title = 'Urgency'><select name=urgentlist id = urgentlist>" + 
 					 					"<option>U/I</option>" + 
 					 					"<option>NU/I</option>" + 
 					 					"<option>U/NI</option>" + 
 					 					"</select></td>" + 
 					 					"<td title = Issuetype>None</td>"+ 
 					 					"<td title = who>None</td>"+ 
 					 					"<td title = Requireddate><input type=text value=" + strDate  + " class='dp'></td>"+ 
 					 					"<td title = status><select name = statuslist id = statuslist>" + 
 					 					"<option>Closed</option>" +
 					 					"<option>InProgress</option>" +
 					 					"<option>Open</option>" +
 					 					"</select></td>"+
 					 					"<td title = comments>None</td>"+ 
 					 					"<td title = tick/untick to save changes><input type='checkbox' name='checkbox' id='checkbox' value='new' /></td>"+ 
 					 					"</tr>"
 					 					);
			 							$( ".dp" ).datepicker({
			 								  changeMonth: true,
			 					 		      changeYear: true,
			 					 		      yearRange: '1930:'+(new Date).getFullYear(),
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
 		   $('#example').DataTable();
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
 	 var fornulldate = new Date();
	 var strDate = fornulldate.getFullYear() + "/" + (fornulldate.getMonth()+1) + "/" + fornulldate.getDate();
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
    	    
    	   
             if ( required_B == "B:true") {
            	
            	 
            	 if ((ddd == undefined) || (ddd == null) || ddd == "null" ) {
            	  	 //alert(rdate + "bug.."+ ddd + "===" + strDate);
                     ddd = strDate;
                	 rdate = strDate;
                 }
                
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
	       		  		"paging": false,
	    	 			"bPaginate": false
	       		  		
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
    <br>
  	  <h4>Action Item tracker for test ops</h4>
   </div>
   
   <div style="float:right;font-style:italic">
   Welcome <%=request.getAttribute("hello").toString()%> 
   </div>
 <div>
       <br>
       <hr>
 </div>
 

   
<div id="dbutton" name = "dbutton" style="background-color:white;border-bottom:solid 1px">
<p id = "menu" name="menu" style="font-style:bold">Menu</p>
			<a id="addrow" class=menua title = "Insert New Row"><img src="images/add.jpg"></a>
			<a id="saverow" class=menua title = "Update/Save to DB"><img src="images/save.png"></a>
			<a id="refresh" class=menua title = "refresh page"><img src="images/refresh.jpg"></a>
		
	</div>
</div>
<p  id="data"></p>
   <div id="dtable">
		<table id="example"  cellspacing="0"	width="100%">
			<thead>
				<tr>
					<th>S.No</th>
					<th>Date</th>
					<th>Shift</th>
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
   
  	
  <div id="hidd" name="hidd" style="display: none;">hidden</div>
  <div id="dialog"></div>
  
 </body>
</html>


