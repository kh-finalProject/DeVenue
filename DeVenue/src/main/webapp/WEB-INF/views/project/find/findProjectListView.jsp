<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.DeVenue.project.model.vo.*,com.kh.DeVenue.member.model.vo.*"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%

Member loginUser=null;
ArrayList<ProjectLike> likeList=new ArrayList();

if(session!=null){
	
	if(session.getAttribute("loginUser")!=null){
	
	loginUser=(Member)session.getAttribute("loginUser");
	likeList =loginUser.getLikeList();

	}
	
	System.out.println("화면단에서, 로그인유저의 관심 리스트"+likeList);
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 찾기</title>

<style>

 /*body 색상*/
    main {
      background-color: #212529;
      color: white;
    }

    /*popover*/
    .popover-header{
      background: black;
    }

    /*modal*/
    .modal-header{
      color: black;
    }

    .modal-body{
      color: gray;
      font-size: 1rem;
    }


    /*autocomplete*/
      * { box-sizing: border-box; }


      .autocomplete {
        /*the container must be positioned relative:*/
        position: relative;
        display: inline-block;
        color: black;
      }
      input {
        border: 0.0625rem solid transparent;
        background-color: #f1f1f1;
        padding: 0.625rem;
        font-size: 0.9375rem;
      }
      input[type=text] {
        background-color: #f1f1f1;
        width: 100%;
       
      }
      
      .autocomplete-items {
        position: absolute;
        border: 0.0625rem solid #d4d4d4;
        border-bottom: none;
        border-top: none;
        z-index: 99;
        /*position the autocomplete items to be the same width as the container:*/
        top: 100%;
        left: 0;
        right: 0;
      }
      .autocomplete-items div {
        padding: 0.625rem;
        cursor: pointer;
        background-color: #fff;
        border-bottom: 0.0625rem solid #d4d4d4;
      }
      .autocomplete-items div:hover {
        /*when hovering an item:*/
        background-color: #e9e9e9;
      }
      .autocomplete-active {
        /*when navigating through the items using the arrow keys:*/
        background-color: DodgerBlue !important;
        color: #ffffff;
      }

      /*화면 크기에 따라 검색창을 사라지게 하자*/
      @media screen and (max-width: 1138px) {
        #searchDiv{
          display: none;
        }
      }

      /*프로젝트 list*/
      #projectList .col-md-6{
        padding-left: 0;
        padding-right: 0;
      }

      #projectList .card{
        margin-left: 1rem;
        margin-right: 1rem;
        background:none;
        border: solid white 1px;
      }

      #projectList .card:hover{
        border: solid #2793F2 1px;
      }

      #projectList .card a{
        color: white;
        text-decoration: none;
      }

      #projectList .card a:hover{
        color:#2793F2
      }

      .card-text textarea{
        overflow: hidden;
        background: none;
        border: none;
        resize: none;
        color: white;
        width: 100%;
        outline: none;
      }

      
      /*관심*/
      #projectList .fa-heart-o {
        color: pink;
        cursor: pointer;
      }

      #projectList .fa-heart {
        color: pink;
        cursor: pointer;
      }

      /*페이지네이션*/
      #pagination{
        border-top: 1px dashed white;
      }

      #pagination>div{
        margin-top: 1rem;
      }

</style>
</head>
<body>

<jsp:include page="../../common/menubar.jsp"></jsp:include>

