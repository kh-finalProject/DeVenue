<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      font-size: 0.8rem;
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
        background-color: gray;
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

<jsp:include page="../common/menubar.jsp"></jsp:include>

<main>
    <div class="container-fluid">

      <div class="row" style="height: 6.25rem;">
        <div class="col-md-2" ></div>
        <div class="col-md-2 pl-0" style="border-bottom: 0.0625rem solid gray;">
        <h5 class="pt-5">프로젝트 찾기</h5>
        </div>
          <div id="searchDiv" class="col-md-6 mt-5 px-0" style="border-bottom: 0.0625rem solid gray;">
            <div class="float-right">
            <form>
              <div id="searchDiv_category" class="dropdown" style="display: inline-block;">
                <button class="btn btn-light dropdown-toggle mb-1 text-right" style="box-shadow: none;width: 10rem;height: 2.75rem;" type="button" id="searchDrop" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  	전체
                </button>
                <div class="dropdown-menu text-right" aria-labelledby="searchDrop">
                  <a class="dropdown-item" href="#">전체</a>
                  <a class="dropdown-item" href="#">제목</a>
                  <a class="dropdown-item" href="#">관련기술</a>
                  <a class="dropdown-item" href="#">프로젝트 상세</a>
                </div>
              </div>
              <div class="autocomplete" style="width:18.75rem;">
                <input id="search_text" type="text" name="techName" placeholder="검색어를 입력하세요.">
              </div>
              <button type="button" class="btn btn-outline-info mb-1" style="width:6.25rem;height: 2.75rem;">검색</button>
            </form>
            </div>
          </div>

          <script>

            $("#searchDiv_category>div>a").click(function(){
              var selected=$(this).text();
              $("#searchDiv_category>button").text(selected);
            })


          </script>

          <script>

            $("#searchDiv_category>div>a").click(function(){

              if($(this).text()=="관련기술"){

                var languages=["java","JAVA","자바","oracle","ORACLE","javascript","js","자바스크립트","css","CSS","HTML5"];

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

          <!-- Section: Sidebar 시작 -->


          <section>

            <!-- Section: 프로젝트 진행 방식 시작 -->
            <section class="mb-5">
              <h6 class="font-weight-bold mb-3">프로젝트 진행 방식
                <i tabindex="0" role="button"  data-trigger="focus" id="process_notice" class="fas fa-exclamation-circle"></i>
              </h6>

              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="process_outsource" />
                <label class="form-check-label small" for="process_outsource">외주(도급)</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="process_insource" />
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
                <input type="checkbox" class="form-check-input" id="main_category_develop" />
                <label class="form-check-label small" for="main_category_develop">개발</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="main_category_design" />
                <label class="form-check-label small" for="main_category_design">디자인</label>
              </div>

            </section>
            <!-- Section: 프로젝트 대표 카테고리 끝 -->

             <!-- Section: 프로젝트 세부 카테고리 시작 -->
             <section class="mb-5">
              <h6 class="font-weight-bold mb-3">프로젝트 세부 카테고리</h6>

              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="sub_category_web" />
                <label class="form-check-label small" for="sub_category_web">웹</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="sub_category_app" />
                <label class="form-check-label small" for="sub_category_app">애플리케이션</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="sub_category_pub" />
                <label class="form-check-label small" for="sub_category_pub">퍼블리싱</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="sub_category_etc" />
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
                <div id="cost_min_menu" class="dropdown-menu" style="max-height:7.5rem; overflow-y: auto;">
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
                  })

              </script>


              <div class="mb-3">
                <div class="btn-group">
                  <button id="cost_btn_max" style="width: 7.5rem; box-shadow: none;" class="btn btn-light btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    	금액 선택
                  </button>
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
                    <label class="small ml-3 mr-2">원</label><button class="btn btn-outline-info btn-sm rounded" type="button">적용</button>
                  </div>
                  </div>
            </section>

            <section>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="cost_custom_check" />
                <label class="form-check-label small" for="cost_custom">직접입력</label>
                <a class="btn btn-link text-muted p-0 ml-5"  href="#" style="font-size: 1rem;">초기화</a>
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
                   
                    var minCost="";
                    var refined="";

                    minCost=$(this).val();
                    
                    if(minCost.includes(",")){
                      refined=removeCommas(minCost);
                     
                    }else{
                      refined=minCost;
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

            </script>
            </section>
            <!-- Section: 프로젝트 예상 금액 끝 -->





            <!-- Section: 검증된 클라이언트 시작 -->
            <section class="mb-5">
              <h6 class="font-weight-bold mb-3">검증된 클라이언트</h6>

              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="highRate"/>
                <label class="form-check-label small" for="highRate">평가우수</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="qualified" />
                <label class="form-check-label small" for="qualified">인증완료</label>
              </div>
              
            </section>
            <!-- Section: 검증된 클라이언트 끝 -->

            <!-- Section: 클라이언트 위치 시작 -->
            <section class="mb-5">
              <h6 class="font-weight-bold mb-3">클라이언트 위치</h6>

              <section id="location_display">
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" name="location_modal_check" id="m_seoul" value="서울특별시"/>
                <label class="form-check-label small" for="m_seoul">서울특별시</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" name="location_modal_check" id="m_kyeongki" value="경기도" />
                <label class="form-check-label small" for="m_kyeongki">경기도</label>
              </div>
              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" name="location_modal_check" id="m_pusan" value="부산광역시" />
                <label class="form-check-label small" for="m_pusan">부산광역시</label>
              </div>
            </section>
              <a id="location_add" class="btn btn-link text-muted p-0" data-toggle="modal" href="#location_modal" aria-expanded="false" aria-controls="collapseExample" style="font-size: 1rem;">
              +클라이언트 위치 추가
              </a>
            </section>

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
                    <table width="100%" id="location_modal_table">
                      <tr style="height: 1.875rem;">
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_seoul" name="location_modal_check" value="서울특별시"/>
                            <label class="form-check-label" for="m_seoul">서울특별시</label>
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
                            <input type="checkbox" class="form-check-input" id="m_pusan" name="location_modal_check" value="부산광역시"/>
                            <label class="form-check-label" for="m_pusan">부산광역시</label>
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
                            <input type="checkbox" class="form-check-input" id="m_incheon" name="location_modal_check" value="인천광역시"/>
                            <label class="form-check-label" for="m_incheon">인천광역시</label>
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
                            <input type="checkbox" class="form-check-input" id="m_daejeon" name="location_modal_check" value="대전광역시"/>
                            <label class="form-check-label" for="m_daejeon">대전광역시</label>
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
                            <input type="checkbox" class="form-check-input" id="m_daegu" name="location_modal_check" value="대구광역시"/>
                            <label class="form-check-label" for="m_daegu">대구광역시</label>
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
                            <input type="checkbox" class="form-check-input" id="m_kwangju" name="location_modal_check" value="광주광역시"/>
                            <label class="form-check-label" for="m_kwangju">광주광역시</label>
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
                            <input type="checkbox" class="form-check-input" id="m_ulsan" name="location_modal_check" value="울산광역시"/>
                            <label class="form-check-label" for="m_ulsan">울산광역시</label>
                          </div>
                        </td>
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_jeju" name="location_modal_check" value="제주특별자치도"/>
                            <label class="form-check-label" for="m_jeju">제주특별자치도</label>
                          </div>
                        </td>
                      </tr>

                      <tr style="height:1.875rem;">
                        <td>
                          <div class="form-check ml-2">
                            <input type="checkbox" class="form-check-input" id="m_sejong" name="location_modal_check" value="세종특별자치시"/>
                            <label class="form-check-label" for="m_sejong">세종특별자치시</label>
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
            <!-- Section: 클라이언트 위치 끝 -->

             <!-- Section: 지원자 모집 상태 시작 -->
             <section class="mb-5">
              <h6 class="font-weight-bold mb-3">지원자 모집 상태</h6>

              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="hide_finished" />
                <label class="form-check-label small" for="hide_finished">모집 마감 숨기기</label>
              </div>

            </section>
            <!-- Section: 지원자 모집 상태 끝 -->

            


          </section>
          <!-- Section: Sidebar의 끝 -->

        </div>
        <!--Grid column 사이드바 column 끝-->

        <!--Grid column 프로젝트 리스트 시작-->
        <div class="col-md-6 mb-4">

          <h4><strong>25,716</strong>개의 프로젝트</h4>
          <button class="btn btn-outline-info" style="box-shadow: none;" type="button" data-toggle="collapse" data-target="#sortingDiv">정렬하기</button>

          <!-- 정렬하기 Section: Block Content -->
          <section class="ml-3 mt-5 mb-4">
            
            <div class="row d-flex justify-content-around align-items-center">
              <div class="col-md-1">
                
              </div>

              <div id="sortingDiv" class="collapse col-md-11 text-right" style="width:100%;height:3.125rem;">

                <div class="custom-control custom-radio custom-control-inline mt-3">
                  <input type="radio" id="sorting_apply" name="sorting" class="custom-control-input">
                  <label class="custom-control-label" for="sorting_apply">지원 많은 순</label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" id="sorting_payment" name="sorting" class="custom-control-input">
                  <label class="custom-control-label" for="sorting_payment">금액 높은 순</label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" id="sorting_payment" name="sorting" class="custom-control-input">
                  <label class="custom-control-label" for="sorting_payment">최신 등록 순</label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" id="sorting_payment" name="sorting" class="custom-control-input">
                  <label class="custom-control-label" for="sorting_payment">마감 임박 순</label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" id="sorting_payment" name="sorting" class="custom-control-input">
                  <label class="custom-control-label" for="sorting_payment">관심 순</label>
                </div>

              
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
              <script>
              //찜하기 버튼 스크립트 +나중에 관심 프로젝트에 추가하는거 넣자
                                        
                $(function(){
                  $(".heart").click(function(){
                    if($(this).hasClass("liked")){
                      $(this).html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
                      $(this).removeClass("liked");
                    }else{
                      $(this).html('<i class="fa fa-heart" aria-hidden="true"></i>');
                      $(this).addClass("liked");
                    }
                  });
                });
              </script>

          <section id="projectList">

              <!-- Project List row 시작-->
            <c:forEach items="${list}" var="p">
            <div class="row my-2" id="products">
              <div class="row mb-2 mx-auto" style="width: 100%;">
                <div class="col-md-12 px-0">
                  <div>
                  <div class="card flex-md-row mb-4 box-shadow h-md-250">
                    <div class="card-body d-flex flex-column align-items-start">

                      <!--배지-->
                      <div class="d-inline-block mb-2">
                       <c:choose>
                       	<c:when test="${p.recruit eq 'Y'}">
                       		<span class="badge badge-secondary">모집중</span>
                       	</c:when>
                       	<c:when test="${p.recruit eq 'N'}">
                       		<span class="badge badge-success">모집마감</span>
                       	</c:when>
                       </c:choose>
                       
                       <jsp:useBean id="today" class="java.util.Date"/>
                       
                       <jsp:useBean id="aweekAgo" class="java.util.Date"/>
                       <jsp:setProperty property="time" name="aweekAgo" value="${today.time-(1000*60*60*24*7)}"/>
                       <fmt:formatDate value="${today}" pattern="yyyyMMdd" var="now"/>
                       <fmt:formatDate value="${aweekAgo}" pattern="yyyyMMdd" var="ago"/>
                       <fmt:formatDate value="${p.cDate}" pattern="yyyyMMdd" var="cdate"/>
                       
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
                        <a href="#">${p.name}</a>
                        <c:if test="${p.identify eq 'COMPLETE'}">
                        <a class="btn" data-toggle="tooltip" data-placement="right" title="이 프로젝트의 클라이언트는 신원인증을 완료했습니다."><i class="far fa-check-circle"></i></a>
                     	</c:if>
                      </h3>
                        <div class="float-right mr-3">
                          <span class ="heart"><i class="fa fa-heart-o" aria-hidden="true" ></i></span>
                          <label for="heart">관심</label>
                        </div>
                      </div>
                      
                     
                      
                      <!--기획상태-->
                      <div class="project_plan_progress" style="width: 20rem;">
                        <p class="text-muted progress_label" style="float: left; margin-right: 1rem; margin-bottom: 0;font-size: 0.875rem;">기획상태</p>
                        <div class="progress mt-1">
                        
                        <c:choose>
                        <c:when test="${p.planDetail eq 1}">
                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                            	20%
                          	</div>
                        </c:when>
                        <c:when test="${p.planDetail eq 2}">
                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                            	40%
                          	</div>
                        </c:when>
                        <c:when test="${p.planDetail eq 3}">
                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                            	60%
                          	</div>
                        </c:when>
                        <c:when test="${p.planDetail eq 4}">
                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
                            	80%
                          	</div>
                        </c:when>
                        <c:when test="${p.planDetail eq 5}">
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
                              <fmt:setLocale value="ko"/><fmt:formatNumber value="${p.payment}" type="currency"/>
                              </label><label>원</label></td>
                              <td><label class="ml-3">${p.mCategory}</label></td>
                            </tr>
                            <tr>
                              <td style="border-right:dashed 1px white"><label class="mr-3">예상 기간</label><label>${p.duration}</label><label>일</label></td>
                              <td><label class="ml-3">${p.dCategory}</label></td>
                            </tr>
                         </table>
                        </div>
                        <div class="col-md-3">
                        
                              <div class="mt-3" style="text-align: right;">
                                <i class="fas fa-history mr-3"></i><label>마감</label><label>
                                <fmt:parseNumber value="${(p.rEndDate.time-today.time)/(1000*60*60*24)}" integerOnly="true"/>
                                </label><label>일 전</label>
                              </div>
                            
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
                            <textarea readonly maxlength="100">${p.summary}</textarea>
                          </div>
                          <table style="width:100%; height: 20px;">
                            <tr>
                              <td style="border-right: 1px dashed white;width:20%;">
                                <span class="badge badge-info">${p.workType}</span>
                              </td>
                              <td style="border-right: 1px dashed white;width: 40%;padding-left: 1rem;">
                              <c:forEach items="${p.techName}" var="tech">
                                <a href="#" class="badge badge-secondary">${tech.tName}</a>
                              </c:forEach>  
                              </td>
                              <td style="width: 10%;padding-left:1rem;padding-top:0.375rem;font-size: 0.875rem;">
                                <i class="fas fa-map-marker-alt mr-2"></i><label>${p.location}</label>
                              </td>
                              <td style="width: 30%;font-size: 0.875rem;">
                                <label class="mt-2 mr-2 ml-4 text-muted">등록일자:</label><label class="text-muted">
                               		${p.cDate}
                                </label>
                              </td>
                            </tr>
                          </table>

                        </div>
                        <div class="col-md-3" style="height: 100%;border-top: 1px dashed white;">

                          <div class="mt-5" style="text-align: right;">
                            <i class="far fa-comment-dots mr-1"></i><label>${p.replyNum}</label>
                            <i class="far fa-heart mr-1"></i><label>${p.likeNum}</label>
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
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${plistFront}"><i class="fas fa-chevron-right"></i></a></li>
                  	</c:if>
                  </ul>
                </nav>
              </div>
            </div>

          </section>
          <!-- Section: Block Content 페이지 네이션 끝 -->

        </div>
        <!-- 프로젝트 리스트 column 끝-->


        <div class="col-md-2 mb-4" style="text-align: center;">
          
        </div>

      </div>
      <!--row 끝 왼/중/오-->

    <!--컨테이너 끝-->

  
  </main>
  <!--Main layout-->
  
  <jsp:include page="../common/footer.jsp"></jsp:include>


</body>
</html>