<main>
    <div class="container-fluid">

      <div class="row" style="height: 6.25rem;">
        <div class="col-md-2" ></div>
        <div class="col-md-2 pl-0" style="border-bottom: 0.0625rem solid gray;">
        <h5 class="pt-5">프로젝트 찾기</h5>
        </div>
          <div id="searchDiv" class="col-md-6 mt-5 px-0" style="border-bottom: 0.0625rem solid gray;">
            <div class="float-right">
            <form action="searchProjectList.do" method="post">
              <div id="searchDiv_category" class="dropdown" style="display: inline-block;">
              
              <c:if test="${not empty filter }">
              <c:if test="${filter.category != ''}">
                <button class="btn btn-light dropdown-toggle mb-1 text-right" style="box-shadow: none;width: 10rem;height: 2.75rem;" type="button" id="searchDrop" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  	${filter.category}
                </button>
                
               </c:if> 
               
               <c:if test="${filter.category == ''}">
                <button class="btn btn-light dropdown-toggle mb-1 text-right" style="box-shadow: none;width: 10rem;height: 2.75rem;" type="button" id="searchDrop" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  	전체
                </button>
               </c:if> 
               </c:if>
               
               <c:if test="${empty filter}">
                <button class="btn btn-light dropdown-toggle mb-1 text-right" style="box-shadow: none;width: 10rem;height: 2.75rem;" type="button" id="searchDrop" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  	전체
                </button>
               </c:if> 
               
               
                <input type="hidden" name="category" id="search_category"/>
                <div class="dropdown-menu text-right" aria-labelledby="searchDrop">
                  <a class="dropdown-item" href="#">전체</a>
                  <a class="dropdown-item" href="#">제목</a>
                  <a class="dropdown-item" href="#">관련기술</a>
                  <a class="dropdown-item" href="#">프로젝트 상세</a>
                </div>
              </div>
              <div class="autocomplete" style="width:18.75rem;">
              
                <input id="search_text" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${filter.keyword}">
              
              </div>
              <button id="search_btn" type="button" class="btn btn-outline-info mb-1" style="width:6.25rem;height: 2.75rem;">검색</button>
            </form>
            </div>
          </div>

          <script>
			//카테고리 선택 시 항목 변경하고 input hidden tag에 값을 set
            $("#searchDiv_category>div>a").click(function(){
              var selected=$(this).text();
              $("#searchDiv_category>button").text(selected);
              $("#search_category").val(selected);
            })
            
            
            //검색 조건이 걸려있다면,
            $(document).ready(function(){
            
            	var category="${search.category}";
            	var keyword="${search.keyword}";
            	
            	if(category!=null&&category!=''){
            		$("#searchDrop").text(category);
            		
            		if(keyword!=null&&keyword!=''){
            			$("#search_text").val(keyword);
            		}
            	}
            	
            })
            
            $(document).on("click","#search_btn",function(){
            	usingFilter();
            })
            
            
           
          </script>

          <script>

            $("#searchDiv_category>div>a").click(function(){

              if($(this).text()=="관련기술"){

                var languages=["java","oracle","javascript","jquery","css","html5"];

                autocomplete(document.getElementById("search_text"), languages);
                
              }
            })

              
          

              function autocomplete(inp, arr) {

                /*the autocomplete function takes two arguments,
                the text field element and an array of possible autocompleted values:*/
                var currentFocus;
                /*execute a function when someone writes in the text field:*/
                inp.addEventListener("input", function(e) {
                    var a, b, i, val = this.value;
                    /*close any already open lists of autocompleted values*/
                    closeAllLists();
                    if (!val) { return false;}
                    currentFocus = -1;
                    /*create a DIV element that will contain the items (values):*/
                    a = document.createElement("DIV");
                    a.setAttribute("id", this.id + "autocomplete-list");
                    a.setAttribute("class", "autocomplete-items");
                    /*append the DIV element as a child of the autocomplete container:*/
                    this.parentNode.appendChild(a);
                    /*for each item in the array...*/
                    for (i = 0; i < arr.length; i++) {
                      /*check if the item starts with the same letters as the text field value:*/
                      if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                        /*create a DIV element for each matching element:*/
                        b = document.createElement("DIV");
                        /*make the matching letters bold:*/
                        b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                        b.innerHTML += arr[i].substr(val.length);
                        /*insert a input field that will hold the current array item's value:*/
                        b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                        /*execute a function when someone clicks on the item value (DIV element):*/
                            b.addEventListener("click", function(e) {
                            /*insert the value for the autocomplete text field:*/
                            inp.value = this.getElementsByTagName("input")[0].value;
                            /*close the list of autocompleted values,
                            (or any other open lists of autocompleted values:*/
                            closeAllLists();
                        });
                        a.appendChild(b);
                      }
                    }
                });
                /*execute a function presses a key on the keyboard:*/
                inp.addEventListener("keydown", function(e) {
                    var x = document.getElementById(this.id + "autocomplete-list");
                    if (x) x = x.getElementsByTagName("div");
                    if (e.keyCode == 40) {
                      /*If the arrow DOWN key is pressed,
                      increase the currentFocus variable:*/
                      currentFocus++;
                      /*and and make the current item more visible:*/
                      addActive(x);
                    } else if (e.keyCode == 38) { //up
                      /*If the arrow UP key is pressed,
                      decrease the currentFocus variable:*/
                      currentFocus--;
                      /*and and make the current item more visible:*/
                      addActive(x);
                    } else if (e.keyCode == 13) {
                      /*If the ENTER key is pressed, prevent the form from being submitted,*/
                      e.preventDefault();
                      if (currentFocus > -1) {
                        /*and simulate a click on the "active" item:*/
                        if (x) x[currentFocus].click();
                      }
                    }
                });
                function addActive(x) {
                  /*a function to classify an item as "active":*/
                  if (!x) return false;
                  /*start by removing the "active" class on all items:*/
                  removeActive(x);
                  if (currentFocus >= x.length) currentFocus = 0;
                  if (currentFocus < 0) currentFocus = (x.length - 1);
                  /*add class "autocomplete-active":*/
                  x[currentFocus].classList.add("autocomplete-active");
                }
                function removeActive(x) {
                  /*a function to remove the "active" class from all autocomplete items:*/
                  for (var i = 0; i < x.length; i++) {
                    x[i].classList.remove("autocomplete-active");
                  }
                }
                function closeAllLists(elmnt) {
                  /*close all autocomplete lists in the document,
                  except the one passed as an argument:*/
                  var x = document.getElementsByClassName("autocomplete-items");
                  for (var i = 0; i < x.length; i++) {
                    if (elmnt != x[i] && elmnt != inp) {
                    x[i].parentNode.removeChild(x[i]);
                  }
                }
              }
              /*execute a function when someone clicks in the document:*/
              document.addEventListener("click", function (e) {
                  closeAllLists(e.target);
              });
              }

          


          </script>

         
        </div>
        <div class="col-md-2" ></div>
      </div>

      <!--Grid row-->
      <div class="row mt-3">

        <div class="col-md-2 mb-4" style="text-align: center;">
          
        </div>
        <!--Grid column 시작-->
        <div class="col-md-2 mb-4">

          <!-- Section: 필터시작 -->
          <script>
          //request에 존재하는 filter를 바탕으로 체크한다.
          
          $(document).ready(function(){
        	 
        	  var filter="";
        	  var workType;
        	  var mCate;
        	  var dCate;
        	  var costMin;
        	  var costMax;
        	  var rate;
        	  var sign;
        	  var location;
        	  var recruit;
        	  var costMinWithWon;
        	  var costMinWithComma;
        	  var costMaxWithWon;
        	  var costMaxWithComma;
        	  var costCustom;
        	  
        	  filter="${filter}";
        	  
        	  if(filter!=null){
        		  
        		  
        		  location="${filter.location}";
        		  recruit="${filter.recruit}";
        		  sign="${filter.sign}";
        		  rate="${filter.rate}";
        		  costMin="${filter.costMin}";
        		  costMax="${filter.costMax}";
        		  workType="${filter.workType}";
        		  mCate="${filter.mCate}"; 
        		  dCate="${filter.dCate}";
        		  costCustom="${filter.costCustom}"
        		  
        	  
        	  if(location!=null&&location.length!=0){
        		  
        		  var refine=location.replace("[","").replace("]","").split(",");
        		  
        		  $("#location_display").html("");
        		  
        		  for(var i=0;i<refine.length;i++){
        			  
        			
        			  
        			  if(refine[i].includes('서울')){
        				  
        				  $section=$("#location_display");
                          $div=$("<div class='form-check mb-3'>")
                          $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_seoul").val("서울").attr("checked","true").attr("name","location_modal_check");
                          $label=$("<label>").addClass("form-check-label small").attr("for","m_seoul").text("서울");

                          $div.append($input);
                          $div.append($label);
                          $section.append($div);
        				  
        			  }
        			  
 					if(refine[i].includes('강원도')){
        				  
        				  $section=$("#location_display");
                          $div=$("<div class='form-check mb-3'>")
                          $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_kangweon").val("강원도").attr("checked","true").attr("name","location_modal_check");
                          $label=$("<label>").addClass("form-check-label small").attr("for","m_kangweon").text("강원도");

                          $div.append($input);
                          $div.append($label);
                          $section.append($div);
        				  
        			  }
 					
 					
 					if(refine[i].includes('경기도')){
      				  
      				  $section=$("#location_display");
                        $div=$("<div class='form-check mb-3'>")
                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_kyeongki").val("경기도").attr("checked","true").attr("name","location_modal_check");
                        $label=$("<label>").addClass("form-check-label small").attr("for","m_kyeongki").text("경기도");

                        $div.append($input);
                        $div.append($label);
                        $section.append($div);
      				  
      			  }
 					
 					
 					if(refine[i].includes('충청북도')){
 	      				  
 	      				  $section=$("#location_display");
 	                        $div=$("<div class='form-check mb-3'>")
 	                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_chungbuk").val("충청북도").attr("checked","true").attr("name","location_modal_check");
 	                        $label=$("<label>").addClass("form-check-label small").attr("for","m_chungbuk").text("충청북도");

 	                        $div.append($input);
 	                        $div.append($label);
 	                        $section.append($div);
 	      				  
 	      			  }
 					
 					
 					if(refine[i].includes('부산')){
	      				  
	      				  $section=$("#location_display");
	                        $div=$("<div class='form-check mb-3'>")
	                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_pusan").val("부산").attr("checked","true").attr("name","location_modal_check");
	                        $label=$("<label>").addClass("form-check-label small").attr("for","m_pusan").text("부산");

	                        $div.append($input);
	                        $div.append($label);
	                        $section.append($div);
	      				  
	      			  }
 					
 					
 					if(refine[i].includes('충청남도')){
	      				  
	      				  $section=$("#location_display");
	                        $div=$("<div class='form-check mb-3'>")
	                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_chungnam").val("충청남도").attr("checked","true").attr("name","location_modal_check");
	                        $label=$("<label>").addClass("form-check-label small").attr("for","m_chungnam").text("충청남도");

	                        $div.append($input);
	                        $div.append($label);
	                        $section.append($div);
	      				  
	      			  }
 					
 					
 					if(refine[i].includes('인천')){
	      				  
	      				  $section=$("#location_display");
	                        $div=$("<div class='form-check mb-3'>")
	                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_incheon").val("인천").attr("checked","true").attr("name","location_modal_check");
	                        $label=$("<label>").addClass("form-check-label small").attr("for","m_incheon").text("인천");

	                        $div.append($input);
	                        $div.append($label);
	                        $section.append($div);
	      				  
	      			  }
 					
 					
 					if(refine[i].includes('전라북도')){
	      				  
	      				  $section=$("#location_display");
	                        $div=$("<div class='form-check mb-3'>")
	                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_jeonbuk").val("전라북도").attr("checked","true").attr("name","location_modal_check");
	                        $label=$("<label>").addClass("form-check-label small").attr("for","m_jeonbuk").text("전라북도");

	                        $div.append($input);
	                        $div.append($label);
	                        $section.append($div);
	      				  
	      			  }
 					
 					
 					if(refine[i].includes('대전')){
	      				  
	      				  $section=$("#location_display");
	                        $div=$("<div class='form-check mb-3'>")
	                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_daejeon").val("대전").attr("checked","true").attr("name","location_modal_check");
	                        $label=$("<label>").addClass("form-check-label small").attr("for","m_daejeon").text("대전");

	                        $div.append($input);
	                        $div.append($label);
	                        $section.append($div);
	      				  
	      			  }
 					
 					
 					if(refine[i].includes('전라남도')){
	      				  
	      				  $section=$("#location_display");
	                        $div=$("<div class='form-check mb-3'>")
	                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_jeonnam").val("전라남도").attr("checked","true").attr("name","location_modal_check");
	                        $label=$("<label>").addClass("form-check-label small").attr("for","m_jeonnam").text("전라남도");

	                        $div.append($input);
	                        $div.append($label);
	                        $section.append($div);
	      				  
	      			  }
 					
 					
 					if(refine[i].includes('대구')){
	      				  
	      				  $section=$("#location_display");
	                        $div=$("<div class='form-check mb-3'>")
	                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_daegu").val("대구").attr("checked","true").attr("name","location_modal_check");
	                        $label=$("<label>").addClass("form-check-label small").attr("for","m_daegu").text("대구");

	                        $div.append($input);
	                        $div.append($label);
	                        $section.append($div);
	      				  
	      			  }
 					
 					
 					if(refine[i].includes('경상북도')){
	      				  
	      				  $section=$("#location_display");
	                        $div=$("<div class='form-check mb-3'>")
	                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_kyeongbuk").val("경상북도").attr("checked","true").attr("name","location_modal_check");
	                        $label=$("<label>").addClass("form-check-label small").attr("for","m_kyeongbuk").text("경상북도");

	                        $div.append($input);
	                        $div.append($label);
	                        $section.append($div);
	      				  
	      			  }
 					
 					
 					if(refine[i].includes('광주')){
	      				  
	      				  $section=$("#location_display");
	                        $div=$("<div class='form-check mb-3'>")
	                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_kwangju").val("광주").attr("checked","true").attr("name","location_modal_check");
	                        $label=$("<label>").addClass("form-check-label small").attr("for","m_kwangju").text("광주");

	                        $div.append($input);
	                        $div.append($label);
	                        $section.append($div);
	      				  
	      			  }
 					
 					
 					if(refine[i].includes('경상남도')){
	      				  
	      				  $section=$("#location_display");
	                        $div=$("<div class='form-check mb-3'>")
	                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_kyeongnam").val("경상남도").attr("checked","true").attr("name","location_modal_check");
	                        $label=$("<label>").addClass("form-check-label small").attr("for","m_kyeongnam").text("경상남도");

	                        $div.append($input);
	                        $div.append($label);
	                        $section.append($div);
	      				  
	      			  }
 					
 					
 					if(refine[i].includes('울산')){
	      				  
	      				  $section=$("#location_display");
	                        $div=$("<div class='form-check mb-3'>")
	                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_ulsan").val("울산").attr("checked","true").attr("name","location_modal_check");
	                        $label=$("<label>").addClass("form-check-label small").attr("for","m_ulsan").text("울산");

	                        $div.append($input);
	                        $div.append($label);
	                        $section.append($div);
	      				  
	      			  }
 					
 					
 					if(refine[i].includes('제주')){
	      				  
	      				  $section=$("#location_display");
	                        $div=$("<div class='form-check mb-3'>")
	                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_jeju").val("제주").attr("checked","true").attr("name","location_modal_check");
	                        $label=$("<label>").addClass("form-check-label small").attr("for","m_jeju").text("제주");

	                        $div.append($input);
	                        $div.append($label);
	                        $section.append($div);
	      				  
	      			  }
 					
 					
 					if(refine[i].includes('세종')){
	      				  
	      				  $section=$("#location_display");
	                        $div=$("<div class='form-check mb-3'>")
	                        $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id","m_sejong").val("세종").attr("checked","true").attr("name","location_modal_check");
	                        $label=$("<label>").addClass("form-check-label small").attr("for","m_sejong").text("세종");

	                        $div.append($input);
	                        $div.append($label);
	                        $section.append($div);
	      				  
	      			  }
        			  
        		  }
        	  }
        	  
        	  if(recruit!=null&&recruit!=''){
        		  
        		  $("#hide_finished").attr("checked","true");
        	  }
        	  
        	  
        	  if(sign!=null&&sign!=''){
        		  
        		  $("#qualified").attr("checked","true");
        	  }
        	  
        	  if(rate!=null&&rate!=''){
        		  
        		  $("#highRate").attr("checked","true");
        	  }
        	  
        	  
        	  console.log("costCustom"+costCustom);
        	  if(costCustom=="Y"){
        		  
        		  $("#cost_custom_check").attr("checked","true");
        		  $("#cost_custom_menu").css("display","block");
                  $("#cost_select").css("display","none");
        		  
        	  }else if(costCustom==""){
        		  
        		  $("#cost_custom_check").prop("checked");
        		  $("#cost_custom_menu").css("display","none");
                  $("#cost_select").css("display","block");
        	  }
        	  
        	  
        	  
        	  if(costMin!=null&&costMin!=''){
        		  
        		  switch(costMin){
        		  case '1000000':
        			costMinWithWon="100만원";
        			break;
        		  case '2000000':
      			  	costMinWithWon="200만원";
      				break;
        		  case '3000000':
      			  	costMinWithWon="300만원";
      				break;
        		  case '4000000':
      			  	costMinWithWon="400만원";
      				break;
        		  case '5000000':
      			  	costMinWithWon="500만원";
      				break;
        		  case '6000000':
      			  	costMinWithWon="600만원";
      				break;
        		  case '7000000':
      			  	costMinWithWon="700만원";
      				break;
        		  case '8000000':
      			  	costMinWithWon="800만원";
      				break;
        		  case '9000000':
      			  	costMinWithWon="900만원";
      				break;
        		  case '10000000':
      			  	costMinWithWon="1000만원";
      				break;
        		  }
        		  
        		  $("#cost_btn_min").text(costMinWithWon);
        		 
        		  console.log("costMin"+costMin);
        		  console.log("costMinWithWon"+costMinWithWon);
        		  
        		  costMinWithComma=numberWithCommas(costMin);
        		  $("#cost_custom_min").val(costMinWithComma);
        		  
        	  }
        	  
        	  if(costMax!=null&&costMax!=''){
        		  
        		
        		  switch(costMax){
        		  case '1000000':
        			  costMaxWithWon="100만원";
        			break;
        		  case '2000000':
        			  costMaxWithWon="200만원";
      				break;
        		  case '3000000':
        			  costMaxWithWon="300만원";
      				break;
        		  case '4000000':
        			  costMaxWithWon="400만원";
      				break;
        		  case '5000000':
        			  costMaxWithWon="500만원";
      				break;
        		  case '6000000':
        			  costMaxWithWonn="600만원";
      				break;
        		  case '7000000':
        			  costMaxWithWon="700만원";
      				break;
        		  case '8000000':
        			  costMaxWithWon="800만원";
      				break;
        		  case '9000000':
        			  costMaxWithWon="900만원";
      				break;
        		  case '10000000':
        			  costMaxWithWon="1000만원";
      				break;
        		  }
        		  
        		  console.log("costMax"+costMax);
        		  console.log("costMaxWithWon"+costMaxWithWon);
        		  
        		  $("#cost_btn_max").text(costMaxWithWon);
        		  
        		  costMaxWithComma=numberWithCommas(costMax);
        		  $("#cost_custom_max").val(costMaxWithComma);
        		  
        	  }
        	  
        	  if(workType!=null&&workType.length!=0){
        		  
        		  var refine=workType.replace("[","").replace("]","").split(",");
        		 
        		  for(var i=0;i<refine.length;i++){
        			  
        			  console.log("refine"+refine[i]);
        			  
        			  if(refine[i].includes('외주')){
        				  $("#process_outsource").attr("checked","true");
        			  }
        			  
        			  if(refine[i].includes('상주')){
        				  $("#process_insource").attr("checked","true");
        			  }
        		  }
        	  }
        	  
        	  
        	 if(mCate!=null&&mCate.length!=0){
        		 
        		 var refine=mCate.replace("[","").replace("]","").split(",");
        		 
        		 for(var i=0;i<refine.length;i++){
        			 if(refine[i].includes('개발')){
        				 $("#main_category_develop").attr("checked","true");
        			 }
        			 
					 if(refine[i].includes('디자인')){
						 $("#main_category_design").attr("checked","true");
        			 }
        		 }
        		 
        	 }
        	 
        	 if(dCate!=null&&dCate.length!=0){
        		 
        		 var refine=dCate.replace("[","").replace("]","").split(",");
        		 
        		 for(var i=0;i<refine.length;i++){
        			 if(refine[i].includes('웹')){
        				 $("#sub_category_web").attr("checked","true");
        			 }
        			 
					 if(refine[i].includes('어플리케이션')){
						 $("#sub_category_app").attr("checked","true");
        			 }
					 
					 if(refine[i].includes('퍼블리싱')){
        				 $("#sub_category_pub").attr("checked","true");
        			 }
        			 
					 if(refine[i].includes('기타')){
						 $("#sub_category_etc").attr("checked","true");
        			 }
        		 }
        		 
        	 }
        	 
        	  }//filter!=null의 끝
        	  
        	  
          });
        	  
         
          </script>
			
          <section id="searchFilter">

            <!-- Section: 프로젝트 진행 방식 시작 -->
            <section class="mb-5">
              <h6 class="font-weight-bold mb-3">프로젝트 진행 방식
                <i tabindex="0" role="button"  data-trigger="focus" id="process_notice" class="fas fa-exclamation-circle"></i>
              </h6>
              
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" name="workType" id="process_outsource" value="외주" />
                <label class="form-check-label small" for="process_outsource">외주(도급)</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" name="workType" id="process_insource" value="상주" />
                <label class="form-check-label small" for="process_insource">상주</label>
              </div>
              
            </section>
            <script>
              $(function(){

                //popOver 속성을 icon에 준다
                $("#process_notice").popover({title:"외주와 상주의 구분",content:"외주:원하는 장소에서 프로젝트 진행<br>상주:클라이언트 요청 장소에서 진행 <br>",html:true,placement:"right"});

                //hover 했을 때 popover가 보이게 한다.
                $("#process_notice").hover(function(){
                 $("#process_notice").trigger("focus");
                  
                });

                
              })

            </script>
            <!-- Section: 프로젝트 진행 방식 끝 -->

            <!-- Section: 프로젝트 대표 카테고리 시작 -->
            <section class="mb-5">
              <h6 class="font-weight-bold mb-3">프로젝트 대표 카테고리</h6>

              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="main_category_develop" name="mCate" value="개발"/>
                <label class="form-check-label small" for="main_category_develop">개발</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="main_category_design" name="mCate" value="디자인" />
                <label class="form-check-label small" for="main_category_design">디자인</label>
              </div>

            </section>
            <!-- Section: 프로젝트 대표 카테고리 끝 -->

             <!-- Section: 프로젝트 세부 카테고리 시작 -->
             <section class="mb-5">
              <h6 class="font-weight-bold mb-3">프로젝트 세부 카테고리</h6>

              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="sub_category_web" name="dCate" value="웹" />
                <label class="form-check-label small" for="sub_category_web">웹</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="sub_category_app" name="dCate" value="어플리케이션" />
                <label class="form-check-label small" for="sub_category_app">애플리케이션</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="sub_category_pub" name="dCate" value="퍼블리싱"/>
                <label class="form-check-label small" for="sub_category_pub">퍼블리싱</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="sub_category_etc" name="dCate" value="기타" />
                <label class="form-check-label small" for="sub_category_etc">기타</label>
              </div>

            </section>
            <!-- Section: 프로젝트 세부 카테고리 끝 -->


             <!-- Section: 프로젝트 예상 금액 시작 -->
             <section class="mb-5">
             <h6 class="font-weight-bold mb-3">프로젝트 예상 금액</h6>
               <section class="mb-3" id="cost_select">

              <div class="mb-3">
              <div class="btn-group">
                <button id="cost_btn_min" style="width:7.5rem; box-shadow: none;" class="btn btn-light btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                 	 금액 선택
                </button>
                <input type="hidden" name="cost_min" id="cost_min">
                <div id="cost_min_menu" class="dropdown-menu" style="max-height:7.5rem; overflow-y:auto;">
                  <a class="dropdown-item">100만원</a>
                  <a class="dropdown-item">200만원</a>
                  <a class="dropdown-item">300만원</a>
                  <a class="dropdown-item">400만원</a>
                  <a class="dropdown-item">500만원</a>
                  <a class="dropdown-item">600만원</a>
                  <a class="dropdown-item">700만원</a>
                  <a class="dropdown-item">800만원</a>
                  <a class="dropdown-item">900만원</a>
                  <a class="dropdown-item">1000만원</a>
                </div>
                <label class="small ml-3">이상</label>
              </div>
              </div>
              
              <script>
              
                  $("#cost_min_menu>a").click(function(){
                  
                      var selected=$(this).text();
                      $("#cost_btn_min").text(selected);
                      
                      var max=$("#cost_btn_max").text();
                      
                      switch(selected) {
                      case "100만원":
                        $("#cost_min").val("1000000").trigger('change');
                        break;
                      case "200만원":
                    	  $("#cost_min").val("2000000").trigger('change');
                        break;
                      case "300만원":
                          $("#cost_min").val("3000000").trigger('change');
                          break;
                      case "400만원":
                      	  $("#cost_min").val("4000000").trigger('change');
                          break;
                      case "500만원":
                          $("#cost_min").val("5000000").trigger('change');
                          break;
                      case "600만원":
                      	  $("#cost_min").val("6000000").trigger('change');
                          break;
                      case "700만원":
                          $("#cost_min").val("7000000").trigger('change');
                          break;
                      case "800만원":
                      	  $("#cost_min").val("8000000").trigger('change');
                          break;
                      case "900만원":
                          $("#cost_min").val("9000000").trigger('change');
                          break;
                      case "1000만원":
                      	  $("#cost_min").val("10000000").trigger('change');
                          break;
                          
                      default:
                    	  $("#cost_min").val("0").trigger('change');
                    }
                      
                      
                      switch(max) {
                      case "100만원":
                        $("#cost_max").val("1000000").trigger('change');
                        break;
                      case "200만원":
                    	  $("#cost_max").val("2000000").trigger('change');
                        break;
                      case "300만원":
                          $("#cost_max").val("3000000").trigger('change');
                          break;
                      case "400만원":
                      	  $("#cost_max").val("4000000").trigger('change');
                          break;
                      case "500만원":
                          $("#cost_max").val("5000000").trigger('change');
                          break;
                      case "600만원":
                      	  $("#cost_max").val("6000000").trigger('change');
                          break;
                      case "700만원":
                          $("#cost_max").val("7000000").trigger('change');
                          break;
                      case "800만원":
                      	  $("#cost_max").val("8000000").trigger('change');
                          break;
                      case "900만원":
                          $("#cost_max").val("9000000").trigger('change');
                          break;
                      case "1000만원":
                      	  $("#cost_max").val("10000000").trigger('change');
                          break;
                          
                      default:
                    	  $("#cost_max").val("10000000").trigger('change');
                    }
                  })

              </script>


              <div class="mb-3">
                <div class="btn-group">
                  <button id="cost_btn_max" style="width: 7.5rem; box-shadow: none;" class="btn btn-light btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    	금액 선택
                  </button>
                  <input type="hidden" name="cost_max" id="cost_max">
                  <div id="cost_max_menu" class="dropdown-menu" style="max-height: 7.5rem; overflow-y: auto;">
                    <a class="dropdown-item">100만원</a>
                    <a class="dropdown-item">200만원</a>
                    <a class="dropdown-item">300만원</a>
                    <a class="dropdown-item">400만원</a>
                    <a class="dropdown-item">500만원</a>
                    <a class="dropdown-item">600만원</a>
                    <a class="dropdown-item">700만원</a>
                    <a class="dropdown-item">800만원</a>
                    <a class="dropdown-item">900만원</a>
                    <a class="dropdown-item">1000만원</a>
                  </div>
                  <label class="small ml-3">이하</label>
                </div>
              </div>
              <script>
                   $("#cost_max_menu>a").click(function(){
                      var selected=$(this).text();
                      $("#cost_btn_max").text(selected);
                      
                      var min=$("#cost_btn_min").text();
                      
                      
                      switch(min) {
                      case "100만원":
                        $("#cost_min").val("1000000").trigger('change');
                        break;
                      case "200만원":
                    	  $("#cost_min").val("2000000").trigger('change');
                        break;
                      case "300만원":
                          $("#cost_min").val("3000000").trigger('change');
                          break;
                      case "400만원":
                      	  $("#cost_min").val("4000000").trigger('change');
                          break;
                      case "500만원":
                          $("#cost_min").val("5000000").trigger('change');
                          break;
                      case "600만원":
                      	  $("#cost_min").val("6000000").trigger('change');
                          break;
                      case "700만원":
                          $("#cost_min").val("7000000").trigger('change');
                          break;
                      case "800만원":
                      	  $("#cost_min").val("8000000").trigger('change');
                          break;
                      case "900만원":
                          $("#cost_min").val("9000000").trigger('change');
                          break;
                      case "1000만원":
                      	  $("#cost_min").val("10000000").trigger('change');
                          break;
                          
                      default:
                    	  $("#cost_min").val("0").trigger('change');
                    }
                      
                      
                      switch(selected) {
                      case "100만원":
                        $("#cost_max").val("1000000").trigger('change');
                        break;
                      case "200만원":
                    	  $("#cost_max").val("2000000").trigger('change');
                        break;
                      case "300만원":
                          $("#cost_max").val("3000000").trigger('change');
                          break;
                      case "400만원":
                      	  $("#cost_max").val("4000000").trigger('change');
                          break;
                      case "500만원":
                          $("#cost_max").val("5000000").trigger('change');
                          break;
                      case "600만원":
                      	  $("#cost_max").val("6000000").trigger('change');
                          break;
                      case "700만원":
                          $("#cost_max").val("7000000").trigger('change');
                          break;
                      case "800만원":
                      	  $("#cost_max").val("8000000").trigger('change');
                          break;
                      case "900만원":
                          $("#cost_max").val("9000000").trigger('change');
                          break;
                      case "1000만원":
                      	  $("#cost_max").val("10000000").trigger('change');
                          break;
                          
                      default:
                    	  $("#cost_max").val("10000000").trigger('change');
                    }
                  })
                  
              </script>


             
            
            </section>
           
            <section class="mb-3" id="cost_custom_menu" style="display: none;">

              <div class="mb-3">
                <div class="btn-group">
                 <input id="cost_custom_min" type="text" class="form-control" style="width: 7.5rem;height: 1.875rem;">
                  <label class="small ml-3">원~</label>
                </div>
                </div>
                
                <div class="mb-3">
                  <div class="btn-group">
                   <input id="cost_custom_max" type="text" class="form-control" style="width: 7.5rem;height: 1.875rem;">
                    <label class="small ml-3 mr-2">원</label><button id="cost_custom_btn" class="btn btn-outline-info btn-sm rounded" type="button">적용</button>
                  </div>
                  </div>
            </section>

            <section>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="cost_custom_check" name="costCustom" value="Y"/>
                <label class="form-check-label small" for="cost_custom">직접입력</label>
                <a id="cost_reset" class="btn btn-link text-muted p-0 ml-5" style="font-size: 1rem;">초기화</a>
              </div>

            </section>

            <script>

              $(function(){
                //프로젝트 예상 금액 직접입력 클릭 시 직접 입력할 수 있는 input text로 변경
                  $("#cost_custom_check").click(function(){

                    if($(this).prop("checked")){
                      $("#cost_custom_menu").css("display","block");
                      $("#cost_select").css("display","none");
                    }else{
                      $("#cost_custom_menu").css("display","none");
                      $("#cost_select").css("display","block");
                    }

                  });


                  $("#cost_reset").click(function(){

                    $("#cost_custom_min").val("");
                    $("#cost_custom_max").val("");
                    $("#cost_btn_min").text("금액 선택");
                    $("#cost_btn_max").text("금액 선택");


                  })


                //custom에는 숫자만 입력할 수 있다.(min)
                $("#cost_custom_min").keyup(function(){
                  var character=/^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z]+$/;
                  var numberonly=/[,0-9]/g;

                  if(numberonly.test($(this).val())){
                   
                    var minCost="";
                    var refined="";

                    minCost=$(this).val();
                    
                    if(minCost.includes(",")){
                      refined=removeCommas(minCost);
                     
                    }else{
                      refined=minCost;
                    }

                    result=numberWithCommas(refined);

                  
                    $("#cost_custom_min").val(result);
                    
                    
                  }else{
                    $(this).val("");
                  }
                  
                })


                $("#cost_custom_max").keyup(function(){
                  var character=/^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z]+$/;
                  var numberonly=/[,0-9]/g;

                  if(numberonly.test($(this).val())){
                   
                    var maxCost="";
                    var refined="";

                    maxCost=$(this).val();
                    
                    if(maxCost.includes(",")){
                      refined=removeCommas(maxCost);
                     
                    }else{
                      refined=maxCost;
                    }

                    result=numberWithCommas(refined);

                  
                    $("#cost_custom_max").val(result);
                    
                    
                  }else{
                    $(this).val("");
                  }
                  
                })




              })

              //숫자 천 단위마다 콤마를 넣는 정규 표현식
              function numberWithCommas(x){
                return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
              }

              //숫자에서 콤마를 제거하는 정규 표현식
              function removeCommas(x){
                return x.toString().replace(/\,/g,"").trim();
              }
              
              
              //적용 버튼을 누르면 input hidden tag에 값 세팅
              $(document).on("click","#cost_custom_btn",function(){
            	  
            	  var min= $("#cost_custom_min").val();
            	  var max= $("#cost_custom_max").val();
            	  var refinedMin=removeCommas(min);
            	  var refinedMax=removeCommas(max);
            	  $("#cost_min").val(refinedMin).trigger('change');
            	  $("#cost_max").val(refinedMax).trigger('change');
            	  
              })
             

            </script>
            </section>
            <!-- Section: 프로젝트 예상 금액 끝 -->


            <!-- Section: 검증된 클라이언트 시작 -->
            <section class="mb-5">
              <h6 class="font-weight-bold mb-3">검증된 클라이언트</h6>

              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="highRate" name="clientRate" value="4"/>
                <label class="form-check-label small" for="highRate">평가우수</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="qualified" name="clientSign" value="COMPLETE" />
                <label class="form-check-label small" for="qualified">인증완료</label>
              </div>
              
            </section>
            <!-- Section: 검증된 클라이언트 끝 -->

            <!-- Section: 클라이언트 위치 시작 -->
            <section class="mb-5">
              <h6 class="font-weight-bold mb-3">클라이언트 위치</h6>

              <section id="location_display">
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" name="location_modal_check" id="m_seoul" value="서울"/>
                <label class="form-check-label small" for="m_seoul">서울</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" name="location_modal_check" id="m_kyeongki" value="경기도" />
                <label class="form-check-label small" for="m_kyeongki">경기도</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" name="location_modal_check" id="m_pusan" value="부산" />
                <label class="form-check-label small" for="m_pusan">부산</label>
              </div>
            </section>
              <a id="location_add" class="btn btn-link text-muted p-0" data-toggle="modal" href="#location_modal" aria-expanded="false" aria-controls="collapseExample" style="font-size: 1rem;">
              +클라이언트 위치 추가
              </a>
            </section>

            

            
            <!-- Section: 클라이언트 위치 끝 -->

             <!-- Section: 지원자 모집 상태 시작 -->
             <section class="mb-5">
              <h6 class="font-weight-bold mb-3">지원자 모집 상태</h6>

              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="hide_finished" name="recruit" value="Y"/>
                <label class="form-check-label small" for="hide_finished">모집 마감 숨기기</label>
              </div>

            </section>
            <!-- Section: 지원자 모집 상태 끝 -->
            
            <section>
            <button id="resetFilter" class="btn btn-outline-secondary">필터 초기화</button>
            
            </section>
            

          </section>
          <!-- Section: 필터끝 -->
          
          
          <!-- 지역 추가 Modal -->
            <div class="modal fade" id="location_modal" tabindex="-1" role="dialog" aria-labelledby="location_modal_Label" aria-hidden="true">
              <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="location_modal_Label">클라이언트 위치</h5>
                    <button id="location_modal_close" type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <table style="width: 100%" id="location_modal_table">
                      <tr style="height: 1.875rem;">
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_seoul" name="location_modal_check" value="서울"/>
                            <label class="form-check-label" for="m_seoul">서울</label>
                          </div>
                        </td>
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_kangweon" name="location_modal_check" value="강원도"/>
                            <label class="form-check-label" for="m_kangweon">강원도</label>
                          </div>
                        </td>
                      </tr>

                      <tr style="height:1.875rem;">
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_kyeongki" name="location_modal_check" value="경기도"/>
                            <label class="form-check-label" for="m_kyeongki">경기도</label>
                          </div>
                        </td>
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_chungbuk" name="location_modal_check" value="충청북도"/>
                            <label class="form-check-label" for="m_chungbuk">충청북도</label>
                          </div>
                        </td>
                      </tr>

                      <tr style="height:1.875rem;">
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_pusan" name="location_modal_check" value="부산"/>
                            <label class="form-check-label" for="m_pusan">부산</label>
                          </div>
                        </td>
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_chungnam" name="location_modal_check" value="충청남도"/>
                            <label class="form-check-label" for="m_chungnam">충청남도</label>
                          </div>
                        </td>
                      </tr>

                      <tr style="height:1.875rem;">
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_incheon" name="location_modal_check" value="인천"/>
                            <label class="form-check-label" for="m_incheon">인천</label>
                          </div>
                        </td>
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_jeonbuk" name="location_modal_check" value="전라북도"/>
                            <label class="form-check-label" for="m_jeonbuk">전라북도</label>
                          </div>
                        </td>
                      </tr>

                      <tr style="height:1.875rem;">
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_daejeon" name="location_modal_check" value="대전"/>
                            <label class="form-check-label" for="m_daejeon">대전</label>
                          </div>
                        </td>
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_jeonnam" name="location_modal_check" value="전라남도"/>
                            <label class="form-check-label" for="m_jeonnam">전라남도</label>
                          </div>
                        </td>
                      </tr>

                      <tr style="height:1.875rem;">
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_daegu" name="location_modal_check" value="대구"/>
                            <label class="form-check-label" for="m_daegu">대구</label>
                          </div>
                        </td>
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_kyeongbuk" name="location_modal_check" value="경상북도"/>
                            <label class="form-check-label" for="m_kyeongbuk">경상북도</label>
                          </div>
                        </td>
                      </tr>

                      <tr style="height:1.875rem;">
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_kwangju" name="location_modal_check" value="광주"/>
                            <label class="form-check-label" for="m_kwangju">광주</label>
                          </div>
                        </td>
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_kyeongnam" name="location_modal_check" value="경상남도"/>
                            <label class="form-check-label" for="m_kyeongnam">경상남도</label>
                          </div>
                        </td>
                      </tr>

                      <tr style="height:1.875rem;">
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_ulsan" name="location_modal_check" value="울산"/>
                            <label class="form-check-label" for="m_ulsan">울산</label>
                          </div>
                        </td>
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_jeju" name="location_modal_check" value="제주"/>
                            <label class="form-check-label" for="m_jeju">제주</label>
                          </div>
                        </td>
                      </tr>

                      <tr style="height:1.875rem;">
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_sejong" name="location_modal_check" value="세종"/>
                            <label class="form-check-label" for="m_sejong">세종</label>
                          </div>
                        </td>
                        <td>
                          <div class="form-check ml-5">
                            
                          </div>
                        </td>
                      </tr>

                    </table>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="location_modal_reset">초기화</button>
                    <button type="button" class="btn btn-primary" id="location_modal_submit">적용하기</button>
                  </div>
                </div>
              </div>
            </div>
            <script>

              $("#location_modal_submit").click(function(){

                //모달에서 적용 버튼을 누르면 기존에 있던 클라이언트 지역 체크박스가 사라진다 
                $("#location_display").html("");
                $("#location_modal_close").trigger("click");

                var selected=$("input[name='location_modal_check']:checked");
                var values=[];
                var ids=[];

                console.log(selected);

                //체크한 요소들의 value와 id를 뽑아내어 배열에 담는다.
                for (var index = 0; index < selected.length; index++) {
                  values.push(selected[index].value);
                  ids.push(selected[index].id);
                }

                console.log(values);
                console.log(ids);

                //선택된 지역들을 클라이언트 지역에 추가한다.
                for(var i=0;i<selected.length;i++){
                  $section=$("#location_display");
                  $div=$("<div class='form-check mb-3'>")
                  $input=$("<input type='checkbox'>").addClass("form-check-input").attr("id",ids[i]).val(values[i]).attr("checked","true").attr("name","location_modal_check");
                  $label=$("<label>").addClass("form-check-label small").attr("for",ids[i]).text(values[i]);

                  $div.append($input);
                  $div.append($label);
                  $section.append($div);
                  
                 
                }
                
                
                //모달을 통해 지역이 추가되면 필터 메소드를 trigger하여 필터 전송한다.
                usingFilter();
                
              });


              //클라이언트 지역에 체크된 지역을 모달에 반영한다.
              $("#location_add").click(function(){

                console.log("클릭");

                //체크된 지역의 value를 배열에 담는다.
                var input=$("#location_display").children().children('input');
                var list=[];
                var istrue=[];
                for(var i=0;i<input.length;i++){
                  list.push(input[i].value);
                  istrue.push(input[i].checked);
                }
                console.log(list);
                console.log(istrue);

                //모달 안의 checkbox를 선택한다.
                var modalInput=$(".modal-body").children().children().children().children().children().children('input');

               
                //기존에 체크된 지역이 있다면 체크된 지역은 체크되게 하고 체크 해제된 지역은 체크 해제한다.
                if(list.length!=0){

                  for(var i=0;i<list.length;i++){

                    for(var j=0;j<modalInput.length;j++){

                        if(list[i]==modalInput[j].value){
                            
                          if(istrue[i]){
                            modalInput[j].checked=true;
                          }else{
                            modalInput[j].checked=false;
                          }

                        }

                    }

                }

                 }

                });


                $("#location_modal_reset").click(function(){
                  resetModal();
                })


                //모달 안의 체크박스 리셋
                function resetModal(){

                  var modalInput=$(".modal-body").children().children().children().children().children().children('input');

                   //모달 안에 checkbox가 선택되어 있다면 해제한다.
                   for(var i=0;i<modalInput.length;i++){


                       if(modalInput[i].checked){
                          modalInput[i].checked=false;
                       }

                      }
                    }

            </script>
			<!-- 지역 추가 Modal 끝 -->
        
        </div>
        <!--Grid column 사이드바 column 끝-->
        <script>
          //필터 
          //1.사이드바의 input 상태 값이 바뀐다
          //2.필터 전체의 값을 받아온다.
          //3.form에 붙여 ajax로 controller에 전송한다.
          //4.조회결과 프로젝트 리스트와 페이지 네이션을 data로 받아온다.
          //5.새로 리스트를 작성하여 갖다 붙인다.
          
          function usingFilter(sorting){
        	  
        	
        	  
        	//필터 내부의 모든 input 태그가 담길 것
        	  filter=$("#searchFilter").find("input");
    		  
        	  var loginUser="${loginUser}";
        	  var userLike;
        	  
    		  var page="${pi.currentPage}";
    		
        	  var workType=[];
        	  var mCate=[];
        	  var dCate=[];
        	  var costMin;
        	  var costMax;
        	  var costCustom;
        	  var rate;
        	  var sign;
        	  var location=[];
        	  var recruit;
        	  
        	  //검색 필터도 보내자
        	  var category=$("#searchDrop").text().trim();
        	  console.log("category"+$("#search_category").val());
        	  var keyword=$("#search_text").val();
        	  
        	  //정렬 기준도 보내자
        	  var sorting=sorting;
        	  
    		  console.log(filter);
    		  
    		//필터 중 하나의 값이 바뀌면 전체 필터의 체크 값을 담는다.
    		  for(var i=0;i<filter.length;i++){
    			  
    			  
    			//전체 필터의 수 만큼 도는 반복문
    			//i번째 필터가 1.value가 null이 아닌지 확인 2.체크박스라면 체크가 되어있는지 확인 3.switch문을 통해 input name에 따라 변수 값 설정
    			
    			if(filter[i]!=null){
    				
    				if(filter[i].type=="checkbox"){
    					
    					console.log("체크박스야")
    					
    					if(filter[i].checked==true){
    						
    						console.log("체크가 되었어");
    						
    						switch(filter[i].name){
    						 case "workType":
    							console.log("workType이야");
    							workType.push(filter[i].value);
    						 break;
    					     case "mCate":
    						 	mCate.push(filter[i].value);
    					     break;
    					     case "dCate":
     						 	dCate.push(filter[i].value);
     					     break;
    					     case "clientRate":
      						 	rate=filter[i].value;
      					     break;
    					     case "clientSign":
       						 	sign=filter[i].value;
       					     break;
    					     case "location_modal_check":
        						 location.push(filter[i].value);
        					 break;
    					     case "recruit":
        						 recruit=filter[i].value;
        					 break;
    					     case "costCustom":
        						 costCustom=filter[i].value;
        					 break;
    						 default:
    						 console.log("알 수 없는 이름:"+filter[i]);
    						
    						}
    						
    					}
    				
    				}
    				
    				//최소금액, 최대금액은 input hidden 태그로 넘어온다.
    				if(filter[i].type=="hidden"){
    					
    					console.log("히든 태그야.")
    					
    					switch(filter[i].name){
   					     case "cost_min":
   						 	costMin=filter[i].value;
   					     break;
   					     case "cost_max":
    						costMax=filter[i].value;
    					 break;
   						 default:
   						 console.log("알 수 없는 이름:"+filter[i]);
   						
   						}
    					
    				}
    				
    				
    			}else{
    				console.log(filter[i]);
    			}
    			
    			 //값을 담은 변수를 form에 붙여 controller에 전송한다.
    			
    			
    		  }//for문의 끝
    		  
    		  
    		  	console.log(workType);
    		  
    		  	var obj=new Object();
    		  	
    		  	obj.page=page;
    		  
    		  	if(workType!=null){
    				obj.workType=workType;
    			}
    		  	
    		  	if(mCate!=null){
    				obj.mCate=mCate;
    			}
    			
    			if(dCate!=null){
    				obj.dCate=dCate;
    			}
    			
    			if(costMin!=null){
    				obj.costMin=costMin;
    			}
    			
    			if(costMax!=null){
    				obj.costMax=costMax;
    			}
    			
    			if(rate!=null){
    				obj.rate=rate;
    			}
    			
    			if(sign!=null){
    				obj.sign=sign;
    			}
    			
    			if(location!=null){
    				obj.location=location;
    			}
    			
    			if(recruit!=null){
    				obj.recruit=recruit;
    			}
    			
    			if(costCustom!=null){
    				obj.costCustom=costCustom;
    			}
    			 
    			//검색 조건도 함께 보낸다
    			if(category!=null){
    				obj.category=category;
    			}
    			
    			if(keyword!=null){
    				obj.keyword=keyword;
    			}
    			
    			//정렬 기준
    			if(sorting!=null){
    				obj.sorting=sorting;
    			}
    		
    			console.log(obj);
    			
    			//객체를 제출
    			 $.ajax({
      				url:"collectFilter.do",
      				data:JSON.stringify(obj),
      				type:"post",
      				contentType : 'application/json; charset=utf-8',
      				dataType:"json",
      				success:function(data){
      					
      					
      					//게시물을 append할 준비
      					$section=$("#projectList");
      					
      					$section.html("");//section 안을 비우고 for문을 돌릴 것
      					
      					console.log("data"+data);
      					
      					$list=data.list;//프로젝트 리스트
        				$techList=data.tech;//프로젝트 기술 리스트
        				$pi=data.pi;//페이지네이션 객체
        				
        				console.log("list"+$list);
        			
        				$("#projectCount").text(data.listCount);
      					
        				
        				
        				//for문 시작
      					for(var i=0;i<$list.length;i++){
      						
      					//기본
	      					var $outRow=$("<div>").addClass("row my-2 project");
	      					var $inRow=$("<div>").addClass("row mb-2 mx-auto").css("width","100%");
	      					var $col=$("<div>").addClass("col-md-12 px-0");
	      					var $div=$("<div>");
	      					var $card=$("<div>").addClass("card flex-md-row mb-4 box-shadow h-md-250");
	      					var $cardBody=$("<div>").addClass("card-body d-flex flex-column align-items-start");
	      					var $likeFlag=false;
	      					
	      					//배지
	  						var $badgeDiv=$("<div>").addClass("d-inline-block mb-2");
	  						var $recruitY=$("<span>").addClass("badge badge-success mr-2").text("모집중");
	  						var $recruitN=$("<span>").addClass("badge badge-secondary mr-2").text("모집마감");
	  						var $today=$("<span>").addClass("badge badge-info").text("TODAY");
	  						var $new=$("<span>").addClass("badge badge-info").text("NEW");
	      					
	  						//상단
	  						var $head=$("<div>").css("width","100%");
	  						var $h3=$("<h3>").addClass("mb-0 float-left");
	  						var $title=$("<a>").addClass("projectTitle");
	  						var $identify=$("<a>").addClass("btn").attr("data-toggle","tooltip").attr("data-placement","right").attr("title","이 프로젝트의 클라이언트는 신원인증을 완료했습니다.");
	      					var $icon=$("<i>").addClass("far fa-check-circle");
	      					var $likeDiv=$("<div>").addClass("float-right mr-3");
	      					var $likeSpan=$("<span>").addClass("heart");
	      					var $heart=$("<i>").addClass("fa fa-heart-o").attr("aria-hidden","true");
	      					var $likeHeart=$("<i>").addClass("fa fa-heart").attr("aria-hidden","true");
	      					
	      					var $likeLabel=$("<label>").text("관심");
	      					var $hiddenId=$("<input type='hidden'>").attr("name","pId");
	      					var $hiddenLikeId=$("<input type='hidden'>").attr("name","likeId");
	      					
	      					//기획 상태
	      					var $plan=$("<div>").addClass("project_plan_progress").css("width","20rem");
	      					var $planP=$("<div>").addClass("text-muted progress_label").css("float","left").css("margin-right","1rem").css("margin-bottom","0").css("font-size","0.875rem").text("기획상태");
	      					var $progressDiv=$("<div>").addClass("progress mt-1");
	      					var $20=$("<div>").addClass("progress-bar bg-info").attr("role","progressbar").css("width","20%").attr("aria-valuenow","20").attr("aria-valuemin","0").attr("aria-valuemax","100").text("20%");
	      					var $40=$("<div>").addClass("progress-bar bg-info").attr("role","progressbar").css("width","40%").attr("aria-valuenow","40").attr("aria-valuemin","0").attr("aria-valuemax","100").text("40%");
	      					var $60=$("<div>").addClass("progress-bar bg-info").attr("role","progressbar").css("width","60%").attr("aria-valuenow","60").attr("aria-valuemin","0").attr("aria-valuemax","100").text("60%");
	      					var $80=$("<div>").addClass("progress-bar bg-info").attr("role","progressbar").css("width","80%").attr("aria-valuenow","80").attr("aria-valuemin","0").attr("aria-valuemax","100").text("80%");
	      					var $98=$("<div>").addClass("progress-bar bg-info").attr("role","progressbar").css("width","98%").attr("aria-valuenow","98").attr("aria-valuemin","0").attr("aria-valuemax","100").text("98%");
	      					
	      					//요약 내용
	      					var $sRow=$("<div>").addClass("row mt-3 mb-3").css("width","100%");
	      					
	      					var $sCol9=$("<div>").addClass("col-md-9");
	      					
	      					var $sTable=$("<table>").css("width","80%").css("height","100%");
	      					
	      					var $tr1=$("<tr>");
	      					
	      					var $tdPrice=$("<td>").css("border-right","dashed 1px white");
	      					var $priceLabel=$("<label>").addClass("mr-3").html("예상금액  &#8361;");
	      					var $price=$("<label>");
	      					var $won=$("<label>").text("원");
	      					
	      					var $tdMCate=$("<td>");
	      					var $mCateLabel=$("<label>").addClass("ml-3 mCate");
	      					
	      					
	      					var $tr2=$("<tr>");
	      					
	      					var $tdDuration=$("<td>").css("border-right","dashed 1px white");
	      					var $durationLabel=$("<label>").addClass("mr-3").text("예상기간");
	      					var $duration=$("<label>");
	      					var $day=$("<label>").text("일");
	      					
	      					var $tdDCate=$("<td>");
	      					var $dCateLabel=$("<label>").addClass("ml-3 dCate");
	      					
	      					var $sCol3=$("<div>").addClass("col-md-3");
	      					
	      					var $endDiv=$("<div>").addClass("mt-3").css("text-align","right");
	      					var $endIcon=$("<i>").addClass("fas fa-history mr-3");
	      					var $endLabelHead=$("<label>").text("마감");
	      					var $end=$("<label>");
	      					var $endLabelFoot=$("<label>").text("일 전");
	      					
	      					var $applyDiv=$("<div>").css("text-align","right");
	      					var $applyIcon=$("<i>").addClass("fas fa-user mr-3");
	      					var $applyLabelHead=$("<label>").text("총");
	      					var $apply=$("<label>");
	      					var $applyLabelFoot=$("<label>").text("명 지원");
	      					
	      					
	      					//세부내용
	      					var $dRow=$("<div>").addClass("row mb-3").css("width","100%").css("height","100%");
	      					var $dCol9=$("<div>").addClass("col-md-9");
	      					var $cardText=$("<div>").addClass("card-text mb-4").css("font-size","0.875rem");
	      					var $cardTextLabel=$("<label>").text("프로젝트 개요");
	      					var $cardTextarea=$("<textarea>").attr("readonly","true").attr("maxlength","100");
	      					
	      					var $dTable=$("<table>").css("width","100%");
	      					
	      					var $dTr=$("<tr>");
	      					
	      					var $tdWorkType=$("<td>").css("border-right","dashed 1px white").css("width","10%");
	      					var $workType=$("<span>").addClass("badge badge-info");
	      					
	      					var $tdTech=$("<td>").css("border-right","dashed 1px white").css("width","40%").css("padding-left","1rem");
	      					
	      					
	      					var $tdLocation=$("<td>").css("width","15%").css("padding-left","1rem").css("padding-top","0.375rem").css("font-size","0.875rem");
	      					var $locationIcon=$("<i>").addClass("fas fa-map-marker-alt mr-2");
	      					var $location=$("<label>");
	      					
	      					var $tdCDate=$("<td>").css("width","35%").css("font-size","0.875rem");
	      					var $cDateLabel=$("<label>").addClass("mt-2 mr-2 ml-4 text-muted").text("등록일자:");
	      					var $cDate=$("<label>").addClass("text-muted");
	      					
	      					var $dCol3=$("<div>").addClass("col-md-3").css("height","100%").css("border-top","1px dashed white");
	      					
	      					var $numDiv=$("<div>").addClass("mt-5").css("text-align","right");
	      					var $replyIcon=$("<i>").addClass("far fa-comment-dots mr-1");
	      					var $replyNum=$("<label>");
	      					var $likeIcon=$("<i>").addClass("far fa-heart mr-1");
	      					var $likeNum=$("<label>").addClass("likeNum");
      						
      						
      						
      						
      						//배지
      						if($list[i].project.proRecruit=='Y'){
      							$badgeDiv.append($recruitY);
      						}
      						
      						if($list[i].project.proRecruit=='N'){
      							$badgeDiv.append($recruitN);
      						}
      						
      						var today=new Date();
      						var ago = new Date(today.getTime() - (7 * 24 * 60 * 60 * 1000));
      						
      						console.log("ago?"+ago);
      						
      						if($list[i].project.proCreateDate==today){
      							$badgeDiv.append($today);
      						}
      						
      						if(ago<$list[i].project.proCreateDate){
      							$badgeDiv.append($new);
      						}
      						
      						$cardBody.append($badgeDiv);
      						
      						//상단
      						$title.text($list[i].project.proName);
      						$h3.append($title);
      						
      						$identify.append($icon);
      						if($list[i].identify=="COMPLETE"){
      							$h3.append($identify);
      						}
      						
      						$head.append($h3);
      						
      						if(loginUser==""){
      							//로그인 하지 않은 상태
      							$likeSpan.append($heart);
      						}else{
      							
      							//로그인을 했다
      							
      							<%if(loginUser!=null){%>
      							console.log("로그인을 했다.")
      							<%if(!likeList.isEmpty()){%>
      							//관심 프로젝트 리스트가 있다면
      							console.log("관심 리스트가 있다.");
      							
      							<%for(int i=0;i<likeList.size();i++){
      							
      								int pId=likeList.get(i).getpList().getId();
      								int lId=likeList.get(i).getProLId();
      								System.out.println("화면단 널 체크 pId:"+pId);
      								System.out.println("화면단 널 체크 lId:"+lId);
      							
      							%>
      							console.log("pId"+$list[i].id);
      							
      							if($list[i].id=='<%=pId%>'){
      								//관심 프로젝트 리스트에 있는 프로젝트 아이디와 일치하는 아이디가 있을 경우,
      								console.log("일치하는 리스트가 있다"+$list[i].id);
      								$likeFlag=true;
      								console.log("likeFlag"+$likeFlag);
      								
      								$likeSpan.addClass("liked");
      								$hiddenLikeId.val("<%=lId%>");
      								$likeDiv.append($hiddenLikeId);
      								
      							}
      							
      							
      							<%}%>
      							
      							
      							if($likeFlag){
      								//채워진 하트를 붙인다.
      								console.log("채워진 하트");
      								$likeSpan.append($likeHeart);
      							}else{
      								console.log("빈 하트");
      								$likeSpan.append($heart);
      							}
      							
      							
      							
      							<%}else{%>
      							//관심 프로젝트 리스트가 없다면
      								console.log("관심 리스트가 없다.");
      								$likeSpan.append($heart);
      							
      							<%}%>
      							
      							<%}else{%>
      								$likeSpan.append($heart);
      							<%}%>
      						}
      						
      						
      						$likeDiv.append($likeSpan);
      						$likeDiv.append($likeLabel);
      						
      						$hiddenId.val($list[i].id);
      						$likeDiv.append($hiddenId);
      						
      						$head.append($likeDiv);
      						
      						$cardBody.append($head);
      						
      						//기획상태
      						
      						if($list[i].project.proPlanDetail==1){
      							$progressDiv.append($20);
      						}
      						
      						if($list[i].project.proPlanDetail==2){
      							$progressDiv.append($40);
      						}
      						
      						if($list[i].project.proPlanDetail==3){
      							$progressDiv.append($60);
      						}
      						
      						if($list[i].project.proPlanDetail==4){
      							$progressDiv.append($80);
      						}
      						
      						if($list[i].project.proPlanDetail==5){
      							$progressDiv.append($98);
      						}
      						
      					
      						$plan.append($planP);
      						$plan.append($progressDiv);
      						
      						$cardBody.append($plan);
      						
      						
      						//요약내용
      						
      						var price=$list[i].project.proPayment;
      						var priceWithComma=price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      						
      						$price.text(priceWithComma);
      						
      						$tdPrice.append($priceLabel);
      						$tdPrice.append($price);
      						$tdPrice.append($won);
      						
      						$tr1.append($tdPrice);
      						
      						$mCateLabel.text($list[i].mCategory);
      						$tdMCate.append($mCateLabel);
      						
      						$tr1.append($tdMCate);
      						
      						$duration.text($list[i].project.proDuration);
      						$tdDuration.append($durationLabel);
      						$tdDuration.append($duration);
      						$tdDuration.append($day);
      						
      						$tr2.append($tdDuration);
      						
      						$dCateLabel.text($list[i].dCategory);
      						$tdDCate.append($dCateLabel);
      						
      						$tr2.append($tdDCate);
      						
      						$sTable.append($tr1);
      						$sTable.append($tr2);
      						$sCol9.append($sTable);
      						
      						$sRow.append($sCol9);
      						
      						var endDate=new Date($list[i].project.proREndDate);
      						var diff=Math.floor((endDate.getTime() - today.getTime()) / (1000*60*60*24))+1;
      						
      						$end.text(diff);
      						$endDiv.append($endIcon);
      						$endDiv.append($endLabelHead);
      						$endDiv.append($end);
      						$endDiv.append($endLabelFoot);
      						
      						if($list[i].project.proRecruit=='Y'){
      						$sCol3.append($endDiv);
      						}
      						
      						$apply.text($list[i].applyNum);
      						$applyDiv.append($applyIcon);
      						$applyDiv.append($applyLabelHead);
      						$applyDiv.append($apply);
      						$applyDiv.append($applyLabelFoot);
      						
      						$sCol3.append($applyDiv);
      						
      						$sRow.append($sCol3);
      						
      						$cardBody.append($sRow);
      						
      						//세부내용
      						
      						$cardTextarea.val($list[i].project.proSummary);
      						$cardText.append($cardTextLabel);
      						$cardText.append($cardTextarea);
      						
      						$dCol9.append($cardText);
      						
      						$workType.text($list[i].workType);
      						$tdWorkType.append($workType);
      						$dTr.append($tdWorkType);
      						
      						for(var t in $techList){
      							
      							var $tech=$("<a>").addClass("badge badge-secondary mr-2");
      							
      							if($techList[t].pId==$list[i].id){
      								$tech.text($techList[t].tName);
      								$tdTech.append($tech);
      							}
      						}
      						
      						$dTr.append($tdTech);
      						
      						$location.text($list[i].project.proLocation);
      						$tdLocation.append($locationIcon);
      						$tdLocation.append($location);
      						
      						$dTr.append($tdLocation);
      						
      						$cDate.text($list[i].project.proCreateDate);
      						$tdCDate.append($cDateLabel);
      						$tdCDate.append($cDate);
      						
      						$dTr.append($tdCDate);
      						
      						$dTable.append($dTr);
      						
      						$dCol9.append($dTable);
      						
      						$dRow.append($dCol9);
      						
      						$replyNum.text($list[i].replyNum);
      						$likeNum.text($list[i].likeNum);
      						
      						$numDiv.append($replyIcon);
      						$numDiv.append($replyNum);
      						$numDiv.append($likeIcon);
      						$numDiv.append($likeNum);
      						
      						$dCol3.append($numDiv);
      						
      						$dRow.append($dCol3);
      						
      						//카드 붙이기
      						
      						$cardBody.append($dRow);
      						
      						$card.append($cardBody);
      						$div.append($card);
      						$col.append($div);
      						$inRow.append($col);
      						$outRow.append($inRow);
      						
      						
      						$section.append($outRow);
      					
      						
      					}//for문 끝
      					
      					
      					//pagination을 append할 준비
      					
						console.log("$pi?"+$pi);
						var start=$pi.startPage;
      					var end=$pi.endPage;
      					var current=$pi.currentPage;
      					var max=$pi.maxPage;
      					console.log("start:"+start+"end:"+end+"current:"+current+"max:"+max);
      					
      					var $pageSection=$("#pagination");
      					
      					$pageSection.html("");
      					
      					var $pageRow=$("<div>").addClass("row d-flex justify-content-around align-items-center");
      					var $pageCol=$("<div>").addClass("col-12 col-md-4 text-center");
      					var $pageNav=$("<nav>");
      					
      					var $ul=$("<ul>").addClass("pagination justify-content-center mb-0 text-dark");
      					var $backLi=$("<li>").addClass("page-item");
      					var $backA=$("<a>").addClass("page-link");
      					var $backIcon=$("<i>").addClass("fas fa-chevron-left");
      					
      					var $numLi;
      					var $numA;
      					
      					var $frontLi=$("<li>").addClass("page-item");
      					var $frontA=$("<a>").addClass("page-link");
      					var $frontIcon=$("<i>").addClass("fas fa-chevron-right")
      					
      					
      					if(current==1){
      						$backA.append($backIcon);
      						$backLi.append($backA);
      						$ul.append($backLi);
      					}
      					
      					if(current>1){
      						$backA.addClass("goBack");
      						$backA.append($backIcon);
      						$backLi.append($backA);
      						$ul.append($backLi);
      					}
      					
      					
      					for(var i=start;i<end+1;i++){
      						
      						console.log(i);
      						
      						$numLi=$("<li>").addClass("page-item");
	      					$numA=$("<a>").addClass("page-link");
      						
      						if(current==i){
      							$numA.text(i);
      							$numLi.addClass("active");
      							$numLi.append($numA);
      							$ul.append($numLi);
      						}
      						
      						if(current!=i){
      							$numA.addClass("goThisNum");
      							$numA.text(i);
      							$numLi.append($numA);
      							$ul.append($numLi);
      						}
      						
      					}
      					
      					if(current==$pi.maxPage){
      						$frontA.append($frontIcon);
      						$frontLi.append($frontA);
      						$ul.append($frontLi);
      					}
      					
      					if(current<$pi.maxPage){
      						$frontA.addClass("goFront");
      						$frontA.append($frontIcon);
      						$frontLi.append($frontA);
      						$ul.append($frontLi);
      					}
      					
      					$pageNav.append($ul);
      					$pageCol.append($pageNav);
      					$pageRow.append($pageCol);
      					$pageSection.append($pageRow);
      					
      					
      					
      					
      				},
      				error:function(request, status, errorData){
                          alert("error code: " + request.status + "\n"
                                +"message: " + request.responseText
                                +"error: " + errorData);
                       } 
  				
  			})//ajax의 끝
    		  
    	 
    	  
    	  
        	  
        	  
        	  
        	  
          }
          
          
          //정렬을 클릭하면 usingFilter 함수를 사용한다.
          
          $(function(){
        	  
        	  
        	  var sorting=$("input[name='sorting']");
        	  var sortingValue;
        	  
        	  sorting.change(function(){

					sortingValue=$(this).val();
					usingFilter(sortingValue);
        	  })
        	  
          })
          
          
          
          //필터 컬럼의 input태그의 값이 변하면 usingFilter 함수를 사용한다.
          $(function(){
        	
        	  var filter=$("#searchFilter").find("input");
        	  
        	 
        	  
        	  filter.change(function(){
        		  
        	  usingFilter();
        	  
          });
        	  
          })
          
          
          //필터 초기화
          $(document).on("click","#resetFilter",function(){
        	  
        	location.href="removeFilter.do";
        	  
          })
          
          
          </script>

        <!--Grid column 프로젝트 리스트 시작-->
        <div class="col-md-6 mb-4">

          <h4><strong id="projectCount">${pi.listCount}</strong>개의 프로젝트</h4>
          <button class="btn btn-outline-info" style="box-shadow: none;" type="button" data-toggle="collapse" data-target="#sortingDiv">정렬하기</button>

          <!-- 정렬하기 Section: Block Content -->
          <section class="ml-3 mt-5 mb-4">
            
            <div class="row d-flex justify-content-around align-items-center">
              <div class="col-md-1">
                
              </div>

              <div id="sortingDiv" class="collapse col-md-11 text-right" style="width:100%;height:3.125rem;">
				<form id="sortingForm" action="sortingProjectList.do" method="get">
                <div class="custom-control custom-radio custom-control-inline mt-3">
                  <input type="radio" id="sorting_apply" value="APPLYNUM" name="sorting" class="custom-control-input">
                  <label class="custom-control-label" for="sorting_apply">지원 많은 순</label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" id="sorting_payment" value="PAYMENT" name="sorting" class="custom-control-input">
                  <label class="custom-control-label" for="sorting_payment">금액 높은 순</label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" id="sorting_cdate" value="CDATE" name="sorting" class="custom-control-input">
                  <label class="custom-control-label" for="sorting_cdate">최신 등록 순</label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" id="sorting_renddate" value="RENDDATE" name="sorting" class="custom-control-input">
                  <label class="custom-control-label" for="sorting_renddate">마감 임박 순</label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" id="sorting_likenum" value="LIKENUM" name="sorting" class="custom-control-input">
                  <label class="custom-control-label" for="sorting_likenum">관심 순</label>
                </div>
                
                <input type="hidden" value="${pi.currentPage}" name="page">
				</form>
              
              </div>
              
              
            </div>

          </section>
         
          <!-- Section: Block Content 상단 정렬 끝 -->

          <!--Section: Block Content 프로젝트 리스트 시작-->

            <script>
              //프로젝트 리스트 관련 함수들
              
              //검증된 클라이언트 툴팁
              $(function () {
                $('[data-toggle="tooltip"]').tooltip()
              })
              
              </script>
              

          <section id="projectList">

              <!-- Project List row 시작-->
            <c:forEach items="${list}" var="p">
            
            <c:url var="pdetail" value="searchProjectDetail.do">
            	<c:param name="id" value="${p.id}"/>
            	<c:param name="page" value="${pi.currentPage}"/>
            	<c:param name="mCategory" value="${p.mCategory}"/>
            	<c:param name="dCategory" value="${p.dCategory}"/>
            </c:url>
            
            <div class="row my-2 project">
              <div class="row mb-2 mx-auto" style="width: 100%;">
                <div class="col-md-12 px-0">
                  <div>
                  <div class="card flex-md-row mb-4 box-shadow h-md-250">
                    <div class="card-body d-flex flex-column align-items-start">

                      <!--배지-->
                      <div class="d-inline-block mb-2">
                       <c:choose>
                       	<c:when test="${p.project.proRecruit eq 'Y'}">
                       		<span class="badge badge-success">모집중</span>
                       	</c:when>
                       	<c:when test="${p.project.proRecruit eq 'N'}">
                       		<span class="badge badge-secondary">모집마감</span>
                       	</c:when>
                       </c:choose>
                       
                       <jsp:useBean id="today" class="java.util.Date"/>
                       
                       <jsp:useBean id="aweekAgo" class="java.util.Date"/>
                       <jsp:setProperty property="time" name="aweekAgo" value="${today.time-(1000*60*60*24*7)}"/>
                       <fmt:formatDate value="${today}" pattern="yyyyMMdd" var="now"/>
                       <fmt:formatDate value="${aweekAgo}" pattern="yyyyMMdd" var="ago"/>
                       <fmt:formatDate value="${p.project.proCreateDate}" pattern="yyyyMMdd" var="cdate"/>
                       
                       <c:if test="${cdate eq now}">
                       		<span class="badge badge-info">TODAY</span>
                       </c:if>
                       <c:if test="${cdate lt now}">
                       		<c:if test="${cdate gt ago}">
                       		<span class="badge badge-info">NEW</span>
                       		</c:if>
                       </c:if>  
                      </div>

                      <!--프로젝트명과 관심추가 버튼-->
                      <div style="width:100%;">
                      <h3 class="mb-0 float-left">
                        <a href="${pdetail}">${p.project.proName}</a>
                        <c:if test="${p.identify eq 'COMPLETE'}">
                        <a class="btn" data-toggle="tooltip" data-placement="right" title="이 프로젝트의 클라이언트는 신원인증을 완료했습니다."><i class="far fa-check-circle"></i></a>
                     	</c:if>
                      </h3>
                        <div class="float-right mr-3">
                        
                        <c:if test="${empty loginUser}">
                        <span class ="heart"><i class="fa fa-heart-o" aria-hidden="true" ></i></span>
                        </c:if>
                        
                        <c:if test="${not empty loginUser}">
                        
                       
                        <c:forEach items="${loginUser.likeList}" var="like">
                        
                        <c:if test="${p.id eq like.pList.id}">
                        <c:set var="isLike" value="Y"/>
                        <input type="hidden" name="likeId" value="${like.proLId}">
                        </c:if>
                        </c:forEach>
                        
                        <c:choose>
                        <c:when test="${isLike eq 'Y'}">
                        
                        <span class ="heart liked"><i class="fa fa-heart" aria-hidden="true" ></i></span>
                        
                        </c:when>
                        <c:otherwise>
                        <span class ="heart"><i class="fa fa-heart-o" aria-hidden="true" ></i></span>
                        </c:otherwise>
                        </c:choose>
                        
                        <c:remove var="isLike"/>
                        
                        </c:if>
                        
                          <label>관심</label>
                          <input type="hidden" name="pId" value="${p.id}">
                          
                        </div>
                      </div>
                      
                     
                      
                      <!--기획상태-->
                      <div class="project_plan_progress" style="width: 20rem;">
                        <p class="text-muted progress_label" style="float: left; margin-right: 1rem; margin-bottom: 0;font-size: 0.875rem;">기획상태</p>
                        <div class="progress mt-1">
                        
                        <c:choose>
                        <c:when test="${p.project.proPlanDetail eq 1}">
                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                            	20%
                          	</div>
                        </c:when>
                        <c:when test="${p.project.proPlanDetail eq 2}">
                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                            	40%
                          	</div>
                        </c:when>
                        <c:when test="${p.project.proPlanDetail eq 3}">
                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                            	60%
                          	</div>
                        </c:when>
                        <c:when test="${p.project.proPlanDetail eq 4}">
                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
                            	80%
                          	</div>
                        </c:when>
                        <c:when test="${p.project.proPlanDetail eq 5}">
                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 98%" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100">
                            	98%
                          	</div>
                        </c:when>
                        </c:choose>
                         
                        </div>
                      </div>

                      <!--요약내용-->
                      <div class="row mt-3 mb-3" style="width: 100%;">
                        <div class="col-md-9">
                         <table style="width:80%;height: 100%;">
                            <tr>
                              <td style="border-right:dashed 1px white"><label class="mr-3">예상 금액</label><label>
                              <fmt:setLocale value="ko"/><fmt:formatNumber value="${p.project.proPayment}" type="currency"/>
                              </label><label>원</label></td>
                              <td><label class="ml-3">${p.mCategory}</label></td>
                            </tr>
                            <tr>
                              <td style="border-right:dashed 1px white"><label class="mr-3">예상 기간</label><label>${p.project.proDuration}</label><label>일</label></td>
                              <td><label class="ml-3">${p.dCategory}</label></td>
                            </tr>
                         </table>
                        </div>
                        <div class="col-md-3">
                        
                        	<c:if test="${p.project.proRecruit eq 'Y'}">
                              <div class="mt-3" style="text-align: right;">
                                <i class="fas fa-history mr-3"></i><label>마감</label><label>
                                <fmt:parseNumber value="${(p.project.proREndDate.time-today.time)/(1000*60*60*24)+1}" integerOnly="true"/>
                                </label><label>일 전</label>
                              </div>
                            </c:if>
                            
                              <div style="text-align: right;">
                                <i class="fas fa-user mr-3"></i><label>총</label><label>
                                ${p.applyNum}
                                </label><label>명 지원</label>
                              </div>
                           
                        </div>

                      </div>

                      <!--세부내용-->
                      <div class="row mb-3" style="width: 100%; height: 100%;">
                        <div class="col-md-9">
                          <div class="card-text mb-4" style="font-size:0.875rem;">
                            <label>프로젝트 개요</label>
                            <textarea readonly maxlength="100">${p.project.proSummary}</textarea>
                          </div>
                          <table style="width:100%;">
                            <tr>
                              <td style="border-right: 1px dashed white;width:10%;">
                                <span class="badge badge-info">${p.workType}</span>
                              </td>
                              <td style="border-right: 1px dashed white;width: 40%;padding-left: 1rem;">
                              <c:forEach items="${tech}" var="tech">
                              	<c:if test="${p.id eq tech.pId}">
                                <a href="#" class="badge badge-secondary">${tech.tName}</a>
                                </c:if>
                              </c:forEach>  
                              </td>
                              <td style="width: 15%;padding-left:1rem;padding-top:0.375rem;font-size: 0.875rem;">
                                <i class="fas fa-map-marker-alt mr-2"></i><label>${p.project.proLocation}</label>
                              </td>
                              <td style="width: 35%;font-size: 0.875rem;">
                                <label class="mt-2 mr-2 ml-4 text-muted">등록일자:</label><label class="text-muted">
                               		${p.project.proCreateDate}
                                </label>
                              </td>
                            </tr>
                          </table>

                        </div>
                        <div class="col-md-3" style="height: 100%;border-top: 1px dashed white;">

                          <div class="mt-5" style="text-align: right;">
                            <i class="far fa-comment-dots mr-1"></i><label>${p.replyNum}</label>
                            <i class="far fa-heart mr-1"></i><label class="likeNum">${p.likeNum}</label>
                          </div>
                        </div>
                      </div>
                      
                    </div>
                   
                  </div>
                </div>
                </div>
              </div>

            </div>
            </c:forEach>
            
            <!-- Project list row 끝-->

          </section>
          <!--Section: Block Content project list 끝-->
          
           <c:choose>
            <c:when test="${empty loginUser}">
            <script>
           
            
            $(document).on("click",".heart",function(){
            	
                	  
              		location.href="loginpage.do";
               
            })
            
            
            </script>
            </c:when>
            <c:when test="${not empty loginUser}">
            <script>
              //찜하기 버튼 스크립트 +나중에 관심 프로젝트에 추가하는거 넣자
                                        
               
              
              $(document).on("click",".heart",function(){
            	
            	console.log("하트가 클릭되었다.")
              	var pId=$(this).parent().find("input[name='pId']").val();
              	var lId=$(this).parent().find("input[name='likeId']").val();
              	var newLId;
            	var memId="${loginUser.memId}";
            	
            	var $div=$(this).parent("div");
            	var $input=$("<input type='hidden'>").attr("name","likeId");
            	
            	if(memId==""){
            		//로그인 안 된 상태
            		location.href="loginpage.do";
            	}else{
            	
            		//로그인이 되었다.
            	
                if($(this).hasClass("liked")){
                	
                	console.log("like 클래스가 있다!")
                	
                	//관심등록 취소
                  $(this).html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
                  $(this).removeClass("liked");
                  
                  
                  $.ajax({
            			
            			url:"deleteLikeProject.do",
            			data:{lId:lId},
            			success:function(data){
            				if(data=="success"){
        						alert("관심 프로젝트 목록에서 삭제 되었습니다.")
        					
            				}
            			},
            			error:function(request, status, errorData){
                            alert("error code: " + request.status + "\n"
                                    +"message: " + request.responseText
                                    +"error: " + errorData);
                           }  
            			
            		})
             
                  
                }else{
                	
                	console.log("like 클래스가 없다!");
                	
                	//관심 등록
                  $(this).html('<i class="fa fa-heart" aria-hidden="true"></i>');
                  $(this).addClass("liked");
                  
                  $.ajax({
          			
          			url:"addLikeProject.do",
          			data:{pId:pId,memId:memId},
          			dataType:"json",
          			success:function(data){
          				
      						alert("관심 프로젝트로 등록 되었습니다.");
      						newLId=data.likeId;
      						//input hidden 태그 붙여주어야 한다.
      						$input.val(newLId);
      						$div.append($input);
      						
          				
          			},
          			error:function(request, status, errorData){
                          alert("error code: " + request.status + "\n"
                                  +"message: " + request.responseText
                                  +"error: " + errorData);
                         }  
          			
          		})
                  
                }
            		
                console.log("제3의 길을 간다..");
                
            	}
            	  
              })
              
              
              </script>
        
            </c:when>
            </c:choose>
            
            <script>
            
            $(document).on("click",".projectTitle",function(){
            	
            	var pId=$(this).parent().parent().find("input").val();
            	var mCate=$(this).parents(".card-body").find(".mCate").text();
            	var dCate=$(this).parents(".card-body").find(".dCate").text();
            	var page=${pi.currentPage};
            	
            	location.href="searchProjectDetail.do?id="+pId+"&page="+page+"&mCategory="+mCate+"&$dCategory="+dCate;
            	
            })
            
            </script>
           

          <!-- Section: Block Content 하단 페이지네이션 시작 -->
          <section class="mt-5 mb-5" id="pagination">

            <div class="row d-flex justify-content-around align-items-center">

              <!--페이지네이션-->
              <div class="col-12 col-md-4 text-center">
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-center mb-0 text-dark">
                  	<c:if test="${pi.currentPage eq 1 }">
                    <li class="page-item"><a class="page-link"><i class="fas fa-chevron-left"></i></a></li>
                    </c:if>
                    <c:if test="${pi.currentPage gt 1}">
                    <c:url var="plistBack" value="searchProjectList.do">
                    	<c:param name="page" value="${pi.currentPage-1}"/>
                    	<c:param name="filter" value="${filter}"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${plistBack}"><i class="fas fa-chevron-left"></i></a></li>
                    </c:if>
                    
                    <c:forEach begin="${pi.startPage}" end="${pi.endPage}" step="1" var="pn">
                    <c:if test="${pi.currentPage eq pn}">
                    <li class="page-item active"><a class="page-link">${pn}</a></li>
                    </c:if>
                    <c:if test="${pi.currentPage ne pn}">
                    <c:url var="plistCheck" value="searchProjectList.do">
                    <c:param name="page" value="${pn}"/>
                    <c:param name="filter" value="${filter}"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${plistCheck}">${pn}</a></li>
                    </c:if>
                    </c:forEach>
                   
                    <c:if test="${pi.currentPage eq pi.maxPage}">
                    <li class="page-item"><a class="page-link"><i class="fas fa-chevron-right"></i></a></li>
                  	</c:if>
                  	<c:if test="${pi.currentPage lt pi.maxPage}">
                  	<c:url var="plistFront" value="searchProjectList.do">
                    	<c:param name="page" value="${pi.currentPage+1}"/>
                    	<c:param name="filter" value="${filter}"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${plistFront}"><i class="fas fa-chevron-right"></i></a></li>
                  	</c:if>
                  </ul>
                </nav>
              </div>
            </div>

          </section>
          <!-- Section: Block Content 페이지 네이션 끝 -->
          
          <script>
          //ajax로 붙인 페이지 네이션 조작하기
          
          $(document).on("click",".goBack",function(){
        	  var page=${pi.currentPage}-1;
        	  console.log("뒤로 가줘"+page);
        	  location.href="searchProjectList.do?page="+page;
        	 
          })
          
           $(document).on("click",".goFront",function(){
        	  var page=${pi.currentPage}+1;
        	  console.log("앞으로 가줘"+page);
        	  location.href="searchProjectList.do?page="+page;
          })
          
           $(document).on("click",".goThisNum",function(){
        	  var page=$(this).text();
        	  console.log("이 숫자로 가줘"+page);
        	  location.href="searchProjectList.do?page="+page;
          })
          
          
          
          </script>

        </div>
        <!-- 프로젝트 리스트 column 끝-->


        <div class="col-md-2 mb-4" style="text-align: center;">
          
        </div>

      </div>
      <!--row 끝 왼/중/오-->

    <!--컨테이너 끝-->

  
  </main>
  <!--Main layout-->
  
  <jsp:include page="../../common/footer.jsp"></jsp:include>


</body>
</html